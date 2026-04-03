# Pub.dev Trusted Publishing Setup Guide

## Quick Start: 3-Click Setup

### 1️⃣ Open pub.dev Account Settings
- Go to: **https://pub.dev/account**
- Click on your account profile
- Select **"Trusted Publishing"** or **"Account Settings"**

### 2️⃣ Add GitHub Publisher
Look for the section titled **"Publishing from GitHub"** and:
- Click **"Add GitHub"** button
- Enter your GitHub details:
  ```
  GitHub Owner: DeveloperRejaul
  GitHub Repository: flutter_beautify
  ```
- Click **"Add"** or **"Connect"**

### 3️⃣ Verify Connection
You should see:
```
✅ GitHub Owner: DeveloperRejaul
✅ GitHub Repository: flutter_beautify
✅ Status: Connected
```

---

## Workflow Diagram

```
You push version to main
          ↓
GitHub Actions runs
          ↓
Tests & Analysis ✓
          ↓
Tag created ✓
          ↓
Release created ✓
          ↓
Dart requests OIDC token from GitHub
          ↓
GitHub validates workflow is authorized
          ↓
pub.dev receives OIDC token
          ↓
pub.dev checks Trusted Publishing settings
          ↓
✅ Publishes to pub.dev
```

---

## If Still Getting Error

### Check These First:

1. **Is the package name correct?**
   ```yaml
   # pubspec.yaml
   name: flutter_beautify  # ← Must match pub.dev
   ```

2. **Is CHANGELOG.md present?**
   ```bash
   ls CHANGELOG.md  # Should exist in root
   ```

3. **Is the version updated in CHANGELOG.md?**
   ```markdown
   ## [1.0.5] - 2026-04-03
   ### Added
   - New features...
   ```

4. **Test locally first:**
   ```bash
   # Validate package
   dart pub publish --dry-run
   ```

### If "Publishing from GitHub not enabled" Still Shows:

Sometimes pub.dev UI lags. Try:

1. **Logout and login again** on pub.dev
2. **Refresh the Trusted Publishing page**
3. **Check GitHub Actions logs** for exact error message
4. **Contact pub.dev support** if still blocked

---

## Alternative: Manual Credential Setup

If Trusted Publishing doesn't work, use manual credentials:

```bash
# Add pub.dev token locally
dart pub token add https://pub.dev

# GitHub Actions will use this in secrets:
# Settings → Secrets and variables → Actions
# Add: PUB_TOKEN=<your-token>
```

Then update workflow to use:
```yaml
env:
  PUB_TOKEN: ${{ secrets.PUB_TOKEN }}
```

---

## Reference Links

- 📚 [Dart Pub Publishing Guide](https://dart.dev/tools/pub/publishing)
- 🔐 [GitHub OIDC Publishing](https://dart.dev/go/publishing-from-github)
- 🏠 [pub.dev Account Settings](https://pub.dev/account)
- ❓ [Pub.dev Support](https://pub.dev/help)

---

## Success Indicators

When everything is working:

✅ GitHub Actions workflow completes all 3 jobs
✅ Tag `v1.0.5` appears in GitHub releases
✅ GitHub Release shows CHANGELOG content
✅ Package version updates on https://pub.dev/packages/flutter_beautify
✅ No more "Authentication failed" errors

---

## Commands to Test

```bash
# Check if package name is available
dart pub publish --dry-run

# View current pub.dev config
dart pub token list

# Remove old token if needed
dart pub token remove https://pub.dev
```

---

**Questions?** Check PUBLISHING_SETUP.md or TRUSTED_PUBLISHING.md for more details!
