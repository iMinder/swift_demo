//
//  DemosSectionController.swift
//  Multiline
//
//  Created by hongwuzhao on 4/19/19.
//  Copyright © 2019 tencent. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

final class DemoModel {
    let name: String
    let controllerClass: UIViewController.Type

    init(name: String, controllerClass:UIViewController.Type, controllerIdentifier: String? = nil) {
        self.name = name
        self.controllerClass = controllerClass
    }
}

extension DemoModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return name as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object {
            return true
        }

        guard let object = object as? DemoModel else {
            return false
        }

        return self.controllerClass == object.controllerClass
    }
}

final class DemoSectionController: ListSectionController {

    private var demoItem: DemoModel?

    override func numberOfItems() -> Int {
        return 1
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: self.collectionContext?.containerSize.width ?? 0,height: 55)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text = demoItem?.name
        return cell
    }

    override func didUpdate(to object: Any) {
        demoItem = object as? DemoModel
    }

    override func didSelectItem(at index: Int) {
        if let vc = demoItem?.controllerClass.init() {
            vc.title = demoItem?.name
            viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
