//
//  ItemModel.swift
//  Todo
//
//  Created by Shubham kumar on 07/07/25.
//

import Foundation

enum TaskStatus: String, Codable, CaseIterable {
    case pending
    case inProgress
    case completed

    var next: TaskStatus {
        switch self {
        case .pending: return .inProgress
        case .inProgress: return .completed
        case .completed: return .completed
        }
    }
}

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    var status: TaskStatus

    init(id: String = UUID().uuidString, title: String, status: TaskStatus = .pending) {
        self.id = id
        self.title = title
        self.status = status
    }

    func updateStatus() -> ItemModel {
        return ItemModel(id: id, title: title, status: status.next)
    }

    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case status
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        status = try container.decode(TaskStatus.self, forKey: .status)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(status, forKey: .status)
    }
}
