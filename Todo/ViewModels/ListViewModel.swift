//
//  ListViewModel.swift
//  Todo
//
//  Created by Shubham kumar on 07/07/25.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            SaveItems()
        }
    }

    let itemKey: String = "Todo_list"

    init() {
        getItems()

    }
    func getItems() {

        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItem = try? JSONDecoder().decode(
                [ItemModel].self,
                from: data
            )
        else {
            return
        }
        self.items = savedItem

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

    func SaveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
