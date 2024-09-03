//
//  UIFont+Extansion.swift
//  Travel Memory
//
//  Created by Gio's Mac on 03.09.24.
//

import UIKit

extension UIFont {
    //MARK: font extension
    static func KoronaOneRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "KronaOne-Regular", size: size) ?? .systemFont(ofSize: size)
    }
}
