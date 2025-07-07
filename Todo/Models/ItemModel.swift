//
//  ItemModel.swift
//  Todo
//
//  Created by Shubham kumar on 07/07/25.
//

import Foundation

enum TaskStatus {
    case pending
    case inProgress
    case completed
}

struct ItemModel: Identifiable {
    let id: String
    let title: String
    var status: TaskStatus

    init(id: String = UUID().uuidString, title: String, status: TaskStatus = .pending) {
        self.id = id
        self.title = title
        self.status = status
    }
    func updateStatus() -> ItemModel {
        let nextStatus: TaskStatus
        switch status {
        case .pending:
            nextStatus = .inProgress
        case .inProgress:
            nextStatus = .completed
        case .completed:
            nextStatus = .completed 
        }

        return ItemModel(id: id, title: title, status: nextStatus)
    }

}
