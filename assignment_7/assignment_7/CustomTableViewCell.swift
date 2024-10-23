//
//  CustomTableViewCell.swift
//  assignment_7
//
//  Created by Алихан Абихас on 23.10.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let uiImageView = UIImageView()
    let uiTitleLabelView = UILabel()
    let uiDetailsLabelView = UILabel()
    let uiCellStackView = UIStackView()
    let uiDetailsStackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiTitleLabelView.translatesAutoresizingMaskIntoConstraints = false
        uiDetailsLabelView.translatesAutoresizingMaskIntoConstraints = false
        uiCellStackView.translatesAutoresizingMaskIntoConstraints = false
        
        uiTitleLabelView.font = UIFont.systemFont(ofSize: 18)
        uiDetailsLabelView.font = UIFont.systemFont(ofSize: 14)
        
        uiImageView.contentMode = .scaleAspectFit
        uiImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        uiImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        uiImageView.backgroundColor = UIColor.black
        uiImageView.layer.cornerRadius = 12.0
        
        uiDetailsStackView.axis = .vertical
        uiDetailsStackView.distribution = .fillEqually
        uiDetailsStackView.alignment = .leading
        uiDetailsStackView.spacing = 8.0
        
        uiDetailsStackView.addArrangedSubview(uiTitleLabelView)
        uiDetailsStackView.addArrangedSubview(uiDetailsLabelView)
        
        uiCellStackView.axis = .horizontal
        uiCellStackView.distribution = .fillEqually
        uiCellStackView.alignment = .center
        uiCellStackView.spacing = 12.0
        
        uiCellStackView.addArrangedSubview(uiImageView)
        uiCellStackView.addArrangedSubview(uiDetailsStackView)
        
        contentView.addSubview(uiCellStackView)
        
        NSLayoutConstraint.activate([
            uiCellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            uiCellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            uiCellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            uiCellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    func configure(with image: UIImage?, title: String, details: String) {
        uiImageView.image = image
        uiTitleLabelView.text = title
        uiDetailsLabelView.text = details
    }
}
