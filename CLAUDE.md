# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project state

This is a bare-bones SwiftUI iOS app scaffold, currently just the default template:

- `MyApp.swift` — `@main` App entry point, loads `ContentView` in a `WindowGroup`.
- `ContentView.swift` — default "Hello, world!" view. Also contains a `#Playground` block (uses the `Playgrounds` framework, Xcode 16+/Swift Playgrounds integration).
- `Assets.xcassets/` — default asset catalog (`AccentColor`, empty `AppIcon`).
- `project.yml` — [XcodeGen](https://github.com/yonaskolb/XcodeGen) spec used to generate `MyApp.xcodeproj`. `MyApp.xcodeproj` itself is generated output (not committed as source of truth) — after editing `project.yml`, regenerate with `xcodegen generate`.

No commits exist yet on `main` — all files are untracked.

## Build & run

Regenerate the Xcode project after changing `project.yml`:

```
xcodegen generate
```

Build for the simulator from the CLI:

```
xcodebuild -project MyApp.xcodeproj -scheme MyApp -destination 'generic/platform=iOS Simulator' build
```

To run on a physical iPhone: open `MyApp.xcodeproj` in Xcode, select your iPhone as the run destination, set a Development Team under the MyApp target's Signing & Capabilities tab (`project.yml` currently leaves `DEVELOPMENT_TEAM` empty), and Run (⌘R). The first launch on-device requires trusting the developer certificate on the iPhone (Réglages > Général > VPN et gestion de l'appareil).

There is no test target yet.
