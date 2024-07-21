//
//  Queue.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

struct Queue<Element> {
    private(set) var elements: [Element] = []

    mutating func enqueue(_ element: Element) {
        elements.append(element)
    }

    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
}

extension Queue: Container {

    mutating func remove() -> Element? {
        dequeue()
    }

    mutating func append(_ item: Element) {
        enqueue(item)
    }
}
