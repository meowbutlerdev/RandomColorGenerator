//
//  ViewController.swift
//  RandomColorGenerator
//
//  Created by 박지성 on 2/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundColorView: UIView!
    
    @IBAction func changeColorTapped(_ sender: UIButton) {
        backgroundColorView.backgroundColor = generateRandomColor()
    }
    
    func generateRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

