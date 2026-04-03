# ⚙️ GitHub Actions Publishing Setup - Automatic Non-Interactive

## Setup Steps (One Time Only)

### Step 1: Get pub.dev Credentials

**Option A: From pub.dev Website**
1. Go to https://pub.dev/account
2. Look for **"API Tokens"** section
3. Click **"Generate Token"** 
4. Copy the token

**Option B: From Local Machine**
1. Run locally first:
   ```bash
   dart pub publish --dry-run
   ```
2. Copy your credentials:
   ```bash
   cat ~/.config/dart/pub-credentials.json
   ```

### Step 2: Add to GitHub Secrets

1. Go to your repo: https://github.com/DeveloperRejaul/flutter_beautify/settings/secrets/actions
2. Click **"New repository secret"**
3. **Name**: `PUB_TOKEN`
4. **Value**: Paste token or credentials JSON
5. Click **"Add secret"**

### Step 3: Done! ✅

---

## How It Now Works

**Automatic Non-Interactive Publishing:**

✅ No browser popup needed
✅ No manual confirmation required  
✅ Fully automated with `--skip-confirmation`

When you push to main:

```bash
# Update version
version: 1.0.6

# Push
git add pubspec.yaml CHANGELOG.md
git commit -m "Bump version to 1.0.6"
git push origin main

# Workflow automatically runs:
# ✅ Tests code
# ✅ Creates tag v1.0.6
# ✅ Creates GitHub Release
# ✅ PUBLISHES TO PUB.DEV (no interaction!)
```

---

## Workflow Automation

The workflow now:

1. **Build & Test** (on main push)
   - Analyzes code
   - Extracts version from pubspec.yaml
   - Checks if tag already exists

2. **Create Tag & Release** (if new version)
   - Creates git tag (e.g., v1.0.6)
   - Pushes tag to GitHub
   - Creates GitHub Release with CHANGELOG

3. **Publish** (after tag created)
   - Sets up credentials in `~/.config/dart/pub-credentials.json`
   - Runs: `dart pub publish --force --skip-confirmation`
   - **No browser authorization needed!**

---

## Key Changes

- ✅ Uses `pub-credentials.json` instead of tokens
- ✅ Uses `--skip-confirmation` flag
- ✅ Non-interactive workflow
- ✅ Credentials stored safely in GitHub Secrets

---

## Troubleshooting

### Still Getting Browser Prompt?

Check:
1. Secret name is exactly `PUB_TOKEN`
2. Credentials are correctly formatted
3. Version is incremented in pubspec.yaml
4. CHANGELOG.md is updated

### "Previous version is X.X.X"?

You must increment the version:
- Patch: `1.0.5` → `1.0.6`
- Minor: `1.0.5` → `1.1.0`
- Major: `1.0.5` → `2.0.0`

Update `pubspec.yaml` and `CHANGELOG.md`, then push again.

### Test Locally

```bash
dart pub login https://pub.dev
dart pub publish --dry-run
```

If it works locally without prompts, it will work in GitHub Actions!

---

## Security

✅ Credentials encrypted in GitHub Secrets
✅ Only visible to repo admins
✅ Used only during workflow execution
✅ Never committed or logged

---

## Reference

- [Dart Pub Publishing](https://dart.dev/tools/pub/publishing)
- [GitHub Actions Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
