//
//  CalculatorBrain.swift
//  BMI-Calculator-programmatically-coding
//
//  Created by Oleksandr Kachkin on 25.04.2022.
//

import UIKit

struct CalculatorBrain {
  
  var bmi: BMI?
  
  func getBMIValue() -> String {
    let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? "0.0")
    return bmiTo1DecimalPlace
  }
  
  mutating func calculateBMI(weight: Float, height: Float) {
    let bmiValue = weight / pow(height, 2)
    let bmiAdvice: String
    let bmiColor: UIColor
    let bmiImage: String
    

    if bmiValue < 18.5 {
      bmiAdvice = "Пора подкрепиться."
      bmiColor = #colorLiteral(red: 0.6800768971, green: 0.8480268121, blue: 0.8196280599, alpha: 1) // B6D7D1
      bmiImage = "underweight"
    } else if bmiValue < 25 {
      bmiAdvice = "Все идеально! Можно есть и пить все, что захочется."
      bmiColor = #colorLiteral(red: 0.6375427842, green: 0.8852258325, blue: 0.3339183331, alpha: 1) // B0E06A
      bmiImage = "normal"
    } else {
      bmiAdvice = "Пора в спортзал. Нужно следить за питанием и больше двигаться."
      bmiColor = #colorLiteral(red: 0.9719312787, green: 0.534704566, blue: 0.2327695191, alpha: 1) // E98E4D
      bmiImage = "overweight"
    }
    bmi = BMI(value: bmiValue, advice: bmiAdvice, color: bmiColor, image: bmiImage)
  }
  
  func getAdvice() -> String {
    return bmi?.advice ?? "Данные отсутствуют"
  }
  func getColor() -> UIColor {
    return bmi?.color ?? .white
  }
  
  func getImage() -> String {
    return bmi?.image ?? "normal"
  }
  
}

