import Foundation

struct Story: Identifiable {
    let id = UUID()
    let username: String
    let imageName: String
    let isYourStory: Bool
}
