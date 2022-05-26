//
//  ContactTableViewCell.swift
//  ContactsBrowser
//
//  Created by Дмитрий Мартынов on 24.05.2022.
//

import UIKit
import Contacts

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    func configure(with model: Contact) {
        contactLabel.text = model.name + " " + model.secondName
        
        photoImageView.isHidden = model.photo == nil
        photoImageView.image = model.photo
        
        phoneLabel.isHidden = model.phoneNumber == nil
        phoneLabel.text = model.phoneNumber
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
