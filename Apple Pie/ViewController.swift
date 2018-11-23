//
//  ViewController.swift
//  Apple Pie
//
//  Created by Denis Bystruev on 16/11/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var listOfWords = [
        "Арбуз",
        "Банан",
        "Гномик",
        "Домик",
        "Ель",
        "Ёж",
        "Железная дорога",
        ]
    
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        let word = listOfWords.removeFirst().lowercased()
        game = Game(word: word, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        let name = "Tree \(game.incorrectMovesRemaining)"
        treeImageView.image = UIImage(named: name)
        
        var letters = [String]()
        let formattedWord = game.formattedWord.uppercased()
        
        for letter in formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Выигрыши: \(totalWins),  Проигрыши: \(totalLosses)"
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!.lowercased()
        game.playerGuessed(letter: Character(letter))
        updateUI()
    }
    
}

