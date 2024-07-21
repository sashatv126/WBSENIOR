//
//  Stack.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

struct Stack<Element> {
    private(set) var elements: [Element] = []

    mutating func push(_ element: Element) {
        elements.append(element)
    }

    mutating func pop() -> Element? {
        return elements.popLast()
    }
}

extension Stack: Container {

    mutating func remove() -> Element? {
        pop()
    }
    

    mutating func append(_ item: Element) {
        push(item)
    }
}
