//
//  Baza.swift
//  Check_List
//
//  Created by RMS on 21/06/2024.
//

import Foundation
import SwiftData

@Model
class Baza: Identifiable{
    var id: String
    var name: String
    var checked: Bool
    init(name: String){
        self.id = UUID().uuidString
        self.name=name
        self.checked=false
    }
}


