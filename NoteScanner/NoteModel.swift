//
//  NoteModel.swift
//  NoteScanner
//
//  Created by Saqer Alshehri on 09/10/1447 AH.
//

import SwiftData
import Foundation

@Model
class Note: Identifiable {
    var id :  UUID
    var content: String
    var date: Date
    
    
    init(content : String){
        self.id = UUID()
        self.content = content
        self.date = Date()
    }
}
