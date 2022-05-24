//
//  ContactTableViewCell.swift
//  ContactsBrowser
//
//  Created by Дмитрий Мартынов on 24.05.2022.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contactLabel: UILabel!
    
    func configure(with model: Contact) {
        self.contactLabel.text = model.name + " " + model.secondName
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
