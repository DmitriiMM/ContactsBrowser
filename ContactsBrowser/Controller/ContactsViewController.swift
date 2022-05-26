//
//  ViewController.swift
//  ContactsBrowser
//
//  Created by Дмитрий Мартынов on 24.05.2022.
//

import UIKit
import Contacts
import MessageUI

class ContactsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var contactStore = CNContactStore()
    var contacts: [Contact] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let authrizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        
        switch authrizationStatus {
        case .authorized:
            loadContacts()
        case .denied, .notDetermined:
            self.contactStore.requestAccess(for: .contacts) { [self] access, accessError in
                if access {
                    loadContacts()
                } else {
                    print("Право доступа к контактам не предоставлено!")
                }
            }
        default:
            print("Право доступа к контактам не предоставлено!")
            break
        }
    }
    
    func loadContacts() {
        do {
            contacts = []
            let keysToFetch = [
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                CNContactPhoneNumbersKey as CNKeyDescriptor,
                CNContactEmailAddressesKey as CNKeyDescriptor,
                CNContactImageDataKey as CNKeyDescriptor,
            ]
            
            let request = CNContactFetchRequest(keysToFetch: keysToFetch)
            
            try contactStore.enumerateContacts(with: request, usingBlock: { cnContact, error in
                var image: UIImage? = nil
                if let data = cnContact.imageData {
                    image = UIImage(data: data)
                }
                let contact = Contact(
                    name: cnContact.givenName,
                    secondName: cnContact.familyName,
                    phoneNumber: cnContact.phoneNumbers.first?.value.stringValue,
                    photo: image
                )
                self.contacts.append(contact)
            })
            self.tableView.reloadData()
        } catch {
            print("Ошибка получения списка контактов!")
        }
    }
}

extension ContactsViewController: UITableViewDelegate {}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
        let contact = contacts[indexPath.row]
        cell.configure(with: contact)
        
        return cell
    }
    
    
}
