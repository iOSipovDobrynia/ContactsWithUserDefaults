//
//  ContactListController.swift
//  ContactsWithUserDefaults
//
//  Created by Goodwasp on 17.09.2023.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func add(contact: Contact)
}

final class ContactListController: UITableViewController {

    // MARK: - Private properties
    private var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        
        let contact = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact.name
        content.secondaryText = contact.lastname
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let newContactVC = navigationVC.topViewController as? NewContactViewController else { return }
        newContactVC.delegate = self
    }
}

// MARK: - NewContactViewControllerDelegate
extension ContactListController: NewContactViewControllerDelegate {
    func add(contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
}
