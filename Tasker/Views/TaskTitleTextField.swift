//
//  TaskTitleTextField.swift
//  Tasker
//
//  Created by Prateek Sujaina on 06/04/24.
//

import SwiftUI

struct TaskTitleTextField: View {
    @Binding var title: String
    
    var body: some View {
        TextField("Title", text: $title)
            .textFieldStyle(.roundedBorder)
    }
}
