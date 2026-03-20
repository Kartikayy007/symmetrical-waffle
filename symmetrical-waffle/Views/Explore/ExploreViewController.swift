




import UIKit

final class ExploreViewController: UIViewController {

    
    private let viewModel = ExploreViewModel()

    
    enum Section: Int, CaseIterable {
        case stories
        case posts
    }

    

    private let headerView: HeaderView = {
        let v = HeaderView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseID)
        cv.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseID)
        return cv
    }()

    private let tabBar: CustomTabBar = {
        let v = CustomTabBar()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupLayout()
        bindViewModel()
    }

    

    private func setupBackground() {
        
        view.backgroundColor = UIColor(red: 230/255.0, green: 238/255.0, blue: 250/255.0, alpha: 1)
    }

    private func setupLayout() {
        view.addSubview(headerView)
        view.addSubview(collectionView)
        view.addSubview(tabBar)

        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),

            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 104),
        ])

        tabBar.clipsToBounds = false

        
        collectionView.contentInset.bottom = 120
        
        
        tabBar.onChatTap = { [weak self] in
            let chatVC = ChatViewController()
            chatVC.modalPresentationStyle = .fullScreen
            self?.present(chatVC, animated: true)
        }
        
        tabBar.onProfileTap = { [weak self] in
            let profileVC = ProfileViewController()
            profileVC.modalPresentationStyle = .fullScreen
            self?.present(profileVC, animated: true)
        }
    }

    

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let section = Section(rawValue: sectionIndex) else { return nil }
            switch section {
            case .stories:
                return self?.createStorySection()
            case .posts:
                return self?.createPostSection()
            }
        }
    }

    private func createStorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(76),
            heightDimension: .absolute(96)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(76),
            heightDimension: .absolute(96)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        return section
    }

    private func createPostSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(400)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(400)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0)
        return section
    }

    

    private func bindViewModel() {
        viewModel.onStoriesUpdated = { [weak self] _ in
            self?.collectionView.reloadSections(IndexSet(integer: Section.stories.rawValue))
        }
        viewModel.onPostsUpdated = { [weak self] _ in
            self?.collectionView.reloadSections(IndexSet(integer: Section.posts.rawValue))
        }
    }
}



extension ExploreViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sec = Section(rawValue: section) else { return 0 }
        switch sec {
        case .stories:
            return viewModel.stories.count
        case .posts:
            return viewModel.posts.count
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }

        switch section {
        case .stories:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StoryCell.reuseID,
                for: indexPath
            ) as? StoryCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: viewModel.stories[indexPath.item])
            return cell

        case .posts:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PostCell.reuseID,
                for: indexPath
            ) as? PostCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: viewModel.posts[indexPath.item])
            return cell
        }
    }
}



extension ExploreViewController: UICollectionViewDelegate {
    
}
