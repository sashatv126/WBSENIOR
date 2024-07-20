//
//  NavigationType.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

import SwiftUI

enum NavigationType {
    case push
    case present
    case custom(AnyTransition)
}
