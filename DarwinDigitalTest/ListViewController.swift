//
//  ListViewController.swift
//  DarwinDigitalTest
//
//  Created by Bojan Markovic on 24/05/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

import Foundation
import UIKit

final class ListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar?
    
    // MARK: - Properties
    private var allUsers: [User] = [] // this property will be used for filtering during search
    private var isSearchActive: Bool = false // indicate if searching users is active
    
    var users: [User] = [] {
        didSet {
            users.sort { $0.name < $1.name }
            allUsers = users
            tableView.reloadData()
        }
    }
    var selectedRow: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set table view delegate and data source
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set tab bar controller delegate in order to pass users to MapViewController
        self.tabBarController?.delegate = self
        
        // Setup search bar
        searchBar?.delegate = self
        searchBar?.placeholder = "Type user name to search"
    }
    
    // MARK: - Prepare for Seque
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? UserDetailViewController {
            detailVC.user = isSearchActive ? allUsers[selectedRow] : users[selectedRow]
        }
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? allUsers.count : users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserTableViewCell.self), for: indexPath) as! UserTableViewCell
        userCell.configureCellWith(user: isSearchActive ? allUsers[indexPath.row] : users[indexPath.row])
        
        return userCell
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITabBarDelegate
extension ListViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let mapViewController = viewController as? MapViewController {
            mapViewController.users = users
        }
    }
}

// MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearchActive = !searchText.isEmpty
        allUsers = users
        if isSearchActive {
            allUsers = allUsers.filter { $0.name.contains(searchText) }
        }
        
        tableView.reloadData()
    }
}
