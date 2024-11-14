//
//  SecondViewController.swift
//  assignment_9
//
//  Created by Алихан Абихас on 14.11.2024.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let items = [
        TableItem(title: "The Illuminated Iguana", description: "Glows in the dark, loves reggae music, and performs stand-up comedy."),
        TableItem(title: "The Disco Dragon", description: "Breathes glitter, loves disco balls, and never stops grooving."),
        TableItem(title: "The Whistling Walrus", description: "Known for catchy sea shanties and impeccable rhythm."),
        TableItem(title: "The Mischievous Moon Rabbit", description: "Steals carrot cakes and hops across constellations."),
        TableItem(title: "The Melancholy Moth", description: "Writes poetry about lamplight and night skies."),
        TableItem(title: "The Caffeine-Crazed Chameleon", description: "Changes colors based on espresso strength."),
        TableItem(title: "The Prankster Pigeon", description: "Steals breadcrumbs and delivers questionable love notes."),
        TableItem(title: "The Tech-Savvy Tortoise", description: "Runs a popular blog on snail mail and fiber optic cables."),
        TableItem(title: "The Galactic Goldfish", description: "Can swim through space and gives excellent relationship advice."),
        TableItem(title: "The Wise Wizard Wombat", description: "Specializes in magic mushrooms and profound haikus.")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Second Tab"
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

        let item = items[indexPath.row]
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = item.title
        cell.contentView.addSubview(titleLabel)
        
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = item.description
        descriptionLabel.numberOfLines = 0
        cell.contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -8)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCellTap(_:)))
        cell.addGestureRecognizer(tapGesture)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    @objc func handleCellTap(_ sender: UITapGestureRecognizer) {
        guard let cell = sender.view as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else { return }
        
        let item = items[indexPath.row]
        
        let vc = DetailsViewController(tableItem: item)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
