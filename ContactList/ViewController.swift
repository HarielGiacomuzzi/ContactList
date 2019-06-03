//
//  ViewController.swift
//  ContactList
//
//  Created by Hariel Giacomuzzi on 03/06/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Local Configurations
    enum K: Double{
        case estimatedRowHeight = 88.0
    }

    //MARK: Local Variables
    private var contacts: [Contact] = []

    //MARK: Outlets
    @IBOutlet var tableView: UITableView!

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let service = ContactsService()

        service.getAllContacts {contacts in
            self.contacts = contacts
            self.tableView.reloadData()
        }

        self.tableView.estimatedRowHeight = CGFloat(K.estimatedRowHeight.rawValue)
    }

    //MARK: TableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.contactIdentifier.description) as! ContactTableViewCell
        cell.nameLabel.text = self.contacts[indexPath.row].nome
        cell.emailLabel.text = "e-mail: \(self.contacts[indexPath.row].email)"
        cell.telefoneLabel.text = "Telefone: \(self.contacts[indexPath.row].telefone)"

        return cell
    }

    //MARK: TableViewDatasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }

}

