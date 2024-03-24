//
//  User.swift
//  Projet mobile
//
//  Created by Samy Louchahi on 23/03/2024.
//

import Foundation
import SwiftUI

struct User : Codable{
    var pseudo : String
    var nom : String
    var prenom : String
    var mail : String
    var mdp : String
    var asso : String? = ""
    var tel : String
    var tailleTshirt : String
    var hebergement : Bool //true = propose, false = demande
    var vegetarien : Bool
    var role : Int
}
enum CodingKeys : String, CodingKey{
    case  pseudo, nom, prenom, mail, mdp, asso, tel,tailleTshirt, hebergement,vegetarien, role
}
