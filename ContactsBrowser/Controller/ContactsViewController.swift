//
//  ViewController.swift
//  ContactsBrowser
//
//  Created by Дмитрий Мартынов on 24.05.2022.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var contacts = [Contact]()
    
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
