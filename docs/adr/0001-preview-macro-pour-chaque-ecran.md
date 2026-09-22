# 0001 - Ajouter #Preview pour chaque écran

## Statut

Accepté

## Contexte

Le projet est une app SwiftUI. Xcode fournit la macro `#Preview` (successeur de
`PreviewProvider`) qui permet de visualiser une vue dans le canvas Xcode sans lancer le
simulateur, et donc d'itérer rapidement sur l'UI.

Sans règle explicite, ces previews sont facilement oubliées lors de l'ajout d'un nouvel
écran, ce qui ralentit ensuite le travail sur l'UI (obligation de compiler/lancer l'app pour
voir le moindre changement visuel).

## Décision

Chaque écran (toute `View` de premier niveau représentant un écran ou une section d'écran
significative — pas nécessairement chaque petit composant réutilisable) doit avoir un bloc
`#Preview` dans le même fichier, juste après la déclaration de la vue.

Règles :

- Utiliser la macro `#Preview { ... }` (pas l'ancien `PreviewProvider`/`PreviewProvider`
  + `static var previews`).
- Si l'écran a des états significativement différents (vide, chargement, erreur, rempli),
  privilégier plusieurs blocs `#Preview("nom de l'état") { ... }` plutôt qu'un seul état
  arbitraire.
- Si l'écran dépend de données externes (réseau, base de données), injecter des données
  factices (mock/exemple) plutôt que d'appeler les vraies dépendances dans le `#Preview`.

Exemple minimal (déjà en place dans `ContentView.swift`) :

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

#Preview {
    ContentView()
}
```

## Conséquences

- Chaque écran reste visualisable et itérable directement dans le canvas Xcode.
- Légère charge supplémentaire à l'écriture (prévoir des données mock pour les écrans avec
  dépendances externes).
- Les revues de code doivent vérifier la présence du `#Preview` sur tout nouvel écran.
