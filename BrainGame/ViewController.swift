//
//  ViewController.swift
//  BrainGame
//
//  Created by Megan OBryan on 11/20/19.
//  Copyright © 2019 Makeschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeColorButton: UIButton!
    @IBOutlet weak var bottomColor: UITextView!
    @IBOutlet weak var topColor: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeColorPair()
    }

    @IBAction func changeColor(_ sender: Any) {
        changeBackgroundColor()
        changeColorPair()
    }
    
    func changeBackgroundColor() {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        
        let bgMainColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        let bgSecondaryColor = UIColor(red: CGFloat((red + 0.5).truncatingRemainder(dividingBy: 1)), green: CGFloat((green + 0.5).truncatingRemainder(dividingBy: 1)), blue: CGFloat((blue + 0.5).truncatingRemainder(dividingBy: 1)), alpha: 1)
        
        self.view.backgroundColor = bgMainColor
        changeColorButton.tintColor = bgSecondaryColor
        changeColorButton.setTitleColor(bgMainColor, for: .normal)
    }
    
    func changeColorPair() {
        let accurate = Bool.random()
        
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

