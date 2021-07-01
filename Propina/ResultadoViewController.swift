//
//  ResultadoViewController.swift
//  Propina
//
//

import UIKit

class ResultadoViewController: UIViewController {
    
    var cantidad: Float = 0.0
    
    @IBOutlet weak var calculoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        calculoLabel.text = (String(format: "%.2f", cantidad))
    }
}
