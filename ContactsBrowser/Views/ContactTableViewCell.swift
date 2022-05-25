//
//  ContactTableViewCell.swift
//  ContactsBrowser
//
//  Created by Дмитрий Мартынов on 24.05.2022.
//

import UIKit
import Contacts

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contactLabel: UILabel!
    
    func configure(with model: CNContact) {
        self.contactLabel.text = model.givenName + " " + model.familyName
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
