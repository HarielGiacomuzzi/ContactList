//
//  AddContactViewController.swift
//  ContactList
//
//  Created by Hariel Giacomuzzi on 10/06/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    @IBOutlet var telefoneTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    fileprivate let contactService = ContactsService()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.activityIndicator.stopAnimating()
    }

    @IBAction func saveButtonAction(_ sender: Any) {
        self.activityIndicator.startAnimating()

        guard let email = emailTextField.text,
              let telefone = telefoneTextField.text,
              let nome = nameTextField.text
        else {
            self.activityIndicator.stopAnimating()
            return
        }

        let newContact = Contact(nome: nome, email: email, telefone: telefone)

        self.contactService.insertNewContact(contact: newContact) {
            self.activityIndicator.stopAnimating()
            guard let navigation = self.navigationController else { return }
            navigation.popViewController(animated: true)
        }
    }
}
