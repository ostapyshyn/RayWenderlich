//
//  ViewController.swift
//  BullsEye
//
//  Created by Volodymyr Ostapyshyn on 25.04.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int!
    var targetValue = 0
    @IBOutlet var round: UILabel!
    var score = 0
    var roundOfTheGame = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var totalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rounded = slider.value.rounded()
        currentValue = Int(rounded)
        startNewRound()
        round.text = String(roundOfTheGame)
        totalScore.text = "0"
    }
    
    @IBAction func pressefStartOver(_ sender: UIButton) {
        roundOfTheGame = 0
        score = 0
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        let rounded = sender.value.rounded()
        currentValue = Int(rounded)
        print("slider \(sender.value)")
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        if difference == 0 {
            score += 100
        } else if difference == 1 {
            score += 50
        }
        
        let title: String
        
        switch difference {
        case 0:
            title = "Perfeect"
        case 0..<5:
            title = "Close"
        case 5..<10:
            title = "Not Bad"
        default:
            title = "Not Even Close..."
        }
        
        
        
        let alert = UIAlertController(title: title, message: "You scored \(points)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        targetLabel.text = String(targetValue)
        currentValue = 50
        slider.value = Float(currentValue)
        totalScore.text = String(score)
        roundOfTheGame += 1
        round.text = String(roundOfTheGame)
    }
    
}
