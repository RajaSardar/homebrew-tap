# Homebrew Tap — rajasardar/tap

Wowow Browser (agentic browser) and Kubebay (local-first Kubernetes IDE).

```bash
brew tap rajasardar/tap https://github.com/rajasardar/homebrew-tap
brew trust rajasardar/tap        # one-time: allow casks from this tap
brew install --cask wowow
```

Already tapped before? If you hit a *remote mismatch* error:
`brew tap --repair`, then re-run the install.

Unsigned macOS build note: on first launch, if Gatekeeper complains,
right-click the app → Open, or run:
`xattr -cr "/Applications/Wowow Browser.app"`
