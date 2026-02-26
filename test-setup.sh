#!/bin/bash
# Test Environment Setup Script for GEMMA Softwarecatalogus
# Creates test organizations, contact persons, and links users.
# Run after clean-env.sh and user account creation.
#
# Prerequisites:
#   - Nextcloud running at localhost:8080 with admin:admin
#   - OpenRegister app enabled with voorzieningen register loaded
#   - User accounts already created (see create-test-users section below)
#
# Usage:
#   bash Softwarecatalogus/test-setup.sh
#   BACKEND_URL="https://example.com" ADMIN_USER="user" ADMIN_PASS="pass" bash Softwarecatalogus/test-setup.sh
#   FORCE_BUILD=1 bash Softwarecatalogus/test-setup.sh          # Rebuild all frontend apps
#   CLEANUP_DUPLICATES=1 bash Softwarecatalogus/test-setup.sh   # Remove duplicate test objects from previous runs

set -euo pipefail

NC_URL="${BACKEND_URL:-http://localhost:8080}"
BASE_URL="${NC_URL}/index.php/apps/openregister/api"
ADMIN_AUTH="${ADMIN_USER:-admin}:${ADMIN_PASS:-admin}"
PASSWORD="WelcomeToTest2026"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== Softwarecatalogus Test Setup ==="
echo ""

# ─────────────────────────────────────────────
# Step 0: Pre-flight checks
# Stop conflicting containers, build frontend apps.
# ─────────────────────────────────────────────
echo "--- Step 0: Pre-flight checks ---"

# 0a. Stop tilburg-woo-ui-hot if running (frees port 3000 for the SPA)
if docker ps --format '{{.Names}}' 2>/dev/null | grep -q 'tilburg-woo-ui-hot'; then
    echo "  Stopping tilburg-woo-ui-hot container (frees port 3000)..."
    docker stop openregister-tilburg-woo-ui-hot 2>/dev/null || true
    echo "  Stopped."
else
    echo "  tilburg-woo-ui-hot not running (port 3000 is free)."
fi

# 0b. Build frontend apps if sources are newer than builds
build_if_needed() {
    local app_dir="$1"
    local app_name="$2"
    local build_dir="${app_dir}/js"

    if [ ! -d "$app_dir" ]; then
        echo "  SKIP: ${app_name} directory not found"
        return
    fi

    # Check if build output exists
    if [ -d "$build_dir" ] && [ -n "$(ls -A "$build_dir" 2>/dev/null)" ]; then
        echo "  ${app_name}: build exists (use FORCE_BUILD=1 to rebuild)"
    else
        echo "  ${app_name}: no build found, building..."
        (cd "$app_dir" && npm run build 2>&1 | tail -1) || echo "  WARN: ${app_name} build failed"
    fi
}

if [ "${FORCE_BUILD:-0}" = "1" ]; then
    echo "  FORCE_BUILD=1 — rebuilding all frontend apps..."
    for app in openregister opencatalogi; do
        app_dir="${WORKSPACE_DIR}/${app}"
        if [ -d "$app_dir/src" ]; then
            echo "  Building ${app}..."
            (cd "$app_dir" && npm run build 2>&1 | tail -1) || echo "  WARN: ${app} build failed"
        fi
    done
    # tilburg-woo-ui uses a different build command
    twui_dir="${WORKSPACE_DIR}/tilburg-woo-ui"
    if [ -d "$twui_dir" ]; then
        echo "  Building tilburg-woo-ui..."
        docker exec openregister-tilburg-woo-ui sh -c "npm run build:web" 2>&1 | tail -1 || echo "  WARN: tilburg-woo-ui build failed"
    fi
else
    build_if_needed "${WORKSPACE_DIR}/openregister" "openregister"
    build_if_needed "${WORKSPACE_DIR}/opencatalogi" "opencatalogi"
    # tilburg-woo-ui builds inside its container
    if docker ps --format '{{.Names}}' 2>/dev/null | grep -q 'openregister-tilburg-woo-ui'; then
        echo "  tilburg-woo-ui: container running (build managed by container)"
    else
        echo "  tilburg-woo-ui: container not running — start with docker compose up"
    fi
fi

# 0c. Verify Nextcloud is reachable
if ! curl -sf -o /dev/null "${NC_URL}/status.php" 2>/dev/null; then
    echo "  ERROR: Nextcloud not reachable at ${NC_URL}"
    echo "  Start the environment first: docker compose -f openregister/docker-compose.yml up -d"
    exit 1
fi
echo "  Nextcloud is reachable at ${NC_URL}"

echo ""

# ─────────────────────────────────────────────
# Step 1: Create Nextcloud user accounts
# ─────────────────────────────────────────────
echo "--- Step 1: Creating Nextcloud user accounts ---"

create_user() {
    local userid="$1"
    local display="$2"
    local email="$3"

    # Create user (may already exist — that's ok)
    response=$(curl -s -o /dev/null -w "%{http_code}" \
        -X POST "${NC_URL}/ocs/v2.php/cloud/users" \
        -u "${ADMIN_AUTH}" \
        -H "OCS-APIRequest: true" \
        -d "userid=${userid}" \
        --data-urlencode "password=${PASSWORD}" \
        -d "displayName=${display}" \
        -d "email=${email}")

    if [ "$response" = "200" ]; then
        echo "  Created user: ${userid}"
    else
        # User exists — reset password to ensure it matches expected value
        curl -s -o /dev/null \
            -X PUT "${NC_URL}/ocs/v2.php/cloud/users/$(echo "$userid" | sed 's/@/%40/g')" \
            -u "${ADMIN_AUTH}" \
            -H "OCS-APIRequest: true" \
            -d "key=password" \
            --data-urlencode "value=${PASSWORD}"
        echo "  User ${userid} exists (password reset)"
    fi
}

add_to_group() {
    local userid="$1"
    local group="$2"

    curl -s -o /dev/null \
        -X POST "${NC_URL}/ocs/v2.php/cloud/users/${userid}/groups" \
        -u "${ADMIN_AUTH}" \
        -H "OCS-APIRequest: true" \
        --data-urlencode "groupid=${group}" 2>/dev/null
}

# Ensure groups exist
for group in aanbod-beheerder gebruik-beheerder functioneel-beheerder software-catalog-users software-catalog-admins; do
    curl -s -o /dev/null \
        -X POST "${NC_URL}/ocs/v2.php/cloud/groups" \
        -u "${ADMIN_AUTH}" \
        -H "OCS-APIRequest: true" \
        -d "groupid=${group}" 2>/dev/null
done
echo "  Groups ensured."

# Create users
create_user "jan.pietersen@test.nl"    "Jan Pietersen"       "jan.pietersen@test.nl"
create_user "jan.vandeberg@testleverancier.nl" "Jan van de Berg" "jan.vandeberg@testleverancier.nl"
create_user "maria.vanderberg@test.nl" "Maria van der Berg"  "maria.vanderberg@test.nl"
create_user "mark.jansen@test.nl"      "Mark Jansen"         "mark.jansen@test.nl"
create_user "linda.bakker@test.nl"     "Linda Bakker"        "linda.bakker@test.nl"
create_user "peter.vandijk@test.nl"    "Peter van Dijk"      "peter.vandijk@test.nl"
create_user "sarah.devries@test.nl"    "Dr. Sarah de Vries"  "sarah.devries@test.nl"

# Assign groups
echo "  Assigning groups..."
add_to_group "jan.pietersen@test.nl"    "aanbod-beheerder"
add_to_group "jan.pietersen@test.nl"    "software-catalog-users"

add_to_group "jan.vandeberg@testleverancier.nl" "aanbod-beheerder"
add_to_group "jan.vandeberg@testleverancier.nl" "software-catalog-users"

add_to_group "maria.vanderberg@test.nl" "gebruik-beheerder"
add_to_group "maria.vanderberg@test.nl" "software-catalog-users"

add_to_group "mark.jansen@test.nl"      "gebruik-beheerder"
add_to_group "mark.jansen@test.nl"      "software-catalog-users"

add_to_group "linda.bakker@test.nl"     "gebruik-beheerder"
add_to_group "linda.bakker@test.nl"     "software-catalog-users"

add_to_group "peter.vandijk@test.nl"    "functioneel-beheerder"
add_to_group "peter.vandijk@test.nl"    "gebruik-beheerder"
add_to_group "peter.vandijk@test.nl"    "aanbod-beheerder"
add_to_group "peter.vandijk@test.nl"    "software-catalog-admins"
add_to_group "peter.vandijk@test.nl"    "software-catalog-users"

add_to_group "sarah.devries@test.nl"    "gebruik-beheerder"
add_to_group "sarah.devries@test.nl"    "software-catalog-users"

echo "  Groups assigned."

# ─────────────────────────────────────────────
# Step 2: Clear rate limiting / brute force
# ─────────────────────────────────────────────
echo ""
echo "--- Step 2: Clearing rate limiting ---"
docker exec nextcloud php occ security:bruteforce:reset 127.0.0.1 2>/dev/null || true
docker exec nextcloud apachectl -k graceful 2>/dev/null || true
sleep 2  # Wait for Apache restart + OPcache flush
echo "  Done."

# ─────────────────────────────────────────────
# Step 3: Find or create organisations
# We need TWO types of UUIDs per org:
#   - NC UUID: Nextcloud org UUID for join/activate (RBAC system)
#   - REG UUID: Register object UUID for data fields (organisatie, geregistreerdDoor)
# ─────────────────────────────────────────────
echo ""
echo "--- Step 3: Finding/creating organisations ---"

# Cache the full Nextcloud organisations list once
ALL_NC_ORGS=$(curl -s -u "${ADMIN_AUTH}" "${BASE_URL}/organisations?_limit=500")

find_nc_org_uuid() {
    local name="$1"
    echo "$ALL_NC_ORGS" | python3 -c "
import sys, json
d = json.load(sys.stdin)
for r in d.get('results', []):
    if r.get('name', '') == '${name}':
        print(r['uuid'])
        break
" 2>/dev/null
}

create_nc_org() {
    local name="$1"
    local type="$2"
    curl -s -X POST "${BASE_URL}/organisations" \
        -H 'Content-Type: application/json' \
        -u "${ADMIN_AUTH}" \
        -d "{\"name\": \"${name}\", \"type\": \"${type}\"}" \
        | python3 -c "import sys,json; print(json.load(sys.stdin).get('organisation',{}).get('uuid',''))" 2>/dev/null
}

find_reg_org_uuid() {
    local name="$1"
    curl -s -u "${ADMIN_AUTH}" \
        "${BASE_URL}/objects/voorzieningen/organisatie?_search=$(echo "$name" | sed 's/ /+/g')&_limit=5" \
        | python3 -c "
import sys, json
d = json.load(sys.stdin)
for r in d.get('results', []):
    if r.get('naam', '') == '${name}':
        print(r.get('@self', {}).get('id', ''))
        break
" 2>/dev/null
}

create_reg_org() {
    local name="$1"
    local type="$2"
    curl -s -X POST "${BASE_URL}/objects/voorzieningen/organisatie" \
        -H 'Content-Type: application/json' \
        -u "${ADMIN_AUTH}" \
        -d "{
            \"naam\": \"${name}\",
            \"type\": \"${type}\",
            \"status\": \"Actief\"
        }" | python3 -c "import sys,json; print(json.load(sys.stdin).get('id',''))" 2>/dev/null
}

setup_org() {
    local name="$1"
    local type="$2"

    # Find or create Nextcloud org
    local nc_uuid=$(find_nc_org_uuid "$name")
    if [ -z "$nc_uuid" ]; then
        nc_uuid=$(create_nc_org "$name" "$type")
        if [ -n "$nc_uuid" ]; then
            echo "  Created NC org: ${name} (${nc_uuid})" >&2
        else
            echo "  WARN: Failed to create NC org: ${name}" >&2
        fi
    else
        echo "  Found NC org: ${name} (${nc_uuid})" >&2
    fi

    # Find or create register org object
    local reg_uuid=$(find_reg_org_uuid "$name")
    if [ -z "$reg_uuid" ]; then
        reg_uuid=$(create_reg_org "$name" "$type")
        if [ -n "$reg_uuid" ]; then
            echo "  Created register org: ${name} (${reg_uuid})" >&2
        else
            echo "  WARN: Failed to create register org: ${name}" >&2
        fi
    else
        echo "  Found register org: ${name} (${reg_uuid})" >&2
    fi

    # Return both UUIDs: "nc_uuid reg_uuid"
    echo "${nc_uuid} ${reg_uuid}"
}

read LEVER_NC LEVER_REG <<< "$(setup_org 'Test Leverancier BV' 'Leverancier')"
read GEMEENTE_NC GEMEENTE_REG <<< "$(setup_org 'Test Gemeente' 'Gemeente')"
read SAMENWERKING_NC SAMENWERKING_REG <<< "$(setup_org 'Test Samenwerking' 'Samenwerking')"
read LEVER2_NC LEVER2_REG <<< "$(setup_org 'Test Leverancier 2' 'Leverancier')"

echo ""
echo "  Summary:"
echo "    Test Leverancier BV  NC=${LEVER_NC} REG=${LEVER_REG}"
echo "    Test Gemeente        NC=${GEMEENTE_NC} REG=${GEMEENTE_REG}"
echo "    Test Samenwerking    NC=${SAMENWERKING_NC} REG=${SAMENWERKING_REG}"
echo "    Test Leverancier 2   NC=${LEVER2_NC} REG=${LEVER2_REG}"

# ─────────────────────────────────────────────
# Step 4: Join users to their organizations and set active
# (MUST happen before creating objects so system `organisation` field is correct)
# ─────────────────────────────────────────────
echo ""
echo "--- Step 4: Joining users to organizations ---"

join_and_activate() {
    local username="$1"
    local org_uuid="$2"
    local org_name="$3"

    # Join (user must auth as themselves)
    curl -s -X POST "${BASE_URL}/organisations/${org_uuid}/join" \
        -H 'Content-Type: application/json' \
        -u "${username}:${PASSWORD}" > /dev/null 2>&1

    # Set active
    curl -s -X POST "${BASE_URL}/organisations/${org_uuid}/set-active" \
        -H 'Content-Type: application/json' \
        -u "${username}:${PASSWORD}" > /dev/null 2>&1

    echo "  ${username} -> ${org_name} (joined + active)"
}

join_and_activate "jan.pietersen@test.nl"    "$LEVER_NC"       "Test Leverancier BV"
join_and_activate "jan.vandeberg@testleverancier.nl" "$LEVER2_NC" "Test Leverancier 2"
join_and_activate "maria.vanderberg@test.nl" "$GEMEENTE_NC"    "Test Gemeente"
join_and_activate "mark.jansen@test.nl"      "$GEMEENTE_NC"    "Test Gemeente"
join_and_activate "linda.bakker@test.nl"     "$SAMENWERKING_NC" "Test Samenwerking"

# Peter and Sarah stay in Default Organisation (admin/VNG roles)
echo "  peter.vandijk@test.nl -> Default Organisation (admin)"
echo "  sarah.devries@test.nl -> Default Organisation (VNG)"

# Seed Nextcloud user profile fields (firstName, lastName, middleName, functie)
# These are stored separately from contactpersoon objects and used by /api/user/me
echo ""
echo "  Seeding user profile fields..."

seed_profile() {
    local username="$1"
    local first="$2"
    local last="$3"
    local functie="$4"
    local middle="${5:-}"

    local data="{\"firstName\":\"${first}\",\"lastName\":\"${last}\",\"functie\":\"${functie}\""
    if [ -n "$middle" ]; then
        data="${data},\"middleName\":\"${middle}\""
    fi
    data="${data}}"

    curl -s -X PUT "${BASE_URL}/user/me" \
        -H 'Content-Type: application/json' \
        -u "${username}:${PASSWORD}" \
        -d "${data}" > /dev/null 2>&1

    echo "    ${username}: ${first} ${middle} ${last} (${functie})"
}

seed_profile "jan.pietersen@test.nl"    "Jan"    "Pietersen"  "CEO"
seed_profile "jan.vandeberg@testleverancier.nl" "Jan" "Berg" "Directeur" "van de"
seed_profile "maria.vanderberg@test.nl" "Maria"  "Berg"       "ICT-coördinator" "van der"
seed_profile "mark.jansen@test.nl"      "Mark"   "Jansen"     "Security Officer"
seed_profile "linda.bakker@test.nl"     "Linda"  "Bakker"     "Coördinator"
seed_profile "peter.vandijk@test.nl"    "Peter"  "Dijk"       "Functioneel Beheerder" "van"
seed_profile "sarah.devries@test.nl"    "Sarah"  "Vries"      "Enterprise Architect"  "de"

# ─────────────────────────────────────────────
# Step 5: Create contact persons (as the user themselves, NOT admin)
# Using user credentials ensures the system `organisation` field matches
# the user's active org — this is what RBAC filters on.
# ─────────────────────────────────────────────
echo ""
echo "--- Step 5: Creating contact persons ---"

create_contact() {
    local voornaam="$1"
    local achternaam="$2"
    local email="$3"
    local telefoon="$4"
    local functie="$5"
    local org_uuid="$6"
    local tussenvoegsel="${7:-}"
    local user_auth="${email}:${PASSWORD}"

    # Check if contact already exists by searching objects as the user
    existing=$(curl -s -u "${user_auth}" \
        "${BASE_URL}/objects?register=3&schema=14&_search=$(echo "$email" | sed 's/@/%40/g')&_limit=5" \
        | python3 -c "
import sys,json
d=json.load(sys.stdin)
for r in d.get('results',[]):
    if r.get('e-mailadres','') == '${email}':
        print(r.get('@self',{}).get('id',''))
        break
" 2>/dev/null)

    if [ -n "$existing" ] && [ "$existing" != "" ]; then
        echo "  Contact already exists: ${voornaam} ${achternaam} (${existing})" >&2
        echo "$existing"
        return
    fi

    local tv_field=""
    if [ -n "$tussenvoegsel" ]; then
        tv_field="\"tussenvoegsel\": \"${tussenvoegsel}\","
    fi

    # Create as the user themselves so system `organisation` is set correctly by RBAC
    uuid=$(curl -s -X POST "${BASE_URL}/objects/voorzieningen/contactpersoon" \
        -H 'Content-Type: application/json' \
        -u "${user_auth}" \
        -d "{
            \"voornaam\": \"${voornaam}\",
            ${tv_field}
            \"achternaam\": \"${achternaam}\",
            \"e-mailadres\": \"${email}\",
            \"telefoonnummer\": \"${telefoon}\",
            \"functie\": \"${functie}\",
            \"organisatie\": \"${org_uuid}\",
            \"rollen\": [\"Gebruik-beheerder\"]
        }" | python3 -c "import sys,json; print(json.load(sys.stdin).get('id',''))" 2>/dev/null)

    if [ -n "$uuid" ] && [ "$uuid" != "" ]; then
        echo "  Created contact: ${voornaam} ${achternaam} (${uuid})" >&2
    else
        echo "  WARN: Failed to create contact for ${voornaam} ${achternaam}" >&2
    fi
    echo "$uuid"
}

JAN_CONTACT=$(create_contact "Jan" "Pietersen" "jan.pietersen@test.nl" "+31 6 12345678" "CEO" "$LEVER_REG")
MARIA_CONTACT=$(create_contact "Maria" "Berg" "maria.vanderberg@test.nl" "+31 6 23456789" "Beheerder" "$GEMEENTE_REG" "van der")
MARK_CONTACT=$(create_contact "Mark" "Jansen" "mark.jansen@test.nl" "+31 6 34567890" "Beheerder" "$GEMEENTE_REG")
LINDA_CONTACT=$(create_contact "Linda" "Bakker" "linda.bakker@test.nl" "+31 6 45678901" "Beheerder" "$SAMENWERKING_REG")

# ─────────────────────────────────────────────
# Step 6: Link contact persons to organizations
# ─────────────────────────────────────────────
echo ""
echo "--- Step 6: Linking contact persons to organizations ---"

# Test Leverancier BV
if [ -n "$LEVER_REG" ] && [ -n "$JAN_CONTACT" ]; then
    curl -s -X PUT "${BASE_URL}/objects/voorzieningen/organisatie/${LEVER_REG}" \
        -H 'Content-Type: application/json' \
        -u "${ADMIN_AUTH}" \
        -d "{\"naam\": \"Test Leverancier BV\", \"type\": \"Leverancier\", \"status\": \"Actief\", \"contactpersonen\": [\"${JAN_CONTACT}\"]}" > /dev/null 2>&1
    echo "  Linked Jan -> Test Leverancier BV"
fi

# Test Gemeente
if [ -n "$GEMEENTE_REG" ] && [ -n "$MARIA_CONTACT" ]; then
    curl -s -X PUT "${BASE_URL}/objects/voorzieningen/organisatie/${GEMEENTE_REG}" \
        -H 'Content-Type: application/json' \
        -u "${ADMIN_AUTH}" \
        -d "{\"naam\": \"Test Gemeente\", \"type\": \"Gemeente\", \"status\": \"Actief\", \"contactpersonen\": [\"${MARIA_CONTACT}\", \"${MARK_CONTACT}\"]}" > /dev/null 2>&1
    echo "  Linked Maria + Mark -> Test Gemeente"
fi

# Test Samenwerking
if [ -n "$SAMENWERKING_REG" ] && [ -n "$LINDA_CONTACT" ]; then
    curl -s -X PUT "${BASE_URL}/objects/voorzieningen/organisatie/${SAMENWERKING_REG}" \
        -H 'Content-Type: application/json' \
        -u "${ADMIN_AUTH}" \
        -d "{\"naam\": \"Test Samenwerking\", \"type\": \"Samenwerking\", \"status\": \"Actief\", \"contactpersonen\": [\"${LINDA_CONTACT}\"]}" > /dev/null 2>&1
    echo "  Linked Linda -> Test Samenwerking"
fi

# ─────────────────────────────────────────────
# Step 7: Create test objects (as the owning user, NOT admin)
# Using user credentials ensures RBAC system `organisation` is correct.
# ─────────────────────────────────────────────
echo ""
echo "--- Step 7: Creating test objects ---"

create_object() {
    local register="$1"
    local schema="$2"
    local data="$3"
    local label="$4"
    local search_name="$5"
    local auth="${6:-${ADMIN_AUTH}}"

    # Check if object already exists by searching as the creating user
    if [ -n "$search_name" ]; then
        existing=$(curl -s -u "${auth}" \
            "${BASE_URL}/objects/${register}/${schema}?_search=$(echo "$search_name" | sed 's/ /+/g')&_limit=5" \
            | python3 -c "
import sys,json
d=json.load(sys.stdin)
for r in d.get('results',[]):
    if r.get('naam','') == '${search_name}':
        print(r.get('@self',{}).get('id',''))
        break
" 2>/dev/null)

        if [ -n "$existing" ] && [ "$existing" != "" ]; then
            echo "  Already exists: ${label} (${existing})" >&2
            echo "$existing"
            return
        fi
    fi

    uuid=$(curl -s -X POST "${BASE_URL}/objects/${register}/${schema}" \
        -H 'Content-Type: application/json' \
        -u "${auth}" \
        -d "${data}" | python3 -c "import sys,json; print(json.load(sys.stdin).get('id',''))" 2>/dev/null)

    if [ -n "$uuid" ] && [ "$uuid" != "" ]; then
        echo "  Created ${label} (${uuid})" >&2
        echo "$uuid"
    else
        echo "  WARN: Failed to create ${label}" >&2
        echo ""
    fi
}

# Applicatie for Test Leverancier BV (created as jan.pietersen)
LEVER_APP_UUID=$(create_object "voorzieningen" "module" "{
    \"naam\": \"Test Applicatie Leverancier\",
    \"beschrijvingKort\": \"Een test applicatie van Test Leverancier BV voor geautomatiseerde tests\",
    \"beschrijvingLang\": \"Deze applicatie is aangemaakt door het test setup script om de beheer-, wizard- en zoekfunctionaliteit te testen.\",
    \"geregistreerdDoor\": \"${LEVER_REG}\",
    \"status\": \"Actief\"
}" "applicatie for Test Leverancier BV" "Test Applicatie Leverancier" "jan.pietersen@test.nl:${PASSWORD}")

# Applicatie for Test Leverancier 2 (created as jan.vandeberg — cross-vendor testing)
LEVER2_APP_UUID=$(create_object "voorzieningen" "module" "{
    \"naam\": \"Test Applicatie Leverancier 2\",
    \"beschrijvingKort\": \"Een test applicatie van Test Leverancier 2 voor cross-vendor tests\",
    \"geregistreerdDoor\": \"${LEVER2_REG}\",
    \"status\": \"Actief\"
}" "applicatie for Test Leverancier 2" "Test Applicatie Leverancier 2" "jan.vandeberg@testleverancier.nl:${PASSWORD}")

# Dienst for Test Leverancier BV (created as jan.pietersen)
LEVER_DIENST_UUID=$(create_object "voorzieningen" "dienst" "{
    \"naam\": \"Test Dienst Leverancier\",
    \"beschrijvingKort\": \"Een test dienst voor geautomatiseerde tests\",
    \"type\": \"Implementatieondersteuning\",
    \"aanbieder\": \"${LEVER_REG}\",
    \"geregistreerdDoor\": \"${LEVER_REG}\",
    \"status\": \"Actief\"
}" "dienst for Test Leverancier BV" "Test Dienst Leverancier" "jan.pietersen@test.nl:${PASSWORD}")

# Applicatie for Test Gemeente (created as maria.vanderberg)
GEMEENTE_APP_UUID=$(create_object "voorzieningen" "module" "{
    \"naam\": \"Test Applicatie Gemeente\",
    \"beschrijvingKort\": \"Een test applicatie geregistreerd door Test Gemeente\",
    \"geregistreerdDoor\": \"${GEMEENTE_REG}\",
    \"status\": \"Actief\"
}" "applicatie for Test Gemeente" "Test Applicatie Gemeente" "maria.vanderberg@test.nl:${PASSWORD}")

echo "  Test objects created."

# ─────────────────────────────────────────────
# Step 7b: Verify samenwerking org is functional
# Checks that Linda's org can access API endpoints without 404/500.
# ─────────────────────────────────────────────
echo ""
echo "--- Step 7b: Verifying samenwerking org ---"

SAMENWERKING_AUTH="linda.bakker@test.nl:${PASSWORD}"

# Check: Linda can list applicaties (should not 404/500)
SAMENWERKING_STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
    -u "${SAMENWERKING_AUTH}" \
    "${BASE_URL}/objects/voorzieningen/module?_limit=1" 2>/dev/null)

if [ "$SAMENWERKING_STATUS" = "200" ]; then
    echo "  PASS: Linda can list applicaties (HTTP ${SAMENWERKING_STATUS})"
else
    echo "  WARN: Linda's applicatie list returned HTTP ${SAMENWERKING_STATUS}"
fi

# Check: Linda can list diensten
DIENST_STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
    -u "${SAMENWERKING_AUTH}" \
    "${BASE_URL}/objects/voorzieningen/dienst?_limit=1" 2>/dev/null)

if [ "$DIENST_STATUS" = "200" ]; then
    echo "  PASS: Linda can list diensten (HTTP ${DIENST_STATUS})"
else
    echo "  WARN: Linda's diensten list returned HTTP ${DIENST_STATUS}"
fi

# Check: Linda can access her org data
ORG_STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
    -u "${SAMENWERKING_AUTH}" \
    "${BASE_URL}/organisations" 2>/dev/null)

if [ "$ORG_STATUS" = "200" ]; then
    echo "  PASS: Linda can list organisations (HTTP ${ORG_STATUS})"
else
    echo "  WARN: Linda's org list returned HTTP ${ORG_STATUS}"
fi

# Check: Linda can access the search/publications endpoint (frontend search)
SEARCH_STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
    -u "${SAMENWERKING_AUTH}" \
    "${NC_URL}/index.php/apps/opencatalogi/api/publications?_limit=1" 2>/dev/null)

if [ "$SEARCH_STATUS" = "200" ]; then
    echo "  PASS: Linda can access publications search (HTTP ${SEARCH_STATUS})"
else
    echo "  WARN: Linda's publications search returned HTTP ${SEARCH_STATUS}"
fi

# ─────────────────────────────────────────────
# Step 7c: Clean up duplicate test data
# Removes objects created by test users in previous runs,
# keeping only the most recently created ones.
# ─────────────────────────────────────────────
if [ "${CLEANUP_DUPLICATES:-0}" = "1" ]; then
    echo ""
    echo "--- Step 7c: Cleaning up duplicate test objects ---"

    cleanup_duplicates() {
        local auth="$1"
        local register="$2"
        local schema="$3"
        local search_name="$4"
        local label="$5"

        # Get all matching objects
        local results=$(curl -s -u "${auth}" \
            "${BASE_URL}/objects/${register}/${schema}?_search=$(echo "$search_name" | sed 's/ /+/g')&_limit=50" 2>/dev/null)

        local count=$(echo "$results" | python3 -c "
import sys, json
d = json.load(sys.stdin)
matches = [r for r in d.get('results', []) if r.get('naam', '') == '${search_name}']
print(len(matches))
" 2>/dev/null)

        if [ "$count" -gt 1 ] 2>/dev/null; then
            echo "  Found ${count} duplicates of '${label}' — removing extras..."
            # Get all IDs except the first (newest)
            local to_delete=$(echo "$results" | python3 -c "
import sys, json
d = json.load(sys.stdin)
matches = [r for r in d.get('results', []) if r.get('naam', '') == '${search_name}']
# Skip the first (keep it), delete the rest
for r in matches[1:]:
    print(r.get('@self', {}).get('id', ''))
" 2>/dev/null)

            while IFS= read -r obj_id; do
                if [ -n "$obj_id" ]; then
                    curl -s -X DELETE "${BASE_URL}/objects/${register}/${schema}/${obj_id}" \
                        -u "${ADMIN_AUTH}" > /dev/null 2>&1
                    echo "    Deleted ${obj_id}"
                fi
            done <<< "$to_delete"
        else
            echo "  ${label}: no duplicates (${count} found)"
        fi
    }

    cleanup_duplicates "${ADMIN_AUTH}" "voorzieningen" "module" "Test Applicatie Leverancier" "Lever app"
    cleanup_duplicates "${ADMIN_AUTH}" "voorzieningen" "module" "Test Applicatie Leverancier 2" "Lever2 app"
    cleanup_duplicates "${ADMIN_AUTH}" "voorzieningen" "module" "Test Applicatie Gemeente" "Gemeente app"
    cleanup_duplicates "${ADMIN_AUTH}" "voorzieningen" "dienst" "Test Dienst Leverancier" "Lever dienst"
    echo "  Cleanup done."
fi

# ─────────────────────────────────────────────
# Step 8: Verify RBAC organisation scoping
# Compares object counts between roles to verify scoping works.
# aanbod-beheerder (Jan) should see FEWER objects than admin.
# ─────────────────────────────────────────────
echo ""
echo "--- Step 8: Verifying RBAC organisation scoping ---"

get_count() {
    local auth="$1"
    local register="$2"
    local schema="$3"

    curl -s -u "${auth}" \
        "${BASE_URL}/objects?register=${register}&schema=${schema}&_limit=1" \
        | python3 -c "import sys,json; print(json.load(sys.stdin).get('total',0))" 2>/dev/null
}

# Get admin's total counts as baseline
ADMIN_CONTACTS=$(get_count "${ADMIN_AUTH}" "3" "14")
ADMIN_APPS=$(get_count "${ADMIN_AUTH}" "3" "25")
echo "  Admin baseline: ${ADMIN_CONTACTS} contactpersonen, ${ADMIN_APPS} applicaties"

# Jan (aanbod-beheerder) should see FEWER than admin
JAN_CONTACTS=$(get_count "jan.pietersen@test.nl:${PASSWORD}" "3" "14")
JAN_APPS=$(get_count "jan.pietersen@test.nl:${PASSWORD}" "3" "25")

if [ "$JAN_CONTACTS" -lt "$ADMIN_CONTACTS" ] 2>/dev/null; then
    echo "  PASS: jan.pietersen sees ${JAN_CONTACTS} contacts (< admin's ${ADMIN_CONTACTS}) — RBAC scoping works"
else
    echo "  WARN: jan.pietersen sees ${JAN_CONTACTS} contacts (admin sees ${ADMIN_CONTACTS}) — RBAC may not be scoping"
fi

if [ "$JAN_APPS" -lt "$ADMIN_APPS" ] 2>/dev/null; then
    echo "  PASS: jan.pietersen sees ${JAN_APPS} applicaties (< admin's ${ADMIN_APPS}) — RBAC scoping works"
else
    echo "  WARN: jan.pietersen sees ${JAN_APPS} applicaties (admin sees ${ADMIN_APPS}) — RBAC may not be scoping"
fi

# Maria (gebruik-beheerder) — check if she has broader access than Jan (expected for this role)
MARIA_CONTACTS=$(get_count "maria.vanderberg@test.nl:${PASSWORD}" "3" "14")
echo "  Maria (gebruik-beheerder) sees ${MARIA_CONTACTS} contacts (Jan sees ${JAN_CONTACTS})"

# Verify Jan's contacts all belong to his org
echo ""
echo "  Checking org_sys on Jan's contacts..."
curl -s -u "jan.pietersen@test.nl:${PASSWORD}" \
    "${BASE_URL}/objects?register=3&schema=14&_limit=10" \
    | python3 -c "
import sys, json
d = json.load(sys.stdin)
orgs = set()
for r in d.get('results', []):
    org = r.get('@self', {}).get('organisation', '?')
    orgs.add(org)
if len(orgs) == 1:
    print(f'  PASS: All {len(d.get(\"results\",[]))} contacts share one org_sys ({orgs.pop()}) — consistent RBAC')
else:
    print(f'  WARN: Contacts span {len(orgs)} orgs: {orgs} — possible RBAC leak')
" 2>/dev/null

# ─────────────────────────────────────────────
# Step 9: Clear rate limiting again (login attempts above may trigger it)
# ─────────────────────────────────────────────
echo ""
echo "--- Step 9: Final cleanup ---"
docker exec nextcloud php occ security:bruteforce:reset 127.0.0.1 2>/dev/null || true
docker exec nextcloud apachectl -k graceful 2>/dev/null || true

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Organizations (NC=Nextcloud RBAC, REG=Register data):"
echo "  - Test Leverancier BV  NC=${LEVER_NC} REG=${LEVER_REG} -> jan.pietersen@test.nl"
echo "  - Test Gemeente        NC=${GEMEENTE_NC} REG=${GEMEENTE_REG} -> maria.vanderberg@test.nl, mark.jansen@test.nl"
echo "  - Test Samenwerking    NC=${SAMENWERKING_NC} REG=${SAMENWERKING_REG} -> linda.bakker@test.nl"
echo "  - Test Leverancier 2   NC=${LEVER2_NC} REG=${LEVER2_REG} -> jan.vandeberg@testleverancier.nl"
echo ""
echo "Test objects created:"
echo "  - Test Applicatie Leverancier (${LEVER_APP_UUID:-failed})"
echo "  - Test Applicatie Leverancier 2 (${LEVER2_APP_UUID:-failed})"
echo "  - Test Dienst Leverancier (${LEVER_DIENST_UUID:-failed})"
echo "  - Test Applicatie Gemeente (${GEMEENTE_APP_UUID:-failed})"
echo ""
echo "Password for all accounts: ${PASSWORD}"
echo ""
echo "Options:"
echo "  FORCE_BUILD=1 bash test-setup.sh       # Rebuild all frontend apps"
echo "  CLEANUP_DUPLICATES=1 bash test-setup.sh # Remove duplicate test objects"
echo ""
echo "Ready to run: /test-softwarecatalog"
