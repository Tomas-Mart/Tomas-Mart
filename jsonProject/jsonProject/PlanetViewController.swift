//
//  PlanetViewController.swift
//  jsonProject
//
//  Created by Amina TomasMart on 09.03.2024.
//

import UIKit

class PlanetViewController: UIViewController {
    
    private var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let url = URL(string: "https://swapi.dev/api/planets/1")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                let planet = try JSONDecoder().decode(Planet.self, from: data)
                DispatchQueue.main.async {
                    self?.titleLabel.text = "Orbital period: \(planet.orbitalPeriod) days"
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    private func setupUI() {
        titleLabel = UILabel(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
    }
    
    struct Planet: Decodable {
        let name: String
        let orbitalPeriod: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case orbitalPeriod = "orbital_period"
        }
    }
}
