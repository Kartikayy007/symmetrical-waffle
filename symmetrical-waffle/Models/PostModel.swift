import Foundation

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let handle: String
    let profileImageName: String
    let postImageName: String
    let commentCount: Int
    let likeCount: Int
}
