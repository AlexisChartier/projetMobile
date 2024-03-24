//
//  RegisterView.swift
//  Projet mobile
//
//  Created by Samy Louchahi on 23/03/2024.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State private var pseudo: String = ""
    @State private var nom : String = ""
    @State private var prenom : String = ""
    @State private var mail : String = ""
    @State private var mdp : String = ""
    @State private var tel : String = ""
    @State private var asso : String = ""
    @State private var tailleTshirt : String = ""
    @State private var vegetarien : Bool = false
    @State private var hebergement : Bool = false
    @State private var role : Int = 0
    @State private var errorMessage : String = ""
    var body: some View {
        VStack{
            TextField("Pseudo :", text: $pseudo)
            TextField("Nom :", text: $nom)
            TextField("Prenom :", text: $prenom)
            TextField("Email", text: $mail)
            SecureField("Mot de passe :", text: $mdp)
            TextField("Numéro de tel :", text: $tel)
            TextField("association :", text : $asso)
            TextField(" taille du tee shirt :", text: $tailleTshirt)
            Toggle(isOn: $vegetarien){
                Text("Végétarien")
            }
            Toggle(isOn: $hebergement){
                Text("Propose un hébergement")
            }
            Picker("Role", selection: $role) {
                ForEach(0..<3) { index in
                    Text("role \(index)")
                }
            }
            .pickerStyle(.menu)
            Button(action: {
                let user = User(pseudo: self.pseudo, nom: self.nom, prenom: self.prenom, mail: self.mail, mdp: self.mdp, asso: self.asso, tel: self.tel, tailleTshirt: self.tailleTshirt, hebergement: self.hebergement, vegetarien: self.vegetarien, role: self.role)
                viewModel.register(user: user)
            }){
                Text("S'inscrire")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    RegisterView()
}
