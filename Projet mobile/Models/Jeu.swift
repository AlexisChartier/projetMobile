//
//  Jeux.swift
//  Projet mobile
//
//  Created by Samy Louchahi on 26/03/2024.
//

import Foundation


struct Jeu : Codable {
    let idJeu: Int
    let nom: String
    let auteur: String
    let editeur: String
    let nbJoueurs: String
    let ageMin: Int
    let duree: String
    let type: String
    let notice: String?
    let aAnimer: String?
    let recu: String?
    let mecanismes: String
    let themes: String
    let tags: String
    let description: String
    let image: String
    let logo: String
    let video: String
}


func getAllJeux(completion : @escaping (Result<[Jeu]?,Error>) -> Void){
    // Get all jeux
    let url = URL(string: "http://localhost:3000/festivaldujeu/api/jeux")!
    // Create a URL request
    var request = URLRequest(url: url)
    // Set the HTTP method
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    // Create a URLSession
    URLSession.shared.dataTask(with: request){
        data, response, error in
        guard let data = data, error == nil else {
            if let error = error {
                completion(.failure(error))
            } else {
                print("erreur api authentification")
            }
            return
        }
        // Try to decode the data
        do {
            // Print data as string
            print(String(data: data, encoding: .utf8)!)
            let jeux = try JSONDecoder().decode([Jeu].self, from: data)
            completion(.success(jeux))
        } catch {
            completion(.failure(error))
        }
        
    }.resume()
}
