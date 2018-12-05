//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Fried on 04/12/2018.
//  Copyright © 2018 Fried. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    var minutes: Int!
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
        // Do any additional setup after loading the view.
    }
    

    

}
