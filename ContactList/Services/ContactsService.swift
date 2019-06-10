//
//  ContactsService.swift
//  ContactList
//
//  Created by Hariel Giacomuzzi on 03/06/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import Foundation
import Alamofire

class ContactsService: NSObject {

    func getAllContacts(completion: @escaping ([Contact]) -> Void) -> Void {
        AF.request("\(Servers.production)\(Routes.listContacts)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { response in
                guard let contatos = try? JSONDecoder().decode([Contact].self, from: response.data! ) else {
                    print("Error: Could not decode contacts")
                    return
                }
                completion(contatos)
            }
    }

    func insertNewContact(contact: Contact, completion: @escaping () -> Void) -> Void {
        let values: Parameters = [
            "nome" : contact.nome,
            "email" : contact.email,
            "telefone" : contact.telefone
        ]

        AF.request("\(Servers.production)\(Routes.insertContact)", method: .post, parameters: values, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .response { response in
                print(response)
                completion()
        }
    }

    func searchById(id: Int, completion: @escaping (Contact) -> Void) -> Void {
        AF.request("\(Servers.production)\(Routes.searchById)\(id.description)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { response in
                guard let contato = try? JSONDecoder().decode(Contact.self, from: response.data! ) else {
                    print("Error: Could not decode contacts")
                    return
                }
                completion(contato)
        }
    }
}
