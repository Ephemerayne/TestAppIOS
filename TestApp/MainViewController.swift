//
//  ContentView.swift
//  TestApp
//
//  Created by Veronika Bekesh on 17.02.2022.
//

import Foundation
import SwiftUI
import UIKit

protocol MainViewControllerDelegate {
    func showMain()
}

class MainViewController: UIViewController {
    
    struct Model {
        let title: String
    }
    
private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var delegate: MainViewControllerDelegate?
    private var dataSource: [Model] = [
        Model(title: "First"),
        Model(title: "Second"),
        Model(title: "Third"),
        Model(title: "Four"),
    ]
    
    override func loadView() {
        super.loadView()
    
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate?.showMain()
        
        makeConstraints()
        
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseIdentifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                   flowLayout.itemSize = CGSize(width: self.collectionView.bounds.width, height: 120)
               }
    }
    
    private func makeConstraints() {
        view.addSubview(collectionView)

        
        collectionView.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.trailing.bottom.equalToSuperview()
        }
    }
}

extension MainViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSource[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        cell.bind(title: item.title)
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.size.width - 16, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
}

