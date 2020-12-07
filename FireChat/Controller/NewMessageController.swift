//
//  NewMessageController.swift
//  FireChat
//
//  Created by Stanley Traub on 12/6/20.
//

import UIKit

class NewMessageController: UITableViewController {
    
    // MARK: - Properties
    
    private var users = [User]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUsers()
    }
    
    // MARK: - Actions
    
    @objc private func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - API
    
    private func fetchUsers() {
        Service.fetchUsers { users in
            self.users = users
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        configureNavigationBar(withTitle: "New Message", prefersLargeTitles: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismissal))
        
        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.identifier)
        tableView.rowHeight = 80
    }
}

// MARK: - UITableViewDataSource

extension NewMessageController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as! UserCell
        cell.user = users[indexPath.row]
        return cell
    }
    
}
