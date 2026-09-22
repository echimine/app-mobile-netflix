# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Objectif du projet

Cette app est un clone d'interface Netflix : le but est d'intégrer une maquette Figma et de reproduire fidèlement l'UI/UX de Netflix (écrans, navigation, composants, mise en page, animations d'interface) à partir de cette maquette.

Le scope est volontairement limité à l'implémentation visuelle et structurelle de la maquette — il n'y a pas de vidéo, pas de streaming, pas de lecteur média, et pas de backend de contenu réel. L'objectif est que l'app *ressemble et se comporte* comme Netflix côté interface, pas qu'elle en reproduise les fonctionnalités de diffusion vidéo.

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

## Design (Figma)

Pour toute intégration de design Figma dans ce projet, utiliser le MCP **framelink-figma** (`framelink-figma`) plutôt que le MCP `claude.ai Figma`.

## Architecture Decision Records

Les décisions techniques du projet sont documentées dans `docs/adr/` (voir
`docs/adr/README.md` pour le format). Notamment [ADR-0001](docs/adr/0001-preview-macro-pour-chaque-ecran.md) :
chaque écran SwiftUI doit avoir un bloc `#Preview` dans son fichier.
