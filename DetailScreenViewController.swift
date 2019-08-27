//
//  DetailScreenViewController.swift
//  WiF
//
//  Created by Sujit Molleti on 8/26/19.
//  Copyright © 2019 Sujit Molleti. All rights reserved.
//

import UIKit

class DetailScreenViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var HTempLabel: UILabel!
    @IBOutlet weak var LTempLabel: UILabel!
    
    var transferedTemp = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dateLabel.text = "8/26/2019"
        HTempLabel.text = transferedTemp + "F";
        LTempLabel.text = "32 " + "F";
    }
    

}
