//
//  ViewController.swift
//  assignment_8
//
//  Created by Алихан Абихас on 06.11.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let sectionTitles = ["Uniforms", "Weapons", "Charms"]
    
    let data = [
        [("KAMAKIRI", "SMOKE")],
        [("BLACK ICE", "416-C CARBINE"), ("GIANTS GAMING", "552 COMMANDO"), ("GLACIER", "AK-12"), ("CLOUD9", "M590A1"), ("TEAM EMPIRE", "R4-C"), ("BLACK ICE", "SMG-11")],
        [("MAJOR PARIS", "UNIVERSAL"), ("2017 INVITATIONAL", "UNIVERSAL")]
    ]
    
    let images = [
        [UIImage(named: "SMOKE")],
        [UIImage(named: "416-C CARBINE"), UIImage(named: "552 COMMANDO"), UIImage(named: "AK-12"), UIImage(named: "M590A1"), UIImage(named: "R4-C"), UIImage(named: "SMG-11")],
        [UIImage(named: "MAJOR PARIS"), UIImage(named: "2017 INVITATIONAL")]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.title = "R6 Skins"
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let title = data[indexPath.section][indexPath.row].0
        let details = data[indexPath.section][indexPath.row].1
        
        let image = images[indexPath.section][indexPath.row]
        
        cell.configure(with: image, title: title, details: details)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCellTap(_:)))
        cell.addGestureRecognizer(tapGesture)
        
        return cell
    }
    
    @objc func handleCellTap(_ sender: UITapGestureRecognizer) {
        guard let cell = sender.view as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else { return }
        
        let skinName = data[indexPath.section][indexPath.row].0
        let skinDetails = data[indexPath.section][indexPath.row].1
        let skinImage = images[indexPath.section][indexPath.row]
        
        let vc = DetailsViewController(skinName: skinName, skinDetails: skinDetails, skinImage: skinImage)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

