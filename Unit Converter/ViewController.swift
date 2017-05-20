//
//  ViewController.swift
//  Unit Converter
//
//  Created by CHRISTOPHER WATSON on 05/18/17.
//  Copyright © 2017 CWatson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    let userDefaultsLastRowKey = "defaultCelsiusPickerRow"
    
    @IBOutlet var temperatureRange: TemperatureRange!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var celsiusPicker: UIPickerView!
    
    private let converter = UnitConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultPickerRow = celsiusPicker.numberOfRows(inComponent: 0) / 2
        celsiusPicker.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: defaultPickerRow, inComponent: 0)
        temperatureLabel.font = temperatureLabel.font.withSize(75)
        temperatureLabel.sizeToFit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureRange.values[row]
        return "\(celsiusValue)°C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {
        displayConvertedTemperatureForRow(row)
        saveSelectedRow(row)
    }
    
    func displayConvertedTemperatureForRow(_ row: Int) {
        let degreesCelsius = temperatureRange.values[row]
        temperatureLabel.text = "\(converter.degreesFahrenheit(degreesCelsius: degreesCelsius))°F"
        print(degreesCelsius)
        switch degreesCelsius {
        case -50 ... -22:
            temperatureLabel.textColor = UIColor(red: 0, green: 0.9686, blue: 0.9176, alpha: 1.0) /* #00f7ea */
        case -23...5:
            temperatureLabel.textColor = UIColor.blue
        case 6...26:
            temperatureLabel.textColor = UIColor.black
        case 27...37:
            temperatureLabel.textColor = UIColor.orange
        case 38...50:
            temperatureLabel.textColor = UIColor.red
        default:
            temperatureLabel.textColor = UIColor.black
        }
    }
    
    func saveSelectedRow(_ row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }
    
}

