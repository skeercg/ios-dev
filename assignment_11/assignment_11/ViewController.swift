//
//  ViewController.swift
//  assignment_11
//
//  Created by Алихан Абихас on 28.11.2024.
//

import UIKit
import Alamofire
import SDWebImage


class ViewController: UIViewController {
    
    private var superheroes: [Superhero]?
    
    // UI Components
    let superheroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let attributesLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let randomizeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Randomize", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(superheroImageView)
        view.addSubview(attributesLabel)
        view.addSubview(randomizeButton)
        
        NSLayoutConstraint.activate([
            superheroImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            superheroImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            superheroImageView.widthAnchor.constraint(equalToConstant: 200),
            superheroImageView.heightAnchor.constraint(equalToConstant: 200),
            
            attributesLabel.topAnchor.constraint(equalTo: superheroImageView.bottomAnchor, constant: 20),
            attributesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            attributesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            randomizeButton.topAnchor.constraint(equalTo: attributesLabel.bottomAnchor, constant: 20),
            randomizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomizeButton.widthAnchor.constraint(equalToConstant: 150),
            randomizeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        randomizeButton.addTarget(self, action: #selector(fetchRandomSuperhero), for: .touchUpInside)
    }
    
    @objc func fetchRandomSuperhero() {
        // Check if superheroes are already fetched
        if let superheroes = superheroes, !superheroes.isEmpty {
            if let randomHero = superheroes.randomElement() {
                updateUI(with: randomHero)
            } else {
                showError(message: "No superheroes found.")
            }
            return
        }
        
        // URL for the API
        let urlString = "https://akabab.github.io/superhero-api/api/all.json"
        
        // Fetch data using Alamofire
        AF.request(urlString).validate().responseDecodable(of: [Superhero].self) { [weak self] response in
            switch response.result {
            case .success(let superheroes):
                self?.superheroes = superheroes
                if let randomHero = superheroes.randomElement() {
                    self?.updateUI(with: randomHero)
                } else {
                    self?.showError(message: "No superheroes found.")
                }
            case .failure(let error):
                self?.showError(message: "Network Error: \(error.localizedDescription)")
            }
        }
    }
    
    func updateUI(with superhero: Superhero) {
        attributesLabel.text = """
        Name: \(superhero.name)
        Full Name: \(superhero.biography.fullName)
        Intelligence: \(superhero.powerstats.intelligence)
        Strength: \(superhero.powerstats.strength)
        Speed: \(superhero.powerstats.speed)
        Durability: \(superhero.powerstats.durability)
        Power: \(superhero.powerstats.power)
        Combat: \(superhero.powerstats.combat)
        """
        
        if let imageUrl = URL(string: superhero.images.lg) {
            superheroImageView.sd_setImage(
                with: imageUrl,
                placeholderImage: UIImage(named: "placeholder"),
                options: .continueInBackground, 
                completed: { image, error, cacheType, url in
                    if let error = error {
                        print("Error loading image: \(error.localizedDescription)")
                    } else {
                        print("Image loaded successfully from \(cacheType == .memory ? "memory cache" : "network").")
                    }
                }
            )
        }
    }
    
    func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                completion(UIImage(data: data))
            case .failure:
                completion(nil)
            }
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}

struct Superhero: Decodable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let biography: Biography
    let images: Images
}

struct Powerstats: Decodable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Biography: Decodable {
    let fullName: String
}

struct Images: Decodable {
    let lg: String
}

