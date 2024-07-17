//
//  UIDevice + Extension.swift
//  WBSenior
//
//  Created by Александр Плетников on 17.07.2024.
//

import UIKit

extension UIDevice {

    static var isIpad: Bool {
        UIDevice().userInterfaceIdiom == .pad
    }
}
