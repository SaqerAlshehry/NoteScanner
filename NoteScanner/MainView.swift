//
//  ContentView.swift
//  NoteScanner
//
//  Created by Saqer Alshehri on 05/10/1447 AH.
//

import SwiftUI
import SwiftData


struct MainView: View {
    
    @Query var notes : [Note]
    
    var body: some View {
        VStack {
            Text("Note Scanner Project using AVFoundation Framework!")
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
        }
        .padding()
    }
}

#Preview {
    MainView()
}
