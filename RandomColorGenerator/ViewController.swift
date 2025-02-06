//
//  ViewController.swift
//  RandomColorGenerator
//
//  Created by 박지성 on 2/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var rgbValueLabel: UILabel!
    @IBOutlet weak var changeColorButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func changeColorTapped(_ sender: UIButton) {
        backgroundColorView.backgroundColor = generateRandomColor()
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        backgroundColorView.backgroundColor = .white
        
        chagneRGB(red: 1, green: 1, blue: 1)
    }
    
    func generateRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        chagneRGB(red: red, green: green, blue: blue)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    func chagneRGB(red: CGFloat, green: CGFloat, blue: CGFloat) {
        let luminance = relativeLuminance(red: red, green: green, blue: blue)
        let textColor: UIColor = (luminance < 0.5) ? .white : .black
        let buttonBackgroundColor: UIColor = (luminance < 0.5) ? .lightGray : .darkGray
        
        rgbValueLabel.text = "R: \(Int(red * 255)), G: \(Int(green * 255)), B: \(Int(blue * 255))"
        rgbValueLabel.textColor = textColor
        
        changeColorButton.setTitleColor(textColor, for: .normal)
        changeColorButton.backgroundColor = buttonBackgroundColor
        
        resetButton.setTitleColor(textColor, for: .normal)
        resetButton.backgroundColor = buttonBackgroundColor
    }
    
    func gammaCorrection(value: CGFloat) -> CGFloat {
        return (value <= 0.03928) ? (value / 12.92) : pow((value + 0.055) / 1.055, 2.4)
    }
    
    func relativeLuminance(red: CGFloat, green: CGFloat, blue: CGFloat) -> CGFloat {
        let r = gammaCorrection(value: red)
        let g = gammaCorrection(value: green)
        let b = gammaCorrection(value: blue)
        
        return 0.2126 * r + 0.7152 * g + 0.0722 * b
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
