//
//  AddView.swift
//  Todo
//
//  Created by Shubham kumar on 07/07/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldInput: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                TextField(
                    "Type here...",
                    text: $textFieldInput,
                )
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                Button(
                    action: saveButtomPressed,
                    label: {
                        Text("Save".uppercased()).foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                )
            }.padding(14)
        }
        .navigationTitle("Add a Item 🖋️").alert(
            isPresented: $showAlert,
            content: getAlert
        )
    }

    func saveButtomPressed() {
        if validateInput() {
            listViewModel.AddNewItem(title: textFieldInput)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func validateInput() -> Bool {
        if textFieldInput.count < 3 {
            alertTitle = "Invalid todo item."
            showAlert.toggle()
            return false
        }
        return true

    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }.environmentObject(ListViewModel())
}
