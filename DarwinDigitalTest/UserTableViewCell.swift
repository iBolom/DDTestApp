//
//  UserTableViewCell.swift
//  DarwinDigitalTest
//
//  Created by Bojan Markovic on 24/05/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

import Foundation
import UIKit

final class UserTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var avatarImageView: UIImageView?
    @IBOutlet private weak var nameCompanyNameLabel: UILabel?
    @IBOutlet private weak var addressLabel: UILabel?
}
