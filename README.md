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

## License

MIT License - see [LICENSE](https://github.com/slb350/drep/blob/main/LICENSE)
