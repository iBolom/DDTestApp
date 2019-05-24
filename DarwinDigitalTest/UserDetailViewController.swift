//
//  UserDetailViewController.swift
//  DarwinDigitalTest
//
//  Created by Bojan Markovic on 24/05/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

final class UserDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var avatarImageView: UIImageView?
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var companyLabel: UILabel?
    @IBOutlet private weak var addressLabel: UILabel?
    @IBOutlet private weak var phoneLabel: UILabel?
    @IBOutlet private weak var websiteLabel: UILabel?
    
    // MARK: - Properties
    var user: User?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = user {
            avatarImageView?.kf.setImage(with: URL(string: user.avatar) ?? nil)
            nameLabel?.text?.append(" \(user.name)")
            companyLabel?.text?.append(" \(user.company.name)")
            addressLabel?.text?.append(" \(user.address.city), \(user.address.street)")
            phoneLabel?.text?.append(" \(user.phone)")
            websiteLabel?.text?.append(" \(user.website)")
        }
    }
    
    // MARK: - Actions
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
