import Foundation

final class ChatViewModel {
    private(set) var messages: [ChatMessage] = []
    
    var onMessagesUpdated: (() -> Void)?
    
    init() {
        loadMockMessages()
    }
    
    private func loadMockMessages() {
        
        let now = Date()
        messages = [
            ChatMessage(id: UUID(), text: "Hi Catherine ! How are you?", isCurrentUser: false, timestamp: now.addingTimeInterval(-3600)),
            ChatMessage(id: UUID(), text: "I'm good and you?", isCurrentUser: true, timestamp: now.addingTimeInterval(-3500)),
            ChatMessage(id: UUID(), text: "I'm doing good. What are you doing ?", isCurrentUser: false, timestamp: now.addingTimeInterval(-3400)),
            ChatMessage(id: UUID(), text: "I'm working on my app design.", isCurrentUser: true, timestamp: now.addingTimeInterval(-3300)),
            ChatMessage(id: UUID(), text: "Let's get lunch! How about sushi ?", isCurrentUser: false, timestamp: now.addingTimeInterval(-3200)),
            ChatMessage(id: UUID(), text: "That sounds great!", isCurrentUser: true, timestamp: now.addingTimeInterval(-3100))
        ]
        onMessagesUpdated?()
    }
    
    func sendMessage(_ text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        let newMessage = ChatMessage(
            id: UUID(),
            text: trimmed,
            isCurrentUser: true,
            timestamp: Date()
        )
        messages.append(newMessage)
        onMessagesUpdated?()
    }
}
