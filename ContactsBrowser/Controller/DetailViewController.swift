//
//  DetailViewController.swift
//  ContactsBrowser
//
//  Created by Дмитрий Мартынов on 29.05.2022.
//

import UIKit

class DetailViewController: UIViewController {
   
    var photo = UIImage(systemName: "person.fill")
    var name = String()
   
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = photo
        nameLabel.text = name
        
    }
}
