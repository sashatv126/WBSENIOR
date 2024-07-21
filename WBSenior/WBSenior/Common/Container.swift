//
//  Container.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

protocol Container {
    associatedtype Item

    mutating func append(_ item: Item)
    mutating func remove() -> Item?
}
