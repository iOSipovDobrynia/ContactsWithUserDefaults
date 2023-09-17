//
//  NewContactViewController.swift
//  ContactsWithUserDefaults
//
//  Created by Goodwasp on 17.09.2023.
//

import UIKit

final class NewContactViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var lastnameTF: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    // MARK: - Public properties
    var delegate: NewContactViewControllerDelegate!
    
    // MARK: - View's life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        nameTF.addTarget(
            self,
            action: #selector(nameTFdidChanged),
            for: .editingChanged
        )
    }
    
    // MARK: - IBAction
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        save()
        dismiss(animated: true)
    }
    
    // MARK: - Private func
    @objc
    private func nameTFdidChanged() {
        guard let name = nameTF.text else { return }
        saveButton.isEnabled = !name.isEmpty
    }
    
    private func save() {
        let newContact = Contact(
            name: nameTF.text ?? "",
            lastname: lastnameTF.text ?? ""
        )
        
        delegate.add(contact: newContact)
    }
}

