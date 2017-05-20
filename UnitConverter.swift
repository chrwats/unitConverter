//
//  UnitConverter.swift
//  Unit Converter
//
//  Created by CHRISTOPHER WATSON on 05/19/17.
//  Copyright © 2017 CWatson. All rights reserved.
//

import UIKit

class UnitConverter: UIView {

    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        return Int(1.8 * Float(degreesCelsius) + 32.0)
    }
    
}
