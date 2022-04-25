//
//  ResultViewController.swift
//  BMI-Calculator-programmatically-coding
//
//  Created by Oleksandr Kachkin on 25.04.2022.
//

import UIKit

class ResultViewController: UIViewController {
  
  var bmiValue: String?
  var advise: String?
  var color: UIColor?
  var image: String?
  
  
  lazy var resultLabel: UILabel = {
    let label = UILabel()
    label.text = bmiValue
    label.textColor = 
  }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
