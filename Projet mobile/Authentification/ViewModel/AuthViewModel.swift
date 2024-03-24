//
//  AuthViewModel.swift
//  Projet mobile
//
//  Created by Samy Louchahi on 23/03/2024.
//

import Foundation
import SwiftUI

class AuthViewModel : ObservableObject{
    @Published var users = [User]()
    init(users: [User] = [User]()) {
        self.users = users
        self.fetchUser()
    }
    
    func fetchUser() {
        guard let url = URL(string: "http://localhost:3000/festivaldujeu/api/users") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("error fetching data : \(error)")
                return
            }
            guard let data = data else {return}
            do {
                let users = try JSONDecoder().decode([User].self,from: data)
                DispatchQueue.main.async{
                    self.users = users
                }
            }catch let error {
                print("Error decoding data : \(error)")
             }
        }.resume()
    }
    func login(mail : String, mdp :String) -> User?{
        return users.first { user in
            user.mail == mail && user.mdp == mdp
        }
    }
    func register(user : User){
        if user.tel.count != 10{
            print("le numero de telephone ne doit contenir que 10 chiffres")
            self.fetchUser()
            return
        }
    }
}

