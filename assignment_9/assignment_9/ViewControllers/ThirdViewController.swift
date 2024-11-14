//
//  ThirdViewController.swift
//  assignment_9
//
//  Created by Алихан Абихас on 14.11.2024.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let items = [
        TableItem(title: "The Infinite Pencil", description: "Never runs out, writes only in invisible ink."),
        TableItem(title: "The Gravity-Defying Umbrella", description: "Floats above you, but only when it's sunny."),
        TableItem(title: "The Solar-Powered Night Light", description: "Turns on only when the sun is shining brightly."),
        TableItem(title: "The Inconspicuous Cloak", description: "Turns you invisible... when nobody's watching."),
        TableItem(title: "The Quantum Coffee Cup", description: "Both empty and full at the same time until you sip."),
        TableItem(title: "The Procrastination Alarm Clock", description: "Always rings five minutes later than you set it."),
        TableItem(title: "The Self-Filling Fountain Pen", description: "Writes great novels, but only in ancient runes."),
        TableItem(title: "The Mood-Matching Tie", description: "Changes color based on your emotions, sometimes lies."),
        TableItem(title: "The Humming Headphones", description: "Plays random elevator music when you need silence."),
        TableItem(title: "The Anti-Gravity Bookstand", description: "Floats your book in midair, but only when closed.")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Third Tab"
        
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
