//
//  DetailViewController.swift
//  ContactsBrowser
//
//  Created by Дмитрий Мартынов on 29.05.2022.
//

import UIKit

class DetailViewController: UIViewController {
   
    var photo = UIImage(systemName: "person.fill")
   
    @IBOutlet weak var photoImageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        photoImageView.image = photo
    }
   
}

















/*
private let photoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = ContactTableViewCell().photoImageView?.image
    return imageView
}()

private let nameLabel: UILabel = {
    let label = UILabel()
    return label
}()

private let messageButton: UIButton = {
    let button = UIButton()
    return button
}()

private let callButton: UIButton = {
    let button = UIButton()
    return button
}()

private let videoButton: UIButton = {
    let button = UIButton()
    return button
}()

private let emailButton: UIButton = {
    let button = UIButton()
    return button
}()

private lazy var buttonsStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [
        messageButton,
        callButton,
        videoButton,
        emailButton,
    ])
    
    stackView.spacing = 2
    stackView.distribution = .fillEqually
    stackView.axis = .horizontal
    stackView.alignment = .center
    return stackView
}()

private var dataTableView: UITableView {
    let table = UITableView()
    return table
}



override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .blue
    addSubviews()
    makeConstraints()
}

func addSubviews() {
    view.addSubview(photoImageView)
    view.addSubview(nameLabel)
    view.addSubview(buttonsStackView)
    view.addSubview(dataTableView)
}

func makeConstraints() {
    photoImageView.translatesAutoresizingMaskIntoConstraints = false
    photoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    photoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    photoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    photoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    nameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
    buttonsStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
    buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    buttonsStackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    
    dataTableView.translatesAutoresizingMaskIntoConstraints = false
    dataTableView.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 20).isActive = true
    dataTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    dataTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    dataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
}

*/
