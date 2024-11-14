//
//  DetailsViewController.swift
//  assignment_8
//
//  Created by Алихан Абихас on 06.11.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var skinName: String
    var skinDetails: String
    var skinImage: UIImage?
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let detailsLabel = UILabel()
    
    init(skinName: String, skinDetails: String, skinImage: UIImage?) {
        self.skinImage = skinImage
        self.skinName = skinName
        self.skinDetails = skinDetails
        super.init(nibName: nil, bundle: nil)  
    }
    
    required init?(coder: NSCoder) {
        self.skinName = ""
        self.skinDetails = ""
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = skinName
        
        setupViews()
    }
    
    private func setupViews() {
        imageView.backgroundColor = UIColor.black
        imageView.layer.cornerRadius = 12.0
        imageView.image = skinImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        

        nameLabel.text = skinName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        

        detailsLabel.text = skinDetails
        detailsLabel.font = UIFont.systemFont(ofSize: 16)
        detailsLabel.numberOfLines = 0
        detailsLabel.textAlignment = .center
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailsLabel)
        

        NSLayoutConstraint.activate([
            // ImageView constraints
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            // NameLabel constraints
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // DetailsLabel constraints
            detailsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
