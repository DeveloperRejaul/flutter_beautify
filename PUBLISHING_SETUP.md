# GitHub Actions Publishing Setup Guide

## For pub.dev Publishing to Work

You need to enable **Trusted Publishing** from GitHub to pub.dev. This uses OIDC tokens instead of storing credentials.

### Step 1: Enable Trusted Publishing on pub.dev

1. Go to https://pub.dev/account
2. Navigate to **Publishing** → **Trusted Publishing**
3. Click **Add a publisher** (if you haven't already)
4. Connect your GitHub repository:
   - Repository Owner: `DeveloperRejaul`
   - Repository Name: `flutter_beautify`
   - Save

### Step 2: Verify CHANGELOG.md

The workflow now automatically checks for `CHANGELOG.md` in the root directory. ✅ Already created!

### Step 3: Test the Workflow

When you push a version change to `pubspec.yaml`:

```bash
# Update version in pubspec.yaml
version: 1.0.5

# Push to main
git add pubspec.yaml CHANGELOG.md
git commit -m "Bump version to 1.0.5"
git push origin main
```

The workflow will:
1. ✅ Build & Test code
2. ✅ Create tag `v1.0.5`
3. ✅ Create GitHub Release
4. ✅ Publish to pub.dev (if credentials are configured)

### Workflow Permissions

The workflow already has the correct permissions set:
```yaml
permissions:
  id-token: write  # Required for OIDC token
```

### Troubleshooting

If publishing fails:

1. **Check pub.dev account settings**: https://pub.dev/account/publishers
2. **Verify Trusted Publishing is enabled** for this GitHub repo
3. **Check package name** matches in `pubspec.yaml`
4. **Update CHANGELOG.md** with new version entry before pushing

### Reference

- [pub.dev Trusted Publishing](https://dart.dev/go/publishing-from-github)
- [GitHub OIDC in Actions](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect)
