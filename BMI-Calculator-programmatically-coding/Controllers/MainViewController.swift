//
//  MainViewController.swift
//  BMI-Calculator-programmatically-coding
//
//  Created by Oleksandr Kachkin on 25.04.2022.
//

import SwiftUI

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
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let calculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(MainViewController.self, action: #selector(calculateButtonPressed), for: .touchUpInside)
    button.setTitle("Calculate", for: .normal)
    button.titleLabel?.font = .boldSystemFont(ofSize: 25)
    button.layer.cornerRadius = 10
    button.backgroundColor = .white
    button.tintColor = .black
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let heightSlider: UISlider = {
    let slider = UISlider()
    slider.addTarget(MainViewController.self, action: #selector(heightSliderChanged), for: .touchUpInside)
    slider.maximumValue = 3.0
    slider.minimumTrackTintColor = .white
    slider.maximumTrackTintColor = .gray
    slider.value = 1.76
    slider.translatesAutoresizingMaskIntoConstraints = false
    return slider
  }()
  
  private let heightLabel: UILabel = {
    let label = UILabel()
    label.text = "Height"
    label.font = .boldSystemFont(ofSize: 15)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let cmLabel: UILabel = {
    let label = UILabel()
    label.text = "1.76 cm"
    label.font = .systemFont(ofSize: 15)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let weightSlider: UISlider = {
    let slider = UISlider()
    slider.addTarget(MainViewController.self, action: #selector(weightSliderChanged), for: .touchUpInside)
    slider.maximumValue = 200
    slider.value = 100
    slider.minimumTrackTintColor = .white
    slider.maximumTrackTintColor = .gray
    slider.translatesAutoresizingMaskIntoConstraints = false
    return slider
  }()
  
  private let weightLabel: UILabel = {
    let label = UILabel()
    label.text = "Weight"
    label.font = .boldSystemFont(ofSize: 15)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let kgLabel: UILabel = {
    let label = UILabel()
    label.text = "100 kg"
    label.font = .systemFont(ofSize: 15)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  // MARK: - @Objc-methods
  
  @objc private func calculateButtonPressed() {
    
    let weight = weightSlider.value
    let height = heightSlider.value
    calculatorBrain.calculateBMI(weight: weight, height: height)
    
    
  }
  
  @objc private func heightSliderChanged() {
    
  }
  
  @objc private func weightSliderChanged() {
    
  }
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

// MARK: - Show Canvas like SwiftUI

struct SwiftUIController: UIViewControllerRepresentable {
  typealias UIViewControllerType = MainViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
    
  }
}

struct SwiftUIController_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIController().edgesIgnoringSafeArea(.all)
  }
}
