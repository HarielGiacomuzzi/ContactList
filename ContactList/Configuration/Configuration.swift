//
//  Configuration.swift
//  ContactList
//
//  Created by Hariel Giacomuzzi on 03/06/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import Foundation

enum Servers: String, CustomStringConvertible{
    case production = "http://engswii-lista-contatos.herokuapp.com/api/"

    var description: String {
        return self.rawValue
    }
}

enum Routes: String, CustomStringConvertible{
    case listContacts = "contatos"

    var description: String {
        return self.rawValue
    }
}

enum ReuseIdentifiers: String, CustomStringConvertible{
    case contactIdentifier = "contactCell"

    var description: String {
        return self.rawValue
    }
}
