//
//  ViewController.swift
//  Multiline
//
//  Created by hongwuzhao on 4/17/19.
//  Copyright © 2019 tencent. All rights reserved.
//

import UIKit
import IGListKit

class MainPageViewController: UIViewController {

    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        return collectionView
    }()

    let updater = ListAdapterUpdater()

    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: updater, viewController: self, workingRangeSize: 0)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        return adapter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    private func setupUI() {
        view.backgroundColor = .white

    }
}

extension MainPageViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        <#code#>
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        <#code#>
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }


}
