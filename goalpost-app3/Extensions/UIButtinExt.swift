//
//  UIButtinExt.swift
//  goalpost-app3
//
//  Created by macbook on 24/08/2018.
//  Copyright © 2018 Nickagas. All rights reserved.
//


import UIKit

extension UIButton {
    func setSelectedColot() {
        self.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }
}
