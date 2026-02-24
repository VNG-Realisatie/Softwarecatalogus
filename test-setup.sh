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

set -euo pipefail

NC_URL="${BACKEND_URL:-http://localhost:8080}"
BASE_URL="${NC_URL}/index.php/apps/openregister/api"
ADMIN_AUTH="${ADMIN_USER:-admin}:${ADMIN_PASS:-admin}"
PASSWORD="WelcomeToTest2026"

echo "=== Softwarecatalogus Test Setup ==="
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
        echo "  User ${userid} already exists or error (HTTP ${response})"
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
create_user "maria.vanderberg@test.nl" "Maria van der Berg"  "maria.vanderberg@test.nl"
create_user "mark.jansen@test.nl"      "Mark Jansen"         "mark.jansen@test.nl"
create_user "linda.bakker@test.nl"     "Linda Bakker"        "linda.bakker@test.nl"
create_user "peter.vandijk@test.nl"    "Peter van Dijk"      "peter.vandijk@test.nl"
create_user "sarah.devries@test.nl"    "Dr. Sarah de Vries"  "sarah.devries@test.nl"

# Assign groups
echo "  Assigning groups..."
add_to_group "jan.pietersen@test.nl"    "aanbod-beheerder"
add_to_group "jan.pietersen@test.nl"    "software-catalog-users"

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
echo "  Done."

# ─────────────────────────────────────────────
# Step 3: Create test organizations
# ─────────────────────────────────────────────
echo ""
echo "--- Step 3: Creating test organizations ---"

create_org() {
    local name="$1"
    local type="$2"
    local website="$3"
    local email="$4"
    local desc="$5"

    # Check if org already exists by searching publications
    existing=$(curl -s -u "${ADMIN_AUTH}" \
        "${NC_URL}/index.php/apps/opencatalogi/api/publications?_search=$(echo "$name" | sed 's/ /+/g')&_limit=10" \
        | python3 -c "
import sys,json
d=json.load(sys.stdin)
for r in d.get('results',[]):
    if r.get('naam','') == '${name}' and r.get('@self',{}).get('schema','') == '15':
        print(r['@self']['id'])
        break
" 2>/dev/null)

    if [ -n "$existing" ] && [ "$existing" != "" ]; then
        echo "  Org already exists: ${name} (${existing})" >&2
        echo "$existing"
        return
    fi

    uuid=$(curl -s -X POST "${BASE_URL}/objects/voorzieningen/organisatie" \
        -H 'Content-Type: application/json' \
        -u "${ADMIN_AUTH}" \
        -d "{
            \"naam\": \"${name}\",
            \"type\": \"${type}\",
            \"website\": \"${website}\",
            \"e-mailadres\": \"${email}\",
            \"beschrijvingKort\": \"${desc}\",
            \"status\": \"Actief\"
        }" | python3 -c "import sys,json; print(json.load(sys.stdin).get('id',''))" 2>/dev/null)

    if [ -n "$uuid" ] && [ "$uuid" != "" ]; then
        echo "  Created org: ${name} (${uuid})" >&2
        echo "$uuid"
    else
        echo "  WARN: Failed to create ${name}" >&2
        echo ""
    fi
}

LEVER_UUID=$(create_org "Test Leverancier BV" "Leverancier" "https://test-leverancier.nl" "info@test-leverancier.nl" "Test vendor organization")
GEMEENTE_UUID=$(create_org "Test Gemeente" "Gemeente" "https://test-gemeente.nl" "info@test-gemeente.nl" "Test municipality organization")
SAMENWERKING_UUID=$(create_org "Test Samenwerking" "Samenwerking" "https://test-samenwerking.nl" "info@test-samenwerking.nl" "Test collaboration organization")
LEVER2_UUID=$(create_org "Test Leverancier 2" "Leverancier" "https://test-leverancier2.nl" "info@test-leverancier2.nl" "Second test vendor for cross-vendor testing")

# ─────────────────────────────────────────────
# Step 4: Create contact persons
# ─────────────────────────────────────────────
echo ""
echo "--- Step 4: Creating contact persons ---"

create_contact() {
    local voornaam="$1"
    local achternaam="$2"
    local email="$3"
    local telefoon="$4"
    local functie="$5"
    local org_uuid="$6"
    local tussenvoegsel="${7:-}"

    # Check if contact already exists by searching publications for email
    existing=$(curl -s -u "${ADMIN_AUTH}" \
        "${NC_URL}/index.php/apps/opencatalogi/api/publications?_search=$(echo "$email" | sed 's/@/%40/g')&_limit=10" \
        | python3 -c "
import sys,json
d=json.load(sys.stdin)
for r in d.get('results',[]):
    if r.get('e-mailadres','') == '${email}' and r.get('@self',{}).get('schema','') == '14':
        print(r['@self']['id'])
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

    uuid=$(curl -s -X POST "${BASE_URL}/objects/voorzieningen/contactpersoon" \
        -H 'Content-Type: application/json' \
        -u "${ADMIN_AUTH}" \
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

    echo "  Created contact: ${voornaam} ${achternaam} (${uuid})" >&2
    echo "$uuid"
}

JAN_CONTACT=$(create_contact "Jan" "Pietersen" "jan.pietersen@test.nl" "+31 6 12345678" "CEO" "$LEVER_UUID")
MARIA_CONTACT=$(create_contact "Maria" "Berg" "maria.vanderberg@test.nl" "+31 6 23456789" "Beheerder" "$GEMEENTE_UUID" "van der")
MARK_CONTACT=$(create_contact "Mark" "Jansen" "mark.jansen@test.nl" "+31 6 34567890" "Beheerder" "$GEMEENTE_UUID")
LINDA_CONTACT=$(create_contact "Linda" "Bakker" "linda.bakker@test.nl" "+31 6 45678901" "Beheerder" "$SAMENWERKING_UUID")

# ─────────────────────────────────────────────
# Step 5: Link contact persons to organizations
# ─────────────────────────────────────────────
echo ""
echo "--- Step 5: Linking contact persons to organizations ---"

# Test Leverancier BV
curl -s -X PUT "${BASE_URL}/objects/voorzieningen/organisatie/${LEVER_UUID}" \
    -H 'Content-Type: application/json' \
    -u "${ADMIN_AUTH}" \
    -d "{\"naam\": \"Test Leverancier BV\", \"type\": \"Leverancier\", \"status\": \"Actief\", \"contactpersonen\": [\"${JAN_CONTACT}\"]}" > /dev/null
echo "  Linked Jan -> Test Leverancier BV"

# Test Gemeente
curl -s -X PUT "${BASE_URL}/objects/voorzieningen/organisatie/${GEMEENTE_UUID}" \
    -H 'Content-Type: application/json' \
    -u "${ADMIN_AUTH}" \
    -d "{\"naam\": \"Test Gemeente\", \"type\": \"Gemeente\", \"status\": \"Actief\", \"contactpersonen\": [\"${MARIA_CONTACT}\", \"${MARK_CONTACT}\"]}" > /dev/null
echo "  Linked Maria + Mark -> Test Gemeente"

# Test Samenwerking
curl -s -X PUT "${BASE_URL}/objects/voorzieningen/organisatie/${SAMENWERKING_UUID}" \
    -H 'Content-Type: application/json' \
    -u "${ADMIN_AUTH}" \
    -d "{\"naam\": \"Test Samenwerking\", \"type\": \"Samenwerking\", \"status\": \"Actief\", \"contactpersonen\": [\"${LINDA_CONTACT}\"]}" > /dev/null
echo "  Linked Linda -> Test Samenwerking"

# ─────────────────────────────────────────────
# Step 6: Join users to their organizations and set active
# ─────────────────────────────────────────────
echo ""
echo "--- Step 6: Joining users to organizations ---"

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

join_and_activate "jan.pietersen@test.nl"    "$LEVER_UUID"       "Test Leverancier BV"
join_and_activate "maria.vanderberg@test.nl" "$GEMEENTE_UUID"    "Test Gemeente"
join_and_activate "mark.jansen@test.nl"      "$GEMEENTE_UUID"    "Test Gemeente"
join_and_activate "linda.bakker@test.nl"     "$SAMENWERKING_UUID" "Test Samenwerking"

# Peter and Sarah stay in Default Organisation (admin/VNG roles)
echo "  peter.vandijk@test.nl -> Default Organisation (admin)"
echo "  sarah.devries@test.nl -> Default Organisation (VNG)"

# ─────────────────────────────────────────────
# Step 7: Create test objects (applicaties, diensten)
# ─────────────────────────────────────────────
echo ""
echo "--- Step 7: Creating test objects ---"

create_object() {
    local register="$1"
    local schema="$2"
    local data="$3"
    local label="$4"
    local search_name="$5"

    # Check if object already exists by searching publications
    if [ -n "$search_name" ]; then
        existing=$(curl -s -u "${ADMIN_AUTH}" \
            "${NC_URL}/index.php/apps/opencatalogi/api/publications?_search=$(echo "$search_name" | sed 's/ /+/g')&_limit=10" \
            | python3 -c "
import sys,json
d=json.load(sys.stdin)
for r in d.get('results',[]):
    if r.get('naam','') == '${search_name}' or r.get('@self',{}).get('name','') == '${search_name}':
        print(r['@self']['id'])
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
        -u "${ADMIN_AUTH}" \
        -d "${data}" | python3 -c "import sys,json; print(json.load(sys.stdin).get('id',''))" 2>/dev/null)

    if [ -n "$uuid" ] && [ "$uuid" != "" ]; then
        echo "  Created ${label} (${uuid})" >&2
        echo "$uuid"
    else
        echo "  WARN: Failed to create ${label}" >&2
        echo ""
    fi
}

# Applicatie for Test Leverancier BV
LEVER_APP_UUID=$(create_object "voorzieningen" "module" "{
    \"naam\": \"Test Applicatie Leverancier\",
    \"beschrijvingKort\": \"Een test applicatie van Test Leverancier BV voor geautomatiseerde tests\",
    \"beschrijvingLang\": \"Deze applicatie is aangemaakt door het test setup script om de beheer-, wizard- en zoekfunctionaliteit te testen.\",
    \"geregistreerdDoor\": \"${LEVER_UUID}\",
    \"status\": \"Actief\"
}" "applicatie for Test Leverancier BV" "Test Applicatie Leverancier")

# Applicatie for Test Leverancier 2 (for cross-vendor testing)
LEVER2_APP_UUID=$(create_object "voorzieningen" "module" "{
    \"naam\": \"Test Applicatie Leverancier 2\",
    \"beschrijvingKort\": \"Een test applicatie van Test Leverancier 2 voor cross-vendor tests\",
    \"geregistreerdDoor\": \"${LEVER2_UUID}\",
    \"status\": \"Actief\"
}" "applicatie for Test Leverancier 2" "Test Applicatie Leverancier 2")

# Dienst for Test Leverancier BV
LEVER_DIENST_UUID=$(create_object "voorzieningen" "dienst" "{
    \"naam\": \"Test Dienst Leverancier\",
    \"beschrijvingKort\": \"Een test dienst voor geautomatiseerde tests\",
    \"dienstType\": \"Implementatieondersteuning\",
    \"geregistreerdDoor\": \"${LEVER_UUID}\",
    \"status\": \"Actief\"
}" "dienst for Test Leverancier BV" "Test Dienst Leverancier")

# Applicatie for Test Gemeente (as gebruik registration)
GEMEENTE_APP_UUID=$(create_object "voorzieningen" "module" "{
    \"naam\": \"Test Applicatie Gemeente\",
    \"beschrijvingKort\": \"Een test applicatie geregistreerd door Test Gemeente\",
    \"geregistreerdDoor\": \"${GEMEENTE_UUID}\",
    \"status\": \"Actief\"
}" "applicatie for Test Gemeente" "Test Applicatie Gemeente")

echo "  Test objects created."

# ─────────────────────────────────────────────
# Step 8: Clear rate limiting again (login attempts above may trigger it)
# ─────────────────────────────────────────────
echo ""
echo "--- Step 8: Final cleanup ---"
docker exec nextcloud php occ security:bruteforce:reset 127.0.0.1 2>/dev/null || true
docker exec nextcloud apachectl -k graceful 2>/dev/null || true

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Organizations created:"
echo "  - Test Leverancier BV  (${LEVER_UUID}) -> jan.pietersen@test.nl"
echo "  - Test Gemeente        (${GEMEENTE_UUID}) -> maria.vanderberg@test.nl, mark.jansen@test.nl"
echo "  - Test Samenwerking    (${SAMENWERKING_UUID}) -> linda.bakker@test.nl"
echo "  - Test Leverancier 2   (${LEVER2_UUID}) -> (no users, for cross-vendor testing)"
echo ""
echo "Test objects created:"
echo "  - Test Applicatie Leverancier (${LEVER_APP_UUID:-failed})"
echo "  - Test Applicatie Leverancier 2 (${LEVER2_APP_UUID:-failed})"
echo "  - Test Dienst Leverancier (${LEVER_DIENST_UUID:-failed})"
echo "  - Test Applicatie Gemeente (${GEMEENTE_APP_UUID:-failed})"
echo ""
echo "Password for all accounts: ${PASSWORD}"
echo ""
echo "Ready to run: /test-softwarecatalog"
