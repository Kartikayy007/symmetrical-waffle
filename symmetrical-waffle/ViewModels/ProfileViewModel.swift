import Foundation

class ProfileViewModel {
    let user: ProfileUser
    let posts: [String]
    
    init() {
        self.user = ProfileUser(
            name: "Catherine",
            handle: "@Catherine13",
            followersCount: "1k",
            followingCount: "342",
            bio: "My name is Catherine. I like dancing in the rain\nand travelling all around the world.",
            avatarImageName: "profilepic"
        )
        self.posts = ["post-1", "post-2", "post-3", "post-4", "post-5", "post-6"]
    }
}
