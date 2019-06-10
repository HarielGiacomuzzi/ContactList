//
//  SearchViewController.swift
//  ContactList
//
//  Created by Hariel Giacomuzzi on 10/06/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var telefoneLabel: UILabel!

    fileprivate let contactsService = ContactsService()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.activityIndicator.stopAnimating()
        self.toggleLabels(isHidden: true)
    }

    private func toggleLabels(isHidden: Bool) -> Void {
        self.nameLabel.isHidden = isHidden
        self.emailLabel.isHidden = isHidden
        self.telefoneLabel.isHidden = isHidden
    }

    @IBAction func searchAction(_ sender: Any) {
        self.activityIndicator.startAnimating()
        self.toggleLabels(isHidden: true)

        guard let idText = idTextField.text,
              let idInt = Int(idText)
        else {
            self.activityIndicator.stopAnimating()
            return
        }

        self.contactsService.searchById(id: idInt) {contact in
            self.nameLabel.text = contact.nome
            self.emailLabel.text = contact.email
            self.telefoneLabel.text = contact.telefone
            self.toggleLabels(isHidden: false)
            self.activityIndicator.stopAnimating()
        }

    }
}
