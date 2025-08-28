# 🤝 Contributing to CoolTerm

Thank you for your interest in contributing to CoolTerm! This document provides guidelines and information for contributors.

## 🚀 Quick Start

1. **Fork the repository**
2. **Clone your fork**: `git clone https://github.com/YOUR_USERNAME/coolterm.git`
3. **Create a feature branch**: `git checkout -b feature/amazing-feature`
4. **Make your changes** and test them
5. **Commit your changes**: `git commit -m 'Add amazing feature'`
6. **Push to your branch**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**

## 🎯 What We're Looking For

### Features
- **Terminal utilities** that enhance productivity
- **New aliases** for common commands
- **Plugin integrations** for popular tools
- **Theme customizations** and improvements
- **Performance optimizations**

### Bug Fixes
- **Installation issues** on different Ubuntu versions
- **Plugin compatibility** problems
- **Font rendering** issues
- **Performance problems**

### Documentation
- **README improvements**
- **Installation guides** for other distributions
- **Troubleshooting guides**
- **Video tutorials**

## 🛠️ Development Setup

### Prerequisites
- Ubuntu 18.04+ or similar system
- Git
- Basic shell scripting knowledge

### Local Development
```bash
# Clone the repository
git clone https://github.com/andyeswong/coolterm.git
cd coolterm

# Make scripts executable
chmod +x *.sh

# Test your changes
./verify-setup.sh

# Create a test package
./package.sh
```

### Testing Your Changes
1. **Test installation** on a fresh Ubuntu system
2. **Verify all functions** work correctly
3. **Check for syntax errors** in shell scripts
4. **Test on different Ubuntu versions** if possible

## 📝 Code Style Guidelines

### Shell Scripts
- Use **4 spaces** for indentation (no tabs)
- **Quote all variables** to prevent word splitting
- Use **descriptive variable names**
- Add **comments** for complex logic
- Follow **shellcheck** recommendations

### Documentation
- Use **clear, concise language**
- Include **code examples**
- Add **screenshots** for UI changes
- Update **all relevant files**

### Commit Messages
- Use **imperative mood**: "Add feature" not "Added feature"
- Keep **first line under 50 characters**
- Use **conventional commits** format:
  - `feat:` for new features
  - `fix:` for bug fixes
  - `docs:` for documentation
  - `style:` for formatting changes
  - `refactor:` for code refactoring

## 🔍 Pull Request Process

### Before Submitting
1. **Test thoroughly** on multiple systems
2. **Update documentation** if needed
3. **Check for typos** and grammar errors
4. **Ensure compatibility** with existing features

### Pull Request Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement

## Testing
- [ ] Tested on Ubuntu 18.04
- [ ] Tested on Ubuntu 20.04
- [ ] Tested on Ubuntu 22.04
- [ ] All functions work correctly

## Screenshots
Add screenshots if UI changes were made

## Checklist
- [ ] Code follows style guidelines
- [ ] Documentation updated
- [ ] Tests pass
- [ ] No breaking changes
```

## 🐛 Reporting Issues

### Bug Report Template
```markdown
## Environment
- **OS**: Ubuntu version
- **Shell**: zsh version
- **CoolTerm version**: commit hash or version

## Issue Description
Clear description of the problem

## Steps to Reproduce
1. Step 1
2. Step 2
3. Step 3

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Additional Information
Logs, screenshots, or other relevant info
```

## 📚 Resources

### Documentation
- [Oh My Zsh Documentation](https://ohmyz.sh/)
- [Spaceship Prompt Docs](https://spaceship-prompt.sh/)
- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)

### Tools
- [ShellCheck](https://www.shellcheck.net/) - Shell script analysis
- [Zsh Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## 🎉 Recognition

Contributors will be:
- **Listed in the README**
- **Mentioned in release notes**
- **Given credit in commits**
- **Invited to join the project** for significant contributions

## 📞 Getting Help

- **Open an issue** for questions or problems
- **Join discussions** in existing issues
- **Ask in the community** for general help

---

**Thank you for contributing to CoolTerm! 🚀✨**
