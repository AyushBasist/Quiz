//
//  ResultViewController.swift
//  Quiz
//
//  Created by Romir Malik on 31/01/21.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var advice: UILabel!
    
    var adviceLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        advice.text = adviceLabel
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
