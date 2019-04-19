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
        return collectionView
    }()

    let updater = ListAdapterUpdater()

    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: updater, viewController: self, workingRangeSize: 0)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        return adapter
    }()

    let demos: [DemoModel] = [
        DemoModel(name: "Use boundingRectWithSize With Cache", controllerClass: BoundSizeViewController.self),
        DemoModel(name: "Constraint Caculate", controllerClass: ConstraintViewController.self),
        DemoModel(name: "String Caculate", controllerClass: StringCaculateViewController.self)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        _ = adapter
    }
}

extension MainPageViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return demos as [ListDiffable]
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return DemoSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }


}
