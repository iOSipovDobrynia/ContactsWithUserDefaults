//
//  StorageManager.swift
//  ContactsWithUserDefaults
//
//  Created by Goodwasp on 17.09.2023.
//

import Foundation

final class StorageManager {
    
    // MARK: - Static properties
    static let shared = StorageManager()
    
    // MARK: - Private properties
    private let defaults = UserDefaults.standard
    private let contactKey = "contacts"
    
    // MARK: - Initializer
    private init () {}
    
    // MARK: - Public func
    func save(contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        defaults.set(data, forKey: contactKey)
    }
    
    func fetchContacts() -> [Contact] {
        guard let data = defaults.data(forKey: contactKey) else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        
        return contacts
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        defaults.set(data, forKey: contactKey)
    }
}
