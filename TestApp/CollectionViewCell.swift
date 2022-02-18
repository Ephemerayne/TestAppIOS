//
//  CollectionViewCell.swift
//  TestApp
//
//  Created by Veronika Bekesh on 17.02.2022.
//

import Foundation
import UIKit
import SnapKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ViewCell"
    
    private lazy var container: UIView = {
        let container = UIView()
        container.backgroundColor = .gray
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.black.cgColor
        
        return container
    }()
    
    private lazy var titleView: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(container)
        container.addSubview(titleView)


        container.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.width.height.equalTo(80)
            $0.leading.trailing.top.equalToSuperview()
        }

        titleView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(title: String) {
        titleView.text = title
    }
}
