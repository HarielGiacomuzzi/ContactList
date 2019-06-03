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
}
