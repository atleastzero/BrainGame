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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeColor(_ sender: Any) {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        
        let mainColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        let secondaryColor = UIColor(red: CGFloat((red + 0.5).truncatingRemainder(dividingBy: 1)), green: CGFloat((green + 0.5).truncatingRemainder(dividingBy: 1)), blue: CGFloat((blue + 0.5).truncatingRemainder(dividingBy: 1)), alpha: 1)
        
        self.view.backgroundColor = mainColor
        changeColorButton.tintColor = secondaryColor
        changeColorButton.setTitleColor(mainColor, for: .normal)
    }
    
}

