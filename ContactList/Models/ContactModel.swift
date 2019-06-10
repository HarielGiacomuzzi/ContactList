//
//  ContactModel.swift
//  ContactList
//
//  Created by Hariel Giacomuzzi on 03/06/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import Foundation

class Contact: Decodable {
    let id: Int?
    let nome: String
    let email: String
    let telefone: String


    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ContactCodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        nome = try values.decode(String.self, forKey: .nome)
        email = try values.decode(String.self, forKey: .email)
        telefone = try values.decode(String.self, forKey: .telefone)
    }

    init(nome: String, email: String, telefone: String) {
        self.nome = nome
        self.email = email
        self.telefone = telefone
        self.id = nil
    }
}

extension Contact: Equatable {
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Contact {
    enum ContactCodingKeys: String, CodingKey {
        case id
        case nome
        case email
        case telefone
    }
}
