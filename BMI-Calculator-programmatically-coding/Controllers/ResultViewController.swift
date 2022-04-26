//
//  ResultViewController.swift
//  BMI-Calculator-programmatically-coding
//
//  Created by Oleksandr Kachkin on 25.04.2022.
//

import SwiftUI

class ResultViewController: UIViewController {
  
  var bmiValue: String?
  var advise: String?
  var color: UIColor?
  var image: String?
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "YOUR RESULT"
    label.textColor = .white
    label.font = .boldSystemFont(ofSize: 35)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var resultLabel: UILabel = {
    let label = UILabel()
    label.text = bmiValue
    label.textColor = .white
    label.font = .boldSystemFont(ofSize: 35)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var adviseLabel: UILabel = {
    let label = UILabel()
    label.text = advise
    label.font = .systemFont(ofSize: 25)
    label.textColor = .white
    label.numberOfLines = 0
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var adviseImage: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 10
    imageView.contentMode = .scaleAspectFill //.scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let recalculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
    button.setTitle("RECALCULATE", for: .normal)
    button.tintColor = .black
    button.titleLabel?.font = .boldSystemFont(ofSize: 25)
    button.backgroundColor = .white
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  // MARK: - @Objc-methods
  
  @objc func recalculateButtonPressed() {
    self.dismiss(animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(titleLabel)
    view.addSubview(resultLabel)
    view.addSubview(adviseLabel)
    view.addSubview(adviseImage)
    view.addSubview(recalculateButton)
    
    adviseImage.image = UIImage(named: image!)
    view.backgroundColor = color
    
    setConstraints()
  }
}


// MARK: - Set Constraints

extension ResultViewController {
  
  private func setConstraints() {
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
      resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      adviseLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 30),
      adviseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      adviseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      adviseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])
    
    NSLayoutConstraint.activate([
      adviseImage.topAnchor.constraint(equalTo: adviseLabel.bottomAnchor, constant: 30),
      adviseImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      adviseImage.widthAnchor.constraint(equalToConstant: 150),
      adviseImage.heightAnchor.constraint(equalToConstant: 150)
    ])
    
    NSLayoutConstraint.activate([
      recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
      recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      recalculateButton.widthAnchor.constraint(equalToConstant: 300),
      recalculateButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}


