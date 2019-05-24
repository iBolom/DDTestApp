//
//  UserTableViewCell.swift
//  DarwinDigitalTest
//
//  Created by Bojan Markovic on 24/05/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

final class UserTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var avatarImageView: UIImageView?
    @IBOutlet private weak var nameCompanyNameLabel: UILabel?
    @IBOutlet private weak var addressLabel: UILabel?
    
    // MARK: - Methods
    func configureCellWith(user: User) {
        nameCompanyNameLabel?.text = user.name + "(\(user.company.name))"
        addressLabel?.text = "\(user.address.city), \(user.address.street)"
        avatarImageView?.kf.setImage(with: URL(string: user.avatar) ?? nil)
    }
}
