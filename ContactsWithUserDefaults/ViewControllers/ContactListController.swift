//
//  ContactListController.swift
//  ContactsWithUserDefaults
//
//  Created by Goodwasp on 17.09.2023.
//

import UIKit

class ContactListController: UITableViewController {

    // MARK: - Private properties
    private let contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        return cell
    }
}
