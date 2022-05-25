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
    var contacts: [CNContact] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let authrizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        
        switch authrizationStatus {
        case .authorized:
            loadContacts()
            break
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
            contacts = [CNContact]()
            let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                               CNContactPhoneNumbersKey as CNKeyDescriptor,
                               CNContactEmailAddressesKey as CNKeyDescriptor,
            ]
            let request = CNContactFetchRequest(keysToFetch: keysToFetch)
            try contactStore.enumerateContacts(with: request, usingBlock: { cnContact, error in
                if cnContact.isKeyAvailable(CNContactEmailAddressesKey) {
                    for entry in cnContact.emailAddresses {
                        let strValue = entry.value as String
                        if entry.label == CNLabelHome && !strValue.isEmpty {
                            self.contacts.append(cnContact)
                            break
                        }
                    }
                }
            })
            self.tableView.reloadData()
        } catch {
            print("Ошибка получения списка контактов!")
        }
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       tableView.backgroundColor = .black
        /*
         --- Some test
        let contact1 = Contact(name: "Vasya", secondName: "Pupkin", phoneNumber: 79994257889)
        let contact2 = Contact(name: "Petya", secondName: "Lozhkin", phoneNumber: 79923459955)
        contacts.append(contact1)
        contacts.append(contact2)
         */
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
