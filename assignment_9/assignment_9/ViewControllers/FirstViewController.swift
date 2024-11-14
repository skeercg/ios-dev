//
//  FirstViewController.swift
//  assignment_9
//
//  Created by Алихан Абихас on 14.11.2024.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let items = [
        TableItem(title: "The World's Greatest Cat", description: "Can open doors, solve Rubik's Cubes, and judge your life choices."),
        TableItem(title: "The Last Slice of Pizza", description: "A philosophical debate on the meaning of existence."),
        TableItem(title: "The Secret Society of Socks", description: "A mysterious organization plotting world domination, one sock at a time."),
        TableItem(title: "The Unidentified Floating Object", description: "Probably a cloud, but who's really sure?"),
        TableItem(title: "The Talking Teapot", description: "Spills tea, gives life advice, and sings show tunes."),
        TableItem(title: "The Time-Traveling Tomato", description: "Has seen dinosaurs, met aliens, and is still quite red."),
        TableItem(title: "The Ghostly Gardener", description: "Plants flowers, scares birds, and occasionally haunts the greenhouse."),
        TableItem(title: "The Quantum Squirrel", description: "Exists in multiple states of nuttiness at once."),
        TableItem(title: "The Intergalactic Ice Cream Truck", description: "Serving cosmic cones and stardust sundaes."),
        TableItem(title: "The Sentient Shoe", description: "Has a complex opinion on laces and a love-hate relationship with mud.")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "First Tab"
        
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
