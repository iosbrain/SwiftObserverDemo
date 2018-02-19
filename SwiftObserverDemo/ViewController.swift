//
//  ViewController.swift
//  SwiftObserverDemo
//
//  Created by Andrew Jaffee on 2/18/18.
//
/*
 
 Copyright (c) 2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and
 iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

import UIKit

let temperatureIsFreezingNotificationID =
    "com.iosbrain.temperatureIsFreezingNotificationID"

class ViewController: UIViewController
{
    
    @IBOutlet weak var temperatureView: UIView!
    @IBOutlet weak var convertedTemperatureLabel: UILabel!
    @IBOutlet weak var convertCtoFText: UITextField!
    @IBOutlet weak var convertFtoCText: UITextField!
    
    var color = UIColor.blue
    
    var temperature = Temperature(temperature: 70.0, of: TemperatureType.Fahrenheit)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        convertedTemperatureLabel.text = ""
        
        NotificationCenter.default.addObserver(self, selector: #selector(didTemperatureReachFreezing), name: Notification.Name(rawValue: temperatureIsFreezingNotificationID), object: nil)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: temperatureIsFreezingNotificationID), object: nil)
    }

    @IBAction func convertCtoFButtonTapped(_ sender: Any)
    {
        if convertCtoFText.text != ""
        {
            temperatureView.backgroundColor = UIColor.green
            convertFtoCText.text = ""
            let celsiusValue = (convertCtoFText.text as NSString?)?.floatValue
            let temperature = Temperature(temperature: celsiusValue!, of: TemperatureType.Celsius)
            convertedTemperatureLabel.text = String(temperature.fahrenheit) + "°F"
            self.temperature.fahrenheit = temperature.fahrenheit
        }
        else
        {
            convertedTemperatureLabel.text = ""
            convertFtoCText.text = ""
        }
    }
    
    @IBAction func convertFtoCButtonTapped(_ sender: Any)
    {
        if convertFtoCText.text != ""
        {
            temperatureView.backgroundColor = UIColor.green
            convertCtoFText.text = ""
            let fahrenheitValue = (convertFtoCText.text as NSString?)?.floatValue
            let temperature = Temperature(temperature: fahrenheitValue!, of: TemperatureType.Fahrenheit)
            convertedTemperatureLabel.text = String(temperature.celsius) + "°C"
            self.temperature.celsius = temperature.celsius
        }
        else
        {
            convertedTemperatureLabel.text = ""
            convertCtoFText.text = ""
        }
    }
    
    @objc func didTemperatureReachFreezing()
    {
        temperatureView.backgroundColor = UIColor.blue
    }
    
} // end class ViewController

