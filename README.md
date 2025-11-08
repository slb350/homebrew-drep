# Homebrew Tap for drep

This is the official Homebrew tap for [drep](https://github.com/slb350/drep) - an AI-powered code review and documentation quality tool for Gitea, GitHub, and GitLab.

## Installation

Install drep using Homebrew:

```bash
brew tap slb350/drep
brew install drep-ai
```

Verify the installation:

```bash
drep --help
```

## Usage

After installation, initialize drep configuration:

```bash
# Initialize with interactive platform selection
drep init

# Set your API token (GitHub example)
export GITHUB_TOKEN="ghp_your_token_here"

# Scan a repository
drep scan owner/repo
```

## What is drep?

drep (Documentation & Review Enhancement Platform) is an AI-powered tool that:

- 🔍 **Scans repositories** for code quality issues and documentation problems
- 🤖 **Reviews pull requests** automatically with intelligent comments
- 📝 **Generates docstrings** for Python code (Google-style)
- 🎯 **Creates issues** with detailed findings and suggested fixes
- 🧠 **Uses local LLMs** for privacy-preserving analysis (LM Studio, Ollama, AWS Bedrock)

## Platform Support

- ✅ **GitHub** - Full support
- ✅ **Gitea** - Full support
- 🔜 **GitLab** - Coming soon

## Documentation

- **Main Repository**: https://github.com/slb350/drep
- **PyPI Package**: https://pypi.org/project/drep-ai/
- **Documentation**: https://github.com/slb350/drep/tree/main/docs

## Known Issues

Some users may see warnings about dylib linking with Rust-compiled dependencies (like jiter). These warnings can generally be ignored as they don't affect functionality.

## Alternative Installation

If you encounter issues with the Homebrew installation, you can install drep via pip:

```bash
pip install drep-ai
```

## Troubleshooting

### Formula issues

If you encounter issues with the formula, please report them at:
https://github.com/slb350/homebrew-drep/issues

### drep issues

For issues with drep itself, report at:
https://github.com/slb350/drep/issues

## Releasing a New Version

This tap uses an automated release script to update the formula when a new version is published to PyPI.

### Prerequisites

1. New version must be published to [PyPI](https://pypi.org/project/drep-ai/) first
2. Ensure you have `jq` installed: `brew install jq`

### Release Process

Simply run the release script with the new version number:

```bash
./release-brew.sh 0.8.3
```

The script will:
1. ✅ Fetch the release tarball from PyPI
2. ✅ Calculate the SHA256 hash automatically
3. ✅ Update the Homebrew formula with new version and hash
4. ✅ Optionally test the formula locally
5. ✅ Optionally commit and push changes

### Manual Release (if needed)

If you prefer to update manually:

1. Download the new version from PyPI:
   ```bash
   curl -LO https://files.pythonhosted.org/packages/.../drep_ai-X.Y.Z.tar.gz
   ```

2. Calculate SHA256:
   ```bash
   shasum -a 256 drep_ai-X.Y.Z.tar.gz
   ```

3. Update `Formula/drep-ai.rb`:
   - Update the `url` with the new tarball URL
   - Update the `sha256` with the calculated hash
   - Update version in `pip install drep-ai==X.Y.Z`
   - Update version in `assert_match "X.Y.Z"`

4. Test locally:
   ```bash
   brew install --build-from-source ./Formula/drep-ai.rb
   drep --version
   ```

5. Commit and push:
   ```bash
   git add Formula/drep-ai.rb
   git commit -m "chore(formula): Update drep-ai to vX.Y.Z"
   git push
   ```

## License

MIT License - see [LICENSE](https://github.com/slb350/drep/blob/main/LICENSE)
