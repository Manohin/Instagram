//
//  FeedStoriesCellInfo.swift
//  Instagram
//
//  Created by Alexey Manokhin on 26.06.2023.
//

import UIKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let userName: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool
}

typealias FeedStoriesSellInfo = [FeedStoriesItemCellInfo]
