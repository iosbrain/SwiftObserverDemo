//
//  Temperature.swift
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

import Foundation

import UIKit

enum TemperatureType
{
    case Fahrenheit
    case Celsius
}

class Temperature
{
    
    var fahrenheit:Float
    {
        willSet
        {
            if fahrenheit != newValue
            {
                print("fahrenheit temperature will change")
            }
        }
        didSet
        {
            if fahrenheit != oldValue
            {
                print("fahrenheit temperature did change")
                // when fahrenheit changed, always get celsius equivalent
                celsius = Celsius()
                // when fahrenheit changed, broadcast change to
                // any listeners
                if fahrenheit <= 32.0
                {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: temperatureIsFreezingNotificationID), object: self)
                }
            }
        }
    } // end var fahrenheit:Float
    
    var celsius:Float
    {
        willSet(newCelsiusValue)
        {
            if celsius != newCelsiusValue
            {
                print("celsius temperature will change")
            }
        }
        didSet
        {
            if celsius != oldValue
            {
                print("celsius temperature did change")
                // when celsius changed, always get fahrenheit equivalent
                fahrenheit = Fahrenheit()
                // when celsius changed, broadcast change to
                // any listeners
                if celsius <= 0.0
                {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: temperatureIsFreezingNotificationID), object: self)
                }
            }
        }
    } // end var celsius:Float
    
    init()
    {
        fahrenheit = 32.0
        celsius = 0.0
    }
    
    init(temperature:Float, of type:TemperatureType)
    {
        if type == TemperatureType.Fahrenheit
        {
            fahrenheit = temperature
            celsius = (temperature - 32) / 1.8
            // NOTE: we CANNOT call instance method
            // Celsius() in an initializer
        }
        else if type == TemperatureType.Celsius
        {
            celsius = temperature
            fahrenheit = (temperature * 1.8) + 32
            // NOTE: we CANNOT call instance method
            // Fahrenheit() in an initializer
        }
        else
        {
            celsius = -1000000.0
            fahrenheit = -1000000.0
        }
    }
        
    /**
     Convert the currently-stored temperature to fahrenheit.
     
     - returns: Float: The current temperature in fahrenheit.
     */
    func Fahrenheit() -> Float
    {
        return (celsius * 1.8) + 32
    }
    
    /**
     Convert the currently-stored temperature to celsius.
     
     - returns: Float: The current temperature in celsius.
    */
    func Celsius() -> Float
    {
        return (fahrenheit - 32) / 1.8
    }
    
    func currently()
    {
        let info = """
        Fahrenheit: \(fahrenheit)
        Celsius: \(celsius)\n
        """
        print(info)
    }
    
} // end class Temperature
