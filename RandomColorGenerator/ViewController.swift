//
//  ViewController.swift
//  RandomColorGenerator
//
//  Created by 박지성 on 2/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBAction func changeColorTapped(_ sender: UIButton) {
        backgroundColorView.backgroundColor = generateRandomColor()
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        backgroundColorView.backgroundColor = .white
        
        changeRGBLabel(red: 1, green: 1, blue: 1)
    }
    
    func generateRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        changeRGBLabel(red: red, green: green, blue: blue)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    func changeRGBLabel(red: CGFloat, green: CGFloat, blue: CGFloat) {
        redValueLabel.text = String(Int(red * 255))
        greenValueLabel.text = String(Int(green * 255))
        blueValueLabel.text = String(Int(blue * 255))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

