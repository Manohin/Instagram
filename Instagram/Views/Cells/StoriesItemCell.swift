//
//  StoriesItemCell.swift
//  Instagram
//
//  Created by Alexey Manokhin on 26.06.2023.
//

import SnapKit
import UIKit

class StoriesItemCell: UICollectionViewCell {
    //MARK: - Public
    func configure(with info: FeedStoriesItemCellInfo) {
        imageView.image = info.image
        userNameLabel.text = info.userName
    }
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private constants
    private enum UIConstants {
        static let imageSize: CGFloat = 60
        static let imageToCellInset: CGFloat = 6
        static let labelToCellInset: CGFloat = 6
        static let imageToLabelOffset: CGFloat = 6
        static let userNameFontSize: CGFloat = 12
    }
    
    
    //MARK: - Private properties
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
     label.font = .systemFont(ofSize: UIConstants.userNameFontSize)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
}

//MARK: - Private methods

private extension StoriesItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstants.imageToCellInset)
        }
        contentView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstants.labelToCellInset)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstants.imageToLabelOffset)
        }
    }
}
