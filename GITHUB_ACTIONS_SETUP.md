# ⚙️ GitHub Actions Publishing Setup - Manual Token Method

## Setup Steps (One Time Only)

### Step 1: Get Your pub.dev Token

1. Go to https://pub.dev/account
2. Click **"Account Settings"**
3. Navigate to **"API Tokens"** or **"Publishing Tokens"**
4. Create a new token:
   - Name: `GitHub Actions`
   - Click **"Generate"**
5. **Copy the token** (you'll only see it once!)

### Step 2: Add Token to GitHub Secrets

1. Go to your GitHub repo: https://github.com/DeveloperRejaul/flutter_beautify
2. Click **Settings** (top menu)
3. Left sidebar: **Secrets and variables** → **Actions**
4. Click **"New repository secret"**
5. Fill in:
   - **Name**: `PUB_TOKEN`
   - **Secret**: Paste your token from Step 1
6. Click **"Add secret"**

### Step 3: Done! ✅

Your workflow now has access to publish!

---

## How It Works

When you push to main with a version bump:

```bash
# Update version
version: 1.0.5

# Push
git add pubspec.yaml CHANGELOG.md
git commit -m "Bump version"
git push origin main
```

Workflow automatically:
1. ✅ Tests code
2. ✅ Creates tag `v1.0.5`
3. ✅ Creates GitHub Release
4. ✅ **Publishes to pub.dev** (using PUB_TOKEN from secrets)

---

## Troubleshooting

### Still Getting Auth Error?

1. **Verify token is correct:**
   - Token should start with something like `eyJ...`
   - Make sure you copied the entire token

2. **Check GitHub Secrets:**
   - Go to Settings → Secrets → Actions
   - Verify `PUB_TOKEN` is there

3. **Test locally first:**
   ```bash
   dart pub token add https://pub.dev
   # Paste your token when prompted
   dart pub publish --dry-run
   ```

### Token Expires?

pub.dev tokens don't expire, but if you need a new one:
1. Go to pub.dev → Account Settings → API Tokens
2. Revoke old token
3. Create new token
4. Update GitHub Secret with new token

---

## Security Note

✅ Tokens stored in GitHub Secrets are encrypted
✅ Tokens are only used during workflow execution
✅ Never commit tokens to git
✅ Only visible to repo maintainers

---

## Reference

- [pub.dev Publishing](https://dart.dev/tools/pub/publishing)
- [GitHub Actions Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
