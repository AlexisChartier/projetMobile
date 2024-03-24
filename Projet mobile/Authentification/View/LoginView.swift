//
//  LoginView.swift
//  Projet mobile
//
//  Created by Samy Louchahi on 23/03/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var mdp = ""
    @State private var errorMessage = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            VStack(spacing: 40) {
                           InputCustom(imageName: "envelope",
                                            placeholderText: "Email",
                                            textCase: .lowercase,
                                            keyboardType: .emailAddress,
                                            textContentType: .emailAddress,
                                            text: $email)
                           
                           
                           InputCustom(imageName: "lock",
                                            placeholderText: "Password",
                                            textCase: .lowercase,
                                            keyboardType: .default,
                                            textContentType: .password,
                                            isSecureField: true,
                                            text: $mdp)
                       }
                       .padding(.horizontal, 32)
                       .padding(.top, 44)
            Button {
                            print("Se connecter")
                if self.viewModel.login(mail: self.email, mdp: self.mdp) != nil{
                    
                }else{
                    self.errorMessage = "erreur lors de la connection"
                }
                        } label: {
                            Text("Se connecter")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 340, height: 50)
                                .background(Color.purple)
                                .clipShape(Capsule())
                                .padding()
                        }
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                        
                        Spacer()
            NavigationLink{
                            RegisterView()
                                .navigationBarHidden(true)
                        }label: {
                            HStack {
                                Text("Pas encore de comptes?")
                                    .font(.footnote)
                                
                                Text("S'inscrire")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                        }
                        .padding(.bottom, 32)
                        .foregroundColor(Color.purple)

                    }
                    .ignoresSafeArea()
        }
    }


#Preview {
    LoginView()
}
