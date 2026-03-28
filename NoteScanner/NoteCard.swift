//
//  NoteCard.swift
//  NoteScanner
//
//  Created by Saqer Alshehri on 09/10/1447 AH.
//
import SwiftUI
struct NoteCard : View {
    var date : Date
    var content : String
    var body : some View {
        RoundedRectangle(cornerRadius : 20)
            .fill(.ultraThinMaterial)
            .frame(width : 300, height : 90)
            .overlay(alignment : .leading){
                VStack(spacing : 8){
                    Text(date.formatted())
                        .font(.system(size : 12,weight: .bold,design: .monospaced))
                        .foregroundColor(.secondary)
                    Text(content)
                        .font(.system(size : 14,weight: .bold,design: .monospaced))
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    Spacer()
                }
                .padding()
            }
            .overlay{
                RoundedRectangle(cornerRadius :  20)
                    .stroke(.black.opacity(0.15), lineWidth: 1)
            }
    }
}
#Preview{
    NoteCard(date : Date(), content: "Note Content Note Content Note Content Note Content Note Content Note Content Note Content Note Content Note Content")
}
