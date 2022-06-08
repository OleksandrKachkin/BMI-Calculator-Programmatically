//
//  ResultViewController.swift
//  BMI-Calculator-programmatically-coding
//
//  Created by Oleksandr Kachkin on 25.04.2022.
//

import SwiftUI

class ResultViewController: UIViewController {
  
  let resultView = ResultView()
  
  
  
  // MARK: - Lifecycle
  
  override func loadView() {
    super.loadView()
    
    self.view = resultView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    resultView.delegate = self
        
    
  }
  
  public func configure(backgroundColor: UIColor?, resultLabel: String?, adviseLabel: String?, adviseImage: String?) {
    resultView.configure(backgroundColor: backgroundColor, resultLabel: resultLabel, adviseLabel: adviseLabel, adviseImage: adviseImage)
  }
}
  


extension ResultViewController: ResultViewDelegate {
  
  func didTapRecalculateButton() {
    self.dismiss(animated: true, completion: nil)
  }
  
  
}
