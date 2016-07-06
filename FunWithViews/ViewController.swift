//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tiles: [UIView]!
    @IBOutlet var numbers: [UILabel]!
    @IBOutlet var playLabel: UILabel!
    
    let maxRolls = 6
    var currentRoll = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playLabel = UILabel.init(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        playLabel.center = self.view.center
        playLabel.textAlignment = .Center
        playLabel.textColor = UIColor.lightGrayColor()
        playLabel.text = "Tap the dice to play again!"
        
        self.view.addSubview(playLabel)
        playLabel.hidden = true
        
        begin()
    }
    
    @IBAction func rollDice() {
        playLabel.hidden = true
        currentRoll += 1
        
        if (currentRoll <= maxRolls) {
            hideTiles(true)
            
            switch (randomDiceRoll()) {
                case 1:
                    tiles[3].hidden = false
                case 2:
                    tiles[2].hidden = false
                    tiles[4].hidden = false
                case 3:
                    tiles[2].hidden = false
                    tiles[3].hidden = false
                    tiles[4].hidden = false
                case 4:
                    tiles[0].hidden = false
                    tiles[2].hidden = false
                    tiles[4].hidden = false
                    tiles[6].hidden = false
                case 5:
                    tiles[0].hidden = false
                    tiles[2].hidden = false
                    tiles[3].hidden = false
                    tiles[4].hidden = false
                    tiles[6].hidden = false
                case 6:
                    tiles[0].hidden = false
                    tiles[1].hidden = false
                    tiles[2].hidden = false
                    tiles[4].hidden = false
                    tiles[5].hidden = false
                    tiles[6].hidden = false
                default:
                    break
            }
            
            var value = 0
            for tile: UIView in tiles {
                if (!tile.hidden) {
                    value += 1
                }
            }
            
            let label = numbers[currentRoll-1]
            label.hidden = false
            label.text = "\(value)"
            
        } else {
            end()
        }
    }
    
    // MARK: Helpers
    
    func end() {
        playLabel.hidden = false
        begin()
    }
    
    func begin() {
        hideNumbers(true)
        hideTiles(true)
        
        currentRoll = 0
    }
    
    func hideNumbers(hide: Bool) {
        for label: UILabel in numbers {
            label.hidden = hide
        }
    }
    
    func hideTiles(hide: Bool) {
        for view: UIView in tiles {
            view.hidden = hide
        }
    }
    
    func randomDiceRoll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
}
