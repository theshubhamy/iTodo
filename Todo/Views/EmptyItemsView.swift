//
//  EmptyItemsView.swift
//  Todo
//
//  Created by Shubham kumar on 08/07/25.
//

import SwiftUI

struct EmptyItemsView: View {
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView {
            VStack {
                Text("There is no items!").font(.title).fontWeight(.semibold)
                Text(
                    "Are you a productive person? I think you should click add button and add bunch of items to your todo list!"
                ).padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Items 😊".uppercased()).foregroundColor(
                            .white
                        )
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(
                            animate
                                ? secondaryAccentColor : Color.accentColor
                        )
                        .cornerRadius(10)
                    }

                ).padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color: animate
                            ? secondaryAccentColor.opacity(0.7)
                            : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0.0,
                        y: animate ? 50 : 30
                    ).scaleEffect(
                        animate ? 1.1 : 1.0
                    ).offset(y: animate ? -7 : 0)

            }.frame(
                maxWidth: 400
            ).multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnnimation)

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func addAnnimation() {
        guard !animate else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 2.0).repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        EmptyItemsView().navigationTitle("Title")
    }
}
