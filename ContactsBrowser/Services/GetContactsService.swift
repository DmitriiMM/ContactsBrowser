//
//  GetContactsService.swift
//  ContactsBrowser
//
//  Created by Дмитрий Мартынов on 25.05.2022.
//

import Foundation
import Contacts


class GetContactsService {
    private init() {}
    
    let cont = { CNContactStore().requestAccess(for: .contacts) { success, error in
        guard success else {
            print("not authorized error: \(String(describing: error))")
            return
        }
    }
        do {
            let predicate = CNContact.predicateForContacts(matchingName: "Vasya")
            var contacts = try CNContactStore().unifiedContacts(matching: predicate, keysToFetch: [ CNContactFamilyNameKey as CNKeyDescriptor,
                CNContactGivenNameKey as CNKeyDescriptor,
                CNContactPhoneNumbersKey as CNKeyDescriptor,
                ])
            
            guard let contact = contacts.first else {
                print("There is no such contact")
                return
            }
            
            if contact.phoneNumbers.count > 0 {
                let number = contact.phoneNumbers[0].value
            }
            
        } catch {
            print(error)
        }
}
}
