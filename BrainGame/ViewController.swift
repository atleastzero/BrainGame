//
//  ViewController.swift
//  BrainGame
//
//  Created by Megan OBryan on 11/20/19.
//  Copyright © 2019 Makeschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var bottomColor: UITextView!
    @IBOutlet weak var topColor: UITextView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var winCount: UILabel!
    @IBOutlet weak var lossCount: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var accurate = true
    var wins = 0
    var losses = 0
    
    var timer:Timer?
    var timeLeft = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeColorPair()
        changeBackgroundColor()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires() {
        timeLeft -= 1
        timeLabel.text = "\(timeLeft)"

        if timeLeft <= 0 {
            timer!.invalidate()
            timer = nil
        }
    }
    
    @IBAction func yesButton(_ sender: Any) {
        if accurate {
            wins += 1
            winCount.text = String(wins)
        } else {
            losses += 1
            lossCount.text = String(losses)
        }
        score.text = String((wins - losses) * 10)
        changeColor()
    }
    
    @IBAction func noButton(_ sender: Any) {
        if !accurate {
            wins += 1
            winCount.text = String(wins)
        } else {
            losses += 1
            lossCount.text = String(losses)
        }
        score.text = String((wins - losses) * 10)
        changeColor()
    }
    
    func changeColor() {
        changeBackgroundColor()
        accurate = changeColorPair()
    }
    
    func changeBackgroundColor() {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        var redneg = red + 0.5
        var greenneg = green + 0.5
        var blueneg = blue + 0.5
        
        if redneg >= 1 {
            redneg -= 1
        }
        if greenneg >= 1 {
            greenneg -= 1
        }
        if blueneg >= 1 {
            blueneg -= 1
        }
        
        let bgMainColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        let bgSecondaryColor = UIColor(red: CGFloat(redneg), green: CGFloat(greenneg), blue: CGFloat(blueneg), alpha: 1)
        
        self.view.backgroundColor = bgMainColor
        
        noButton.tintColor = bgSecondaryColor
        noButton.setTitleColor(bgMainColor, for: .normal)
        
        yesButton.tintColor = bgSecondaryColor
        yesButton.setTitleColor(bgMainColor, for: .normal)
        
        topColor.textColor = bgMainColor
        question.textColor = bgMainColor
        topColor.backgroundColor = bgSecondaryColor
        
        bottomColor.backgroundColor = bgSecondaryColor
        
        
    }
    
    func changeColorPair() -> Bool {
        let accurate = Bool.random()
        print(accurate)
        
        let colorTextList = ["RED", "BLUE", "BROWN", "GREEN", "PINK", "ORANGE", "YELLOW"]
        
        let textColor = colorTextList.randomElement()!
        let newBottomColor : UIColor
        
        if accurate {
            newBottomColor = generateAccurateColor(textColor)
        } else {
            newBottomColor = generateInaccurateColor(textColor)
        }
        
        topColor.text = "\n\n\n" + String(textColor) + "?"
        bottomColor.text = "\n" + colorTextList.randomElement()!
        bottomColor.textColor = newBottomColor
        
        return accurate
    }
    
    func generateAccurateColor(_ color : String) -> (UIColor)  {
        let reds : [UIColor] = [.red, .systemRed]
        let blues : [UIColor] = [.blue, .systemBlue, .systemTeal, .cyan]
        let browns : [UIColor] = [.brown]
        let greens : [UIColor] = [.green, .systemGreen]
        let pinks : [UIColor] = [.magenta, .systemPink]
        let oranges : [UIColor] = [.orange, .systemOrange]
        let yellows : [UIColor] = [.yellow, .systemYellow]
        
        switch color {
        case "RED":
            return reds.randomElement()!
        case "BLUE":
            return blues.randomElement()!
        case "BROWN":
            return browns.randomElement()!
        case "GREEN":
            return greens.randomElement()!
        case "PINK":
            return pinks.randomElement()!
        case "ORANGE":
            return oranges.randomElement()!
        case "YELLOW":
            return yellows.randomElement()!
        default:
            return .black
        }
    }
    
    func generateInaccurateColor(_ color : String) -> (UIColor)  {
        let reds : [UIColor] = [.blue, .brown, .cyan, .green, .magenta, .orange, .yellow, .systemOrange, .systemBlue, .systemTeal, .systemPink, .systemGreen, .systemYellow]
        let blues : [UIColor] = [.red, .brown, .green, .magenta, .orange, .yellow, .systemOrange, .systemRed, .systemPink, .systemGreen, .systemYellow]
        let browns : [UIColor] = [.red, .blue, .cyan, .green, .magenta, .orange, .yellow, .systemOrange, .systemRed, .systemBlue, .systemTeal, .systemPink, .systemGreen, .systemYellow]
        let greens : [UIColor] = [.red, .blue, .brown, .cyan, .magenta, .orange, .yellow, .systemOrange, .systemRed, .systemBlue, .systemTeal, .systemPink, .systemYellow]
        let pinks : [UIColor] = [.red, .blue, .brown, .cyan, .green, .orange, .yellow, .systemOrange, .systemRed, .systemBlue, .systemTeal, .systemGreen, .systemYellow]
        let oranges : [UIColor] = [.red, .blue, .brown, .cyan, .green, .magenta, .yellow, .systemRed, .systemBlue, .systemTeal, .systemPink, .systemGreen, .systemYellow]
        let yellows : [UIColor] = [.red, .blue, .brown, .cyan, .green, .magenta, .orange, .systemOrange, .systemRed, .systemBlue, .systemTeal, .systemPink, .systemGreen]
        
        switch color {
        case "RED":
            return reds.randomElement()!
        case "BLUE":
            return blues.randomElement()!
        case "BROWN":
            return browns.randomElement()!
        case "GREEN":
            return greens.randomElement()!
        case "PINK":
            return pinks.randomElement()!
        case "ORANGE":
            return oranges.randomElement()!
        case "YELLOW":
            return yellows.randomElement()!
        default:
            return .black
        }
    }
}

