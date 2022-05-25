//
//  MainView.swift
//  BMI-Calculator-programmatically-coding
//
//  Created by Oleksandr Kachkin on 25.05.2022.
//

import UIKit

protocol MainViewDelegate: AnyObject {
  func heightSliderChanged()
  func weightSliderChanged()
  func didTapCalculateButton()
}

class MainView: UIView {
  
  // MARK: - Properties
  
  public weak var delegate: MainViewDelegate?
  
  private let backgroundImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "calculate_background")
    imageView.contentMode = .scaleToFill
    return imageView
  }()
  
  private let calculatorLabel: UILabel = {
    let label = UILabel()
    label.text = "Calculate your BMI"
    label.font = .boldSystemFont(ofSize: 35)
    label.textColor = .darkGray
    return label
  }()
  
  public let heightSlider: UISlider = {
    let slider = UISlider()
    slider.maximumValue = 3.0
    slider.minimumTrackTintColor = #colorLiteral(red: 0.4566277862, green: 0.4467376471, blue: 0.8494898677, alpha: 1) // 7472D2
    slider.maximumTrackTintColor = .gray
    slider.value = 1.5
    slider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
    return slider
  }()
  
  private let heightLabel: UILabel = {
    let label = UILabel()
    label.text = "Height"
    label.font = .boldSystemFont(ofSize: 15)
    label.textColor = .darkGray
    return label
  }()
  
  public let cmLabel: UILabel = {
    let label = UILabel()
    label.text = "1.50 cm"
    label.font = .boldSystemFont(ofSize: 15)
    label.textColor = .darkGray
    return label
  }()
  
  public let weightSlider: UISlider = {
    let slider = UISlider()
    slider.maximumValue = 200
    slider.value = 100
    slider.minimumTrackTintColor = #colorLiteral(red: 0.4566277862, green: 0.4467376471, blue: 0.8494898677, alpha: 1) // 7472D2
    slider.maximumTrackTintColor = .gray
    slider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
    return slider
  }()
  
  private let weightLabel: UILabel = {
    let label = UILabel()
    label.text = "Weight"
    label.font = .boldSystemFont(ofSize: 15)
    label.textColor = .darkGray
    return label
  }()
  
  public let kgLabel: UILabel = {
    let label = UILabel()
    label.text = "100 kg"
    label.font = .boldSystemFont(ofSize: 15)
    label.textColor = .darkGray
    return label
  }()
  
  private let calculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapCalculateButton), for: .touchUpInside)
    button.setTitle("CALCULATE", for: .normal)
    button.tintColor = .white
    button.titleLabel?.font = .boldSystemFont(ofSize: 25)
    button.backgroundColor = #colorLiteral(red: 0.3860434294, green: 0.3761426806, blue: 0.6165835857, alpha: 1) // 626099
    button.layer.cornerRadius = 10
    return button
  }()

  // MARK: - Inits
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubviews()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setConstraints()
  }
  
  private func addSubviews() {
    [backgroundImage, calculatorLabel, heightLabel, cmLabel, heightSlider, weightLabel, kgLabel, weightSlider, calculateButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview($0)
    }
  }
  
  // MARK: - Actions
  
  @objc private func heightSliderChanged() {
    delegate?.heightSliderChanged()
  }
  
  @objc private func weightSliderChanged() {
    delegate?.weightSliderChanged()
  }
  
  @objc private func didTapCalculateButton() {
    delegate?.didTapCalculateButton()
  }
  
  // MARK: - Set constraints
  
  private func setConstraints() {
    
    NSLayoutConstraint.activate([
      backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
      backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    
    NSLayoutConstraint.activate([
      calculatorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      calculatorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      calculatorLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
    
    NSLayoutConstraint.activate([
      heightSlider.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -100),
      heightSlider.heightAnchor.constraint(equalToConstant: 60),
      heightSlider.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      heightSlider.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
    
    NSLayoutConstraint.activate([
      heightLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: 10),
      heightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      heightLabel.heightAnchor.constraint(equalToConstant: 21)
    ])
    
    NSLayoutConstraint.activate([
      cmLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: 10),
      cmLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      cmLabel.heightAnchor.constraint(equalToConstant: 21)
    ])
    
    NSLayoutConstraint.activate([
      weightSlider.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: 0),
      weightSlider.heightAnchor.constraint(equalToConstant: 60),
      weightSlider.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      weightSlider.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
    
    NSLayoutConstraint.activate([
      weightLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: 10),
      weightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      weightLabel.heightAnchor.constraint(equalToConstant: 21)
    ])
    
    NSLayoutConstraint.activate([
      kgLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: 10),
      kgLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      kgLabel.heightAnchor.constraint(equalToConstant: 21)
    ])
    
    NSLayoutConstraint.activate([
      calculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
      calculateButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      calculateButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}
