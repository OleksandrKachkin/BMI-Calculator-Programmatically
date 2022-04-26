//
//  MainViewController.swift
//  BMI-Calculator-programmatically-coding
//
//  Created by Oleksandr Kachkin on 25.04.2022.
//

import UIKit

class MainViewController: UIViewController {
  
  var calculatorBrain = CalculatorBrain()
  
  private let backgroundImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "calculate_background")
    imageView.contentMode = .scaleToFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let calculatorLabel: UILabel = {
    let label = UILabel()
    label.text = "Calculate your BMI"
    label.font = .boldSystemFont(ofSize: 35)
    label.textColor = .darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let heightSlider: UISlider = {
    let slider = UISlider()
    slider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
    slider.maximumValue = 3.0
    slider.minimumTrackTintColor = #colorLiteral(red: 0.4566277862, green: 0.4467376471, blue: 0.8494898677, alpha: 1) // 7472D2
    slider.maximumTrackTintColor = .gray
    slider.value = 1.5
    slider.translatesAutoresizingMaskIntoConstraints = false
    return slider
  }()
  
  private let heightLabel: UILabel = {
    let label = UILabel()
    label.text = "Height"
    label.font = .boldSystemFont(ofSize: 15)
    label.textColor = .darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let cmLabel: UILabel = {
    let label = UILabel()
    label.text = "1.50 cm"
    label.font = .boldSystemFont(ofSize: 15)
    label.textColor = .darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let weightSlider: UISlider = {
    let slider = UISlider()
    slider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
    slider.maximumValue = 200
    slider.value = 100
    slider.minimumTrackTintColor = #colorLiteral(red: 0.4566277862, green: 0.4467376471, blue: 0.8494898677, alpha: 1) // 7472D2
    slider.maximumTrackTintColor = .gray
    slider.translatesAutoresizingMaskIntoConstraints = false
    return slider
  }()
  
  private let weightLabel: UILabel = {
    let label = UILabel()
    label.text = "Weight"
    label.font = .boldSystemFont(ofSize: 15)
    label.textColor = .darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let kgLabel: UILabel = {
    let label = UILabel()
    label.text = "100 kg"
    label.font = .boldSystemFont(ofSize: 15)
    label.textColor = .darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let calculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
    button.setTitle("CALCULATE", for: .normal)
    button.tintColor = .white
    button.titleLabel?.font = .boldSystemFont(ofSize: 25)
    button.backgroundColor = #colorLiteral(red: 0.3860434294, green: 0.3761426806, blue: 0.6165835857, alpha: 1) // 626099
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  // MARK: - @Objc-methods
  
  @objc private func calculateButtonPressed() {
    
    let height = heightSlider.value
    let weight = weightSlider.value
    
    calculatorBrain.calculateBMI(weight: weight, height: height)
    
    let resultVC = ResultViewController()
    
    resultVC.bmiValue = calculatorBrain.getBMIValue()
    resultVC.advise = calculatorBrain.getAdvice()
    resultVC.color = calculatorBrain.getColor()
    resultVC.image = calculatorBrain.getImage()

    
    resultVC.modalTransitionStyle = .coverVertical
    self.present(resultVC, animated: true, completion: nil)
  }
  
  @objc private func heightSliderChanged() {
    let height = String(format: "%.2f", heightSlider.value)
    cmLabel.text = "\(height) cm"
  }
  
  @objc private func weightSliderChanged() {
    let weight = String(format: "%.0f", weightSlider.value)
    kgLabel.text = "\(weight) kg"
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(backgroundImage)
    view.addSubview(calculatorLabel)
    view.addSubview(heightLabel)
    view.addSubview(cmLabel)
    view.addSubview(heightSlider)
    view.addSubview(weightLabel)
    view.addSubview(kgLabel)
    view.addSubview(weightSlider)
    view.addSubview(calculateButton)
    
    setConstraints()
  }
}

// MARK: - Set Constraints

extension MainViewController {
  
  private func setConstraints() {
    
    NSLayoutConstraint.activate([
      backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
      backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
    ])
    
    NSLayoutConstraint.activate([
      calculatorLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
      calculatorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      calculatorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
    NSLayoutConstraint.activate([
      heightSlider.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -100),
      heightSlider.heightAnchor.constraint(equalToConstant: 60),
      heightSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      heightSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
    
    NSLayoutConstraint.activate([
      heightLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: 10),
      heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      heightLabel.heightAnchor.constraint(equalToConstant: 21)
    ])
    
    NSLayoutConstraint.activate([
      cmLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: 10),
      cmLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      cmLabel.heightAnchor.constraint(equalToConstant: 21)
    ])
    
    NSLayoutConstraint.activate([
      weightSlider.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: 0),
      weightSlider.heightAnchor.constraint(equalToConstant: 60),
      weightSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      weightSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
    
    NSLayoutConstraint.activate([
      weightLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: 10),
      weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      weightLabel.heightAnchor.constraint(equalToConstant: 21)
    ])
    
    NSLayoutConstraint.activate([
      kgLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: 10),
      kgLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      kgLabel.heightAnchor.constraint(equalToConstant: 21)
    ])
    
    NSLayoutConstraint.activate([
      calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
      calculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      calculateButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}
