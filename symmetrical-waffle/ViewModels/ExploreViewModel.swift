




import Foundation

class ExploreViewModel {

    
    private(set) var stories: [Story] = []
    private(set) var posts: [Post] = []

    
    var onStoriesUpdated: (([Story]) -> Void)?
    var onPostsUpdated: (([Post]) -> Void)?

    
    init() {
        loadStories()
        loadPosts()
    }

    
    private func loadStories() {
        stories = [
            Story(username: "You", imageName: "story1", isYourStory: true),
            Story(username: "Benjamin", imageName: "story2", isYourStory: false),
            Story(username: "Farita", imageName: "story3", isYourStory: false),
            Story(username: "Marie", imageName: "story4", isYourStory: false),
            Story(username: "Clara", imageName: "story1", isYourStory: false),
            Story(username: "James", imageName: "story2", isYourStory: false)
        ]
        onStoriesUpdated?(stories)
    }

    private func loadPosts() {
        posts = [
            Post(
                username: "Claire Dangais",
                handle: "@ClaireD15",
                profileImageName: "story1",
                postImageName: "post1",
                commentCount: 10,
                likeCount: 122
            ),
            Post(
                username: "Farita Smith",
                handle: "@SmithFa",
                profileImageName: "story3",
                postImageName: "post2",
                commentCount: 8,
                likeCount: 95
            )
        ]
        onPostsUpdated?(posts)
    }
}
