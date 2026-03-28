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
        NavigationStack {
            ScrollView{
                ForEach(notes, id: \.id){ note in
                NavigationLink{
                    NoteInfo()
                } label : {
                    NoteCard(note : note)
                }
            }
            }
            .navigationTitle("Notes")
            Button{
                print("taken a photo")
            } label : {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width : 70, height: 70)
                    .overlay{
                        Image(systemName : "camera")
                            .font(.title)
                            .foregroundStyle(.black.opacity(0.7))
                    }
                    .overlay{
                        Circle()
                            .fill(.clear)
                            .stroke(Color.black.opacity(0.25), lineWidth: 0.3)
                        
                    }
                    
            }
        }
    }
}

#Preview {
    MainView()
}
