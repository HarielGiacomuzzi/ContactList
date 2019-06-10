//
//  ContactListTests.swift
//  ContactListTests
//
//  Created by Hariel Giacomuzzi on 03/06/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import XCTest
@testable import ContactList

class ContactListTests: XCTestCase {
    private var contactService: ContactsService?


    override func setUp() {
        self.contactService = ContactsService()
    }

    override func tearDown() {
        self.contactService = nil
    }

    func testGetAllContacts() {
        self.contactService?.getAllContacts { contacts in
            assert(contacts.count != 0)
        }
    }

    func testGetContactById() {
        self.contactService?.searchById(id: 1) { contact in
            assert(contact.nome == "Guilherme Lacerda")
        }
    }

    func testInsertContact() {
        let newContact = Contact(nome: "Test Contact", email: "a@a.com", telefone: "51 99999-9999")
        self.contactService?.insertNewContact(contact: newContact) {
            self.contactService?.getAllContacts { contacts in
                contacts.forEach {contact in
                    if contact.nome == "Test Contact" {
                        assert(true)
                    }
                }
                assert(false)
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
