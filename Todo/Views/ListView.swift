//
//  ListView.swift
//  Todo
//
//  Created by Shubham kumar on 07/07/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        List {
            ForEach(listViewModel.items, id: \.id) { newitem in
                ListRowView(item: newitem).contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItemStatus(item: newitem)
                        }
                    }
            }.onDelete(perform: listViewModel.DeleteItem)
                .onMove(perform: listViewModel.MoveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }

}

#Preview {
    NavigationView {
        ListView()
    }.environmentObject(ListViewModel())
}
