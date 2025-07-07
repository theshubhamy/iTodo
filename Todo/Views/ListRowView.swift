//
//  ListRowView.swift
//  Todo
//
//  Created by Shubham kumar on 07/07/25.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var iconName: String {
        switch item.status {
        case .pending: return "circle"
        case .inProgress: return "clock"
        case .completed: return "checkmark.circle.fill"
        }
    }

    var iconColor: Color {
        switch item.status {
        case .pending: return .red
        case .inProgress: return .yellow
        case .completed: return .green
        }
    }

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            Text(item.title)
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {

    Group {
        ListRowView(
            item: ItemModel(
                title: "Pending Task",
                status: .pending
            )
        )
        ListRowView(
            item: ItemModel(
                title: "Task In Progress",
                status: .inProgress
            )
        )
        ListRowView(
            item: ItemModel(
                title: "Completed Task",
                status: .completed
            )
        )

    }

}
