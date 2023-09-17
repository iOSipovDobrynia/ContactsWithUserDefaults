//
//  NewContactViewController.swift
//  ContactsWithUserDefaults
//
//  Created by Goodwasp on 17.09.2023.
//

import UIKit

class NewContactViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var lastnameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

