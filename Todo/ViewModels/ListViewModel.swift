//
//  ListViewModel.swift
//  Todo
//
//  Created by Shubham kumar on 07/07/25.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    init() {
        getItems()

    }
    func getItems() {
        let newItem = [
            ItemModel(
                title: "Pending",
                status: .pending
            ),
            ItemModel(
                title: "Done",
                status: .completed
            ),
            ItemModel(
                title: "In Progress",
                status: .inProgress
            ),
        ]
        items.append(contentsOf: newItem)
    }

    func DeleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func MoveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func AddNewItem(title: String) {
        let newItem = ItemModel(
            title: title,
            status: .pending
        )
        items.append(newItem)
    }

    func updateItemStatus(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateStatus()
        }
    }

}
