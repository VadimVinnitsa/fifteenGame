//
//  menuView.swift
//  fifteenGame
//
//  Created by Admin on 24.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class menuView: UIView {
    var delegate: SomeProtocol?
    
    func remove() {
        self.removeFromSuperview()
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        print("reset")
        delegate?.someF()
        remove()
    }
    
    @IBAction func tuturialPressed(_ sender: UIButton) {
        print("tuturial")
        remove()
    }
    
   
}
protocol SomeProtocol {
    func someF()
    
}
