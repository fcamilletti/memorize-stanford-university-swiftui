//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Franco Camilletti on 06/10/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private(set) var model: MemoryGame<String>
    typealias Card = MemoryGame<String>.Card
    
    private static var themes: Array<Theme> = [
        Theme(name: "Vehicles", emojis: ["๐ณ","๐","๐ต","๐","๐","๐","โ๏ธ","๐"], numberOfPairsOfCards: 8, cardColor: "blue"),
        Theme(name: "Fruits", emojis: ["๐","๐","๐","๐ฅ","๐ฅฅ","๐","๐ฅญ","๐"], numberOfPairsOfCards: 8, cardColor: "red"),
        Theme(name: "Animals", emojis: ["๐","๐ญ","๐น","๐ป","๐ง","๐ท","๐ถ","๐"], numberOfPairsOfCards: 8, cardColor: "pink"),
        Theme(name: "Plants", emojis: ["๐ท","๐บ","๐ด","๐ฑ","๐ฒ","๐","๐พ","๐ป"], numberOfPairsOfCards: 8, cardColor: "green"),
        Theme(name: "Food", emojis: ["๐","๐","๐","๐","๐ฅ","๐","๐ฅช","๐ง"], numberOfPairsOfCards: 8, cardColor: "yellow"),
        Theme(name: "Objects", emojis: ["๐ธ","โ๏ธ","๐ฑ","โณ","โฐ","๐งจ","๐ฎ","โฑ"], numberOfPairsOfCards: 8, cardColor: "orange")
    ]
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    private var theme: Theme
    
    var themeName: String {
        theme.name
    }
    
    var score: Int {
        model.score
    }
    
    var themeColor: Color {
        switch theme.cardColor {
        case "blue":
            return .blue
        case "red":
            return .red
        case "pink":
            return .pink
        case "green":
            return .green
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        default:
            return .black
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - User Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func restart() {
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
        theme.emojis.shuffle()
    }
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
        theme.emojis.shuffle()
    }
    
    func shuffle() {
        model.shuffle()
    }
}
