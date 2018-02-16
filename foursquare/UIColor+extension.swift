//
//  UIColor+extension.swift
//  foursquare
//
//  Created by Juan Cabral on 16/02/18.
//  Copyright © 2018 Juan Cabral. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red:r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
