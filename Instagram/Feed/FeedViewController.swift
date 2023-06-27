//
//  FeedViewController.swift
//  Instagram
//
//  Created by Alexey Manokhin on 26.06.2023.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    //MARK: - Private properties
    private let tableView = UITableView()
    private var items:  [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "alina")!, userName: "Alina", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "katya")!, userName: "Kate", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "alexey")!, userName: "Alexey", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "irina3")!, userName: "Irina", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, userName: "Sobaken", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, userName: "Sobaken", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, userName: "Sobaken", isAddButtonVisible: false, isNewStory: false)
        ]),
        .post(FeedPostItemInfo(userImage: UIImage(named: "alina")!, userName: "Alina", postSubtitle: "Sponsored", postImage: UIImage(named: "alina")!, numberOfLikes: 2355, comment: CommentShortInfo(userName: "userName", commentText: "🔥🔥🔥"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "alina")!, userName: "Alina", postSubtitle: "Belgorod", postImage: UIImage(named: "alina2")!, numberOfLikes: 3324, comment: CommentShortInfo(userName: "some_people", commentText: "Крутая фотка! Алина - красотка!"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "alina")!, userName: "Alina", postSubtitle: "Belgorod", postImage: UIImage(named: "alina3")!, numberOfLikes: 5313, comment: CommentShortInfo(userName: "user2432", commentText: "Вау! Крутяк!!!"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "alina")!, userName: "Alina", postSubtitle: "Belgorod", postImage: UIImage(named: "alina4")!, numberOfLikes: 4325, comment: CommentShortInfo(userName: "user324", commentText: "Это же Питница?"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "dog")!, userName: "Sobaken", postSubtitle: "Some place", postImage: UIImage(named: "dog")!, numberOfLikes: 1234, comment: CommentShortInfo(userName: "Some_dog", commentText: "Хороший мальчик!)))"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "dog")!, userName: "Sobaken", postSubtitle: "Some place", postImage: UIImage(named: "dog")!, numberOfLikes: 1234, comment: CommentShortInfo(userName: "Some_dog", commentText: "Хороший мальчик!)))"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "dog")!, userName: "Sobaken", postSubtitle: "Some place", postImage: UIImage(named: "dog")!, numberOfLikes: 1234, comment: CommentShortInfo(userName: "Some_dog", commentText: "Хороший мальчик!)))"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "dog")!, userName: "Sobaken", postSubtitle: "Some place", postImage: UIImage(named: "dog")!, numberOfLikes: 1234, comment: CommentShortInfo(userName: "Some_dog", commentText: "Хороший мальчик!)))")))
        ]
}

// MARK: - Private Methods
private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoView = LogoView()
        let logoBarButtonItem = UIBarButtonItem(customView: logoView)
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        
        
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapPlusButton))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return [directBarButtonItem, addBarButtonItem]
    }
    
    @objc func didTapPlusButton() {
        print("Add")
    }
    
    @objc func didTapDirectButton() {
        print("Direct")
    }
    
    func makeDropDownMenu() -> UIMenu {
        
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("Favorites")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}
