import Foundation

struct ChatMessage: Identifiable {
    let id: UUID
    let text: String
    let isCurrentUser: Bool
    let timestamp: Date
}
