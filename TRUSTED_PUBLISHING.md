# ⚠️ IMPORTANT: Enable Trusted Publishing on pub.dev

## The Error

```
publishing from github is not enabled
Authentication failed!
```

This means pub.dev doesn't recognize GitHub Actions as a trusted publisher for your package.

## Solution: Enable Trusted Publishing (3 Steps)

### Step 1: Go to pub.dev Account Settings
1. Visit: https://pub.dev/account
2. Sign in with your account
3. Navigate to **Account Settings** → **Trusted Publishing**

### Step 2: Add GitHub as Trusted Publisher
Look for "Publishing from GitHub" section and click **"Add GitHub"**

You'll see a form to enter:
- **GitHub Owner**: `DeveloperRejaul`
- **GitHub Repository**: `flutter_beautify`

Click **Add GitHub Publisher**

### Step 3: Verify in GitHub Actions

The next time you push a version bump:
```bash
git add pubspec.yaml
git commit -m "Bump version to 1.0.5"
git push origin main
```

Workflow will:
1. ✅ Tests & analyzes
2. ✅ Creates tag
3. ✅ Creates release
4. ✅ **Publishes to pub.dev** (now with proper GitHub OIDC tokens)

---

## Manual Testing (Optional)

If you want to test locally before setting up GitHub:

```bash
# Add your pub.dev credentials
dart pub token add https://pub.dev

# Then publish manually
dart pub publish
```

But the **recommended way** is Trusted Publishing for security.

---

## Why Trusted Publishing?

✅ No need to store credentials in GitHub Secrets
✅ More secure (uses OIDC tokens)
✅ Automatic and seamless
✅ Industry standard practice

---

## Still Having Issues?

Check:
1. Are you logged into pub.dev as the package owner?
2. Does `flutter_beautify` package exist on pub.dev?
3. Is the CHANGELOG.md file included in your package?
4. Run locally: `dart pub publish --dry-run` to validate

Reference: https://dart.dev/go/publishing-from-github
