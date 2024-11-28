import UIKit

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
            guard let url = URL(string: urlString) else {
                showError(message: "Invalid URL.")
                return
            }
            
            // Fetch data from API
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let error = error {
                    self?.showError(message: "Network Error: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    self?.showError(message: "No data received.")
                    return
                }
                
                do {
                    // Parse JSON and store in the cache
                    let superheroes = try JSONDecoder().decode([Superhero].self, from: data)
                    self?.superheroes = superheroes
                    
                    if let randomHero = superheroes.randomElement() {
                        DispatchQueue.main.async {
                            self?.updateUI(with: randomHero)
                        }
                    } else {
                        self?.showError(message: "No superheroes found.")
                    }
                } catch {
                    self?.showError(message: "Failed to parse JSON.")
                }
            }
        
        task.resume()
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
            fetchImage(from: imageUrl) { [weak self] image in
                DispatchQueue.main.async {
                    self?.superheroImageView.image = image
                }
            }
        }
    }
    
    func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                completion(UIImage(data: data))
            } else {
                completion(nil)
            }
        }.resume()
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
