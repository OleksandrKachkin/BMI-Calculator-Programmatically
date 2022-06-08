//
//  ResultView.swift
//  BMI-Calculator-programmatically-coding
//
//  Created by Oleksandr Kachkin on 25.05.2022.
//

import UIKit

protocol ResultViewDelegate: AnyObject {
  
  func didTapRecalculateButton()
}

class ResultView: UIView {
  
  // MARK: - Properties
  
  public weak var delegate: ResultViewDelegate?
  
//  var result = ResultViewController()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "YOUR RESULT"
    label.textColor = .white
    label.font = .boldSystemFont(ofSize: 35)
    return label
  }()
  
  private var resultLabel: UILabel = {
    let label = UILabel()
//    label.text = result.bmiValue
    label.textColor = .white
    label.font = .boldSystemFont(ofSize: 35)
    return label
  }()
  
  private var adviseLabel: UILabel = {
    let label = UILabel()
//    label.text = result.advise
    label.font = .systemFont(ofSize: 25)
    label.textColor = .white
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  private var adviseImage: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 10
    imageView.contentMode = .scaleAspectFill //.scaleAspectFit
    return imageView
  }()
  
  private let recalculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapRecalculateButton), for: .touchUpInside)
    button.setTitle("RECALCULATE", for: .normal)
    button.tintColor = .black
    button.titleLabel?.font = .boldSystemFont(ofSize: 25)
    button.backgroundColor = .white
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
    [titleLabel, resultLabel, adviseLabel, adviseImage, recalculateButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview($0)
    }
    
    
  }
  
  public func configure(backgroundColor: UIColor?, resultLabel: String?, adviseLabel: String?, adviseImage: String?) {
    self.backgroundColor = backgroundColor
    self.resultLabel.text = resultLabel
    self.adviseLabel.text = adviseLabel
    if let image = adviseImage {
      self.adviseImage.image = UIImage(named: image)
    }
  }
  
  // MARK: - Actions
  
  @objc private func didTapRecalculateButton() {
     delegate?.didTapRecalculateButton()
   }
  
  // MARK: - Set constraints
  
  private func setConstraints() {
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
      resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      adviseLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 30),
      adviseLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      adviseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      adviseLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
    ])
    
    NSLayoutConstraint.activate([
      adviseImage.topAnchor.constraint(equalTo: adviseLabel.bottomAnchor, constant: 30),
      adviseImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      adviseImage.widthAnchor.constraint(equalToConstant: 150),
      adviseImage.heightAnchor.constraint(equalToConstant: 150)
    ])
    
    NSLayoutConstraint.activate([
      recalculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
      recalculateButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      recalculateButton.widthAnchor.constraint(equalToConstant: 300),
      recalculateButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}



