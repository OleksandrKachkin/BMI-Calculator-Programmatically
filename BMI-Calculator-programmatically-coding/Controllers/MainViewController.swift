//
//  MainViewController.swift
//  BMI-Calculator-programmatically-coding
//
//  Created by Oleksandr Kachkin on 25.04.2022.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK: - Properties
  
  private let mainView = MainView()
  private var calculatorBrain = CalculatorBrain()
  
  
  // MARK: - Lifecycle
  
  override func loadView() {
    super.loadView()
    
    self.view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mainView.delegate = self
  }
}

extension MainViewController: MainViewDelegate {
  
  func heightSliderChanged() {
    let height = String(format: "%.2f", mainView.heightSlider.value)
    mainView.cmLabel.text = "\(height) cm"
  }
  
  func weightSliderChanged() {
    let weight = String(format: "%.0f", mainView.weightSlider.value)
    mainView.kgLabel.text = "\(weight) kg"
  }
  
  func didTapCalculateButton() {
    let height = mainView.heightSlider.value
    let weight = mainView.weightSlider.value
    
    calculatorBrain.calculateBMI(weight: weight, height: height)
    
    let resultVC = ResultViewController()
    
    resultVC.configure(backgroundColor: calculatorBrain.getColor(), resultLabel: calculatorBrain.getBMIValue(), adviseLabel: calculatorBrain.getAdvice(), adviseImage: calculatorBrain.getImage())
    
    resultVC.modalTransitionStyle = .coverVertical
    self.present(resultVC, animated: true, completion: nil)
    
  }

}
