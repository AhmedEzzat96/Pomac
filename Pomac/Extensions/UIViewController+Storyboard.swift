//
//  UIViewController+Storyboard.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import UIKit

extension UIViewController {
    class func create<T: UIViewController>(storyboardName: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
