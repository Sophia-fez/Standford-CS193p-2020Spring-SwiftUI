//
//  ViewController.swift
//  Concentration
//
//  Created by Sophia_fez on 2020/7/26.
//  Copyright © 2020 Sophia_fez. All rights reserved.
//

import UIKit

class ConcentrationViewController: VCLLoggingViewController {
    
    override var vclLoggingName: String {
        return "Game"
    }
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        get {
            return (visibleCardButtons.count + 1) / 2
        }
    }
    
    private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
//        let attributedString = NSAttributedString(
//            // 横屏时分两行，竖屏时一行
//            string: traitCollection.verticalSizeClass == .compact ?  "Flips\n\(flipCount)" : "Flips: \(flipCount)",
//            attributes: attributes
//        )
        flipCountLabel.attributedText = attributedString
    }

//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        updateFlipCountLabel()
//    }
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    // 有24个button，但我们实际只用20个
    private var visibleCardButtons: [UIButton]! {
        return cardButtons?.filter { !$0.superview!.isHidden}
    }
    
    // 还需要在旋转屏幕后更新
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateViewFromModel()
    }
        
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = visibleCardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in visibleCardButtons")
        }
    }
    
    func updateViewFromModel(){
        if visibleCardButtons != nil {  // 不加这句也不会崩溃
            for index in visibleCardButtons.indices {
                let button = visibleCardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.07319629937, green: 0.587113142, blue: 0.8577551246, alpha: 1)
                }
            }
        }
    }
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
//    private var emojiChoices = ["👻","🎃","👿","🙀","😱","🍎","🍭","🍬"]
    private var emojiChoices = "👻🎃👿🙀😱🍎🍭🍬"

    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return  -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
