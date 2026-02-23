# Security Officer Test Results - Mark Jansen
**Date:** 2026-02-21
**Environment:** https://softwarecatalogus.accept.opencatalogi.nl/ (frontend) / https://softwarecatalogus.performance.accept.commonground.nu/ (backend)
**Tester:** Mark Jansen (Security Officer agent)
**Authentication:** Unauthenticated visitor

---

## #394 - Contactpersonen van gemeenten publiekelijk zichtbaar
**Status:** FAIL
**Severity:** CRITICAL
**Test Step:** Step 12
**Observed:** The public API endpoint at `https://softwarecatalogus.performance.accept.commonground.nu/index.php/apps/opencatalogi/api/publications?_extend=contactpersonen` returns full contact person data to unauthenticated users. The response includes:
- `voornaam` (first names, e.g. "Jan", "Tom", "Ang")
- `achternaam` (last names, e.g. "met een achternaam")
- `e-mailadres` (email addresses, e.g. "test.vng.swc+Jan@gmail.com")
- `telefoonnummer` (phone numbers, e.g. "+31 23 4567890")
- `rollen` (roles, e.g. ["Gebruik-beheerder","Gebruik-raadpleger"])
- `notificaties` (notification preferences)
- `functie` (job title)
- `username` (Nextcloud username if assigned)

This was confirmed by fetching `https://softwarecatalogus.performance.accept.commonground.nu/index.php/apps/opencatalogi/api/publications?_search=gemeente&_limit=1&_extend=contactpersonen` without any authentication headers. The endpoint returned organisaties with fully expanded contactpersonen arrays containing all personal data. Tested for organisations 's-Gravenhage (9 contactpersonen), 's-Hertogenbosch (5 contactpersonen), and Aa en Hunze (3 contactpersonen).

**Expected:** Contact person data (names, emails, phone numbers) should NOT be visible to unauthenticated users. The `_extend=contactpersonen` parameter should either be rejected for unauthenticated requests, or the contactpersonen data should be stripped from public API responses.

**Evidence:** WebFetch confirmed full PII returned from public publications API with `_extend=contactpersonen`. The total dataset contains 3,042 organisations, meaning potentially thousands of contact persons' personal data are publicly accessible. The backend softwarecatalog `ContactpersonenController` routes (lines 136-146 of `appinfo/routes.php`) are all Nextcloud-authenticated, but the OpenCatalogi `publications` endpoint exposes the extended contactpersonen data without authentication.

**Root Cause Analysis:** The `_extend=contactpersonen` feature works through OpenRegister's object extension mechanism in the publications API. The OpenCatalogi `PublicationsController` applies `@NoCSRFRequired` and `@NoAdminRequired` and `@CORS` annotations (making it public), but does not strip sensitive extended fields like contactpersonen from the response. The extension happens at the data layer (OpenRegister) which has no concept of public vs. authenticated fields.

**Recommendation:**
1. **Immediate:** Remove or deny the `_extend=contactpersonen` parameter on the publications endpoint for unauthenticated requests.
2. **Short-term:** Implement a whitelist of allowed `_extend` values for public API endpoints.
3. **Long-term:** Implement field-level access control in OpenRegister so that sensitive fields (like contactpersonen) are never returned in public/unauthenticated responses.

---

## #105 - Aanbieders zien applicatielandschappen en koppelingen niet
**Status:** CANNOT_TEST
**Severity:** HIGH
**Test Step:** Step 12
**Observed:** This issue requires testing as an authenticated "aanbieder" (supplier) user to verify that suppliers cannot see other organisations' applicatielandschappen (application landscapes) and koppelingen (connections). As an unauthenticated visitor, I cannot verify role-based access restrictions. However, the finding from #394 is highly relevant here: if contactpersonen data leaks through the public API, it is likely that applicatielandschappen and koppelingen could also leak through similar `_extend` mechanisms.

**Expected:** Aanbieders (suppliers/vendors) should NOT be able to see organisatie applicatielandschappen and koppelingen, to prevent acquisition targeting (as stated in the issue: "om aquisitie tegen te gaan en op advies van de informatiebeveiligingsdienst").

**Evidence:** Cannot verify without an authenticated aanbieder account. However, the publications API `_extend` mechanism confirmed in #394 suggests this may also be exploitable. The routes.php shows `_extend` is a generic parameter that could include any related object type.

**Recommendation:** Test with an authenticated aanbieder account. Also audit all `_extend` values that the publications API accepts and ensure none expose data intended only for specific roles.

---

## #183 - Wachtwoord vergeten optie
**Status:** PARTIAL
**Severity:** MEDIUM
**Test Step:** Step 4/5
**Observed:** Based on source code analysis of the frontend:

1. **Frontend "Wachtwoord vergeten" button EXISTS:** The login page (`/home/rubenlinde/nextcloud-docker-dev/workspace/server/apps-extra/tilburg-woo-ui/src/views/ac-login/ac-login.js`, lines 238-246) contains a "Wachtwoord vergeten?" button that navigates to `/reminder`.

2. **Password reminder page EXISTS:** The file `/home/rubenlinde/nextcloud-docker-dev/workspace/server/apps-extra/tilburg-woo-ui/src/views/ac-password-reminder/ac-password-reminder.js` implements a two-step flow: (a) email input to request a one-time login code, (b) 6-digit code input for verification.

3. **Backend NOT IMPLEMENTED:** The password reminder component has `// TODO: Implement backend call when available` on lines 80-81 and 132-133. The email submission currently only simulates success with a `setTimeout` and does not actually call any API endpoint. The code verification step also only simulates processing.

4. **The acceptance criteria from the issue show:**
   - [x] Frontend wachtwoord vergeten link/form added (DONE)
   - [ ] Backend endpoint for handling password reset (NOT DONE)
   - [ ] Email sending for password reset process (NOT DONE)

**Expected:** The wachtwoord vergeten feature should be fully functional end-to-end, including backend endpoint and email delivery.

**Evidence:** Source code review of `ac-password-reminder.js` lines 80-89 shows `// TODO: Implement backend call when available` with only a simulated timeout. The frontend UI exists but is non-functional.

**Recommendation:** Implement the backend password reset endpoint and integrate email sending. The current frontend gives users the impression they can reset their password, but the flow is non-functional (it always "succeeds" regardless of input).

---

## #404 - Regelmatig witte schermen
**Status:** CANNOT_TEST
**Severity:** MEDIUM
**Test Step:** Step 4/5
**Observed:** The browser automation tool (Playwright) could not launch due to an existing Chrome session conflict on the test machine, preventing interactive browser testing. The issue reports white screens in Edge browser, often requiring browser factory reset to resolve. This suggests a client-side state corruption issue (possibly related to cached JavaScript bundles, service worker caching, or localStorage corruption).

Based on code analysis:
- The frontend uses `Cache-Control: no-cache, no-store, must-revalidate` for HTML files (`.htaccess` lines 59-68), which should prevent caching issues.
- However, JS/CSS files have long cache times (`max-age=2419200` for .js and .css in `.htaccess` line 163), which could cause issues if bundle filenames don't include content hashes.
- The `runtime-config.js` loaded from `index.html` is fetched on every page load, which could fail if the server is down temporarily.

**Expected:** The application should not show white screens under normal usage conditions. Navigation between pages should be reliable.

**Evidence:** Browser automation blocked by existing Chrome session. Issue is intermittent and browser-specific (Edge). The `.htaccess` caching configuration at `/home/rubenlinde/nextcloud-docker-dev/workspace/server/apps-extra/tilburg-woo-ui/public/.htaccess` shows JS/CSS files get 4-week cache but HTML gets no-cache, which could cause version mismatches if JS bundles change but cached versions are served.

**Recommendation:**
1. Ensure all JS/CSS bundles include content hashes in filenames (e.g., `main.abc123.js`).
2. Add build version checking to the SPA to detect stale bundles and prompt refresh.
3. Test specifically in Edge with developer tools to capture the exact error state.

---

## #395 - Menu linkerkant verdwijnt
**Status:** CANNOT_TEST
**Severity:** MEDIUM
**Test Step:** Step 4/5
**Observed:** Browser automation was unavailable (Playwright could not launch due to existing Chrome session). The issue reports that the left-side menu disappears when pressing F5 or Ctrl+R on the Applicaties overview page. This is likely a SPA routing issue where a direct URL refresh does not properly restore the navigation state.

The `.htaccess` rewrite rule (line 219: `RewriteRule ^ /index.html [L]`) ensures all routes serve `index.html`, which is correct for SPA behavior. The issue is likely in the frontend's route/state initialization logic -- the menu state may not be restored from the URL path on direct page loads.

**Expected:** The left-side menu should remain visible after page refresh (F5/Ctrl+R).

**Evidence:** Could not reproduce interactively. The issue specifically mentions it happens on the "Applicaties" overview after refresh. The menu store (`/home/rubenlinde/nextcloud-docker-dev/workspace/server/apps-extra/tilburg-woo-ui/src/stores/menu.store.js`) likely needs to derive its active state from the current URL route rather than relying solely on click-based state changes.

**Recommendation:**
1. Ensure the menu store initializes its active menu item based on the current URL path on app mount.
2. Test specifically by navigating to /applicaties and pressing F5.
3. This is likely authenticated-only functionality, so an unauthenticated tester cannot verify.

---

## #409 - Footer anders: inlog of uitgelogd
**Status:** PARTIAL
**Severity:** LOW
**Test Step:** Step 21
**Observed:** Based on source code and API analysis:

1. **Footer component** (`/home/rubenlinde/nextcloud-docker-dev/workspace/server/apps-extra/tilburg-woo-ui/src/components/ac-footer/ac-footer.js`) renders footer content from backend menu data (positions 3, 4, 5 for main footer; position 6 for sub-footer). It uses `menu.getFooterMenus(user.isAuthenticated)` which filters menus based on authentication status.

2. **Backend menu API** returns footer menus (positions 3-6) that all have `"hideBeforeLogin": false`, meaning they should display identically for both logged-in and logged-out users.

3. **The Privacyverklaring and Algemene voorwaarden** are in the Footer Sub menu (position 6) and contain link URLs that come from the backend. The issue states these links point to different pages when logged in vs. logged out -- this is likely due to the backend serving different link URLs based on authentication context, even though the menu items themselves are always visible.

4. The sub-footer items (Privacyverklaring, Algemene voorwaarden, Disclaimer, FAQ) appear in the menu API response without any apparent authentication-dependent URL differentiation. However, the frontend's `menu.getFooterMenus(user.isAuthenticated)` and `menu.getSubFooterMenus(user.isAuthenticated)` methods could filter or transform these differently based on auth state.

**Expected:** Footers should be identical for logged-in and logged-out users. Privacyverklaring and Algemene voorwaarden links should point to the same pages regardless of authentication state.

**Evidence:** API response from `/api/menus` endpoint shows footer menus with `hideBeforeLogin: false` for all items. The footer component code passes `user.isAuthenticated` to menu filtering functions, which could cause differences if the menu store has different filtering logic for authenticated vs. unauthenticated states.

**Recommendation:**
1. Verify in `menu.store.js` that `getFooterMenus()` and `getSubFooterMenus()` return identical items regardless of authentication parameter.
2. Ensure the backend API always returns the same footer menu link URLs regardless of session state.
3. Test by comparing the footer HTML/DOM between logged-in and logged-out states.

---

## #406 - SiteImprove verwijderen
**Status:** PARTIAL
**Severity:** LOW
**Test Step:** Step 21
**Observed:** Based on comprehensive source code analysis:

1. **No SiteImprove script tag in index.html:** The file `/home/rubenlinde/nextcloud-docker-dev/workspace/server/apps-extra/tilburg-woo-ui/public/index.html` contains only Piwik Pro Analytics (lines 80-104). There is NO SiteImprove script tag (`siteimproveanalytics.com/js/siteanalyze_6006199.js` is NOT present).

2. **SiteImprove still in CSP header:** The Content-Security-Policy in `/home/rubenlinde/nextcloud-docker-dev/workspace/server/apps-extra/tilburg-woo-ui/public/.htaccess` (line 37) still explicitly allows SiteImprove:
   - `script-src 'self' siteimproveanalytics.com;` -- allows loading scripts from siteimproveanalytics.com
   - `img-src ... *.siteimproveanalytics.io ...` -- allows loading images from siteimproveanalytics.io

3. **WebFetch of live accept site** confirmed that the page source contains only Piwik Pro Analytics script (with empty/unconfigured variables), and no SiteImprove script was detected.

4. **The SiteImprove script tag has been removed from the HTML**, but the CSP policy still permits SiteImprove domains, which is:
   - A minor security hygiene issue (allowing unnecessary external domains in CSP)
   - Could theoretically be exploited if an XSS vulnerability exists (the CSP would allow loading scripts from siteimproveanalytics.com)

**Expected:** All references to SiteImprove should be removed, including the script tag AND the CSP policy references. The only allowed third-party analytics should be Piwik Pro.

**Evidence:**
- File: `/home/rubenlinde/nextcloud-docker-dev/workspace/server/apps-extra/tilburg-woo-ui/public/.htaccess`, line 37
- CSP `script-src` still includes `siteimproveanalytics.com`
- CSP `img-src` still includes `*.siteimproveanalytics.io`

**Recommendation:**
1. Remove `siteimproveanalytics.com` from the `script-src` directive in the CSP header.
2. Remove `*.siteimproveanalytics.io` from the `img-src` directive in the CSP header.
3. Review the entire CSP policy for other stale/unnecessary domain references.

---

# Summary

| Issue | Title | Status | Severity |
|-------|-------|--------|----------|
| #394 | Contactpersonen van gemeenten publiekelijk zichtbaar | **FAIL** | **CRITICAL** |
| #105 | Aanbieders zien applicatielandschappen en koppelingen niet | CANNOT_TEST | HIGH |
| #183 | Wachtwoord vergeten optie | PARTIAL | MEDIUM |
| #404 | Regelmatig witte schermen | CANNOT_TEST | MEDIUM |
| #395 | Menu linkerkant verdwijnt | CANNOT_TEST | MEDIUM |
| #409 | Footer anders: inlog of uitgelogd | PARTIAL | LOW |
| #406 | SiteImprove verwijderen | PARTIAL | LOW |

## Critical Finding Summary

**Issue #394 is a CRITICAL privacy/security vulnerability.** The public OpenCatalogi publications API (`/index.php/apps/opencatalogi/api/publications`) exposes personal contact information (full names, email addresses, phone numbers, roles) of gemeente contactpersonen to any unauthenticated user who adds the `_extend=contactpersonen` query parameter. With 3,042 organisations in the database, this potentially exposes thousands of individuals' personal data. This violates GDPR and Dutch privacy regulations (AVG) and should be treated as a data breach incident requiring immediate remediation.

## Test Limitations

- **Browser automation was unavailable** due to an existing Chrome session conflicting with Playwright's browser launch. This prevented interactive testing of issues #404, #395, and interactive verification of #409.
- **Authentication-required tests** (issues #105, #395) could not be performed as the testing mandate was for unauthenticated users only.
- **Source code analysis** was used as an alternative to live browser testing where possible, providing high-confidence results for code-level issues (#183, #406).
