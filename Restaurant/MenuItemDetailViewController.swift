//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Fried on 04/12/2018.
//  Copyright © 2018 Fried. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    var menuItem: MenuItem!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToOrderButton.applyDesign()
        updateUI()
    }
    
    /// set details of menu item and get image from API
    func updateUI() {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailTextLabel.text = menuItem.detailText
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }

    /// add item to order
    @IBAction func addToOrderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        MenuController.shared.order.menuItems.append(menuItem)
    }
}

// button design
extension UIButton {
    func applyDesign() {
        self.backgroundColor = UIColor.darkGray
        self.layer.cornerRadius = self.frame.height / 2
        self.setTitleColor(UIColor.white, for: .normal)
    }
}
