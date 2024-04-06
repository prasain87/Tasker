//
//  TaskDescriptionView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 06/04/24.
//

import SwiftUI

struct TaskDescriptionView: View {
    @Binding var desc: String
    
    var body: some View {
        HStack {
            Text("Description")
                .font(.title3)
                .foregroundStyle(.secondary)
            Spacer()
        }
            .padding(.top, 5)
        TextEditor(text: $desc)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                .gray.opacity(0.3),
                in: RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                    .stroke(lineWidth: 1)
            )
    }
}
