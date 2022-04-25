//
//  CalculatorBrain.swift
//  BMI-Calculator-programmatically-coding
//
//  Created by Oleksandr Kachkin on 25.04.2022.
//

import Foundation
import UIKit

struct CalculatorBrain {
  
  var bmi: BMI?
  
  func getBMIValue() -> String {
    
    let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? "0.0")
    return bmiTo1DecimalPlace
  }
  
  func getAdvice() -> String {
    return bmi?.advice ?? "No data"
  }
  
  func getColor() -> UIColor {
    return bmi?.color ?? .yellow
  }
  
  func getImage() -> String {
    return bmi?.image ?? "pencil"
  }
  
  mutating func calculateBMI(weight: Float, height: Float) {
    
    let bmiValue = weight / pow(height, 2)
    let bmiAdvice: String
    let bmiColor: UIColor
    let bmiImage: String
    
    if bmiValue < 18.5 {
      bmiAdvice = "Пора подкрепиться"
      bmiColor = #colorLiteral(red: 0.5369458199, green: 0.8691725135, blue: 0.9820278287, alpha: 1) // 79D6F9
      bmiImage = "underweight"
    } else if bmiValue < 24.9 {
      bmiAdvice = "Все идеально! Можно есть и пить все, что захочется."
      bmiColor = #colorLiteral(red: 0.5369458199, green: 0.8691725135, blue: 0.9820278287, alpha: 1) // 95F200
      bmiImage = "regular"
    } else {
      bmiAdvice = "Пора в спортзал. Нужно следить за питанием и больше двигаться"
      bmiColor = #colorLiteral(red: 0.5369458199, green: 0.8691725135, blue: 0.9820278287, alpha: 1) // DD2B0A
      bmiImage = "overweight"
    }
    bmi = BMI(value: bmiValue, advice: bmiAdvice, color: bmiColor, image: bmiImage)
  }
}

