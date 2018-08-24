//
//  UIViewControllerExt.swift
//  goalpost-app3
//
//  Created by macbook on 23/08/2018.
//  Copyright © 2018 Nickagas. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentDetail(_ viewControllertoPresent: UIViewController){
        let transiotion = CATransition()
        transiotion.duration = 0.3
        transiotion.type = kCATransitionPush
        transiotion.subtype = kCATransitionFromRight
        self.view?.layer.add(transiotion, forKey: kCATransition)
        
        present(viewControllertoPresent, animated: false, completion: nil)
    }
    
    func presendSecondaryDetail (_ viewControllertoPresent: UIViewController){
        
        
        let transiotion = CATransition()
        transiotion.duration = 0.3
        transiotion.type = kCATransitionPush
        transiotion.subtype = kCATransitionFromRight
        self.view?.layer.add(transiotion, forKey: kCATransition)
        
        guard let presentedVC = presentedViewController else {
            return
        }
        presentedVC.dismiss(animated: false
            , completion: {
                self.view.window?.layer.add(transiotion, forKey: kCATransition)
                self.present(viewControllertoPresent, animated: false, completion: nil)
        })
        
    }
    
    func dissmissDetails(){
        let transiotion = CATransition()
        transiotion.duration = 0.3
        transiotion.type = kCATransitionPush
        transiotion.subtype = kCATransitionFromLeft
        self.view?.layer.add(transiotion, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
//    func pre{
//
//    }
}
