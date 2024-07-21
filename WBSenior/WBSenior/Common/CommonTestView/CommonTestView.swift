//
//  CommonTestView.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

import SwiftUI

struct CommonTestView: View {
    var body: some View {
        Text("Домашняя работа 4")
            .onAppear {
                onAppear()
            }
    }

    func onAppear() {
        testIntStack()
        testStringStack()
        testIntQueue()
        testStringQueue()
        testOpaque()
        testAnyContainer()
    }

    func testIntStack() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        _ = stack.pop()

        print(stack.elements)
    }

    func testStringStack() {
        var stack = Stack<String>()
        stack.push("A")
        stack.push("B")
        stack.push("C")
        _ = stack.pop()

        print(stack.elements)
    }

    func testIntQueue() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        _ = queue.dequeue()

        print(queue.elements)
    }

    func testStringQueue() {
        var queue = Queue<String>()
        queue.enqueue("A")
        queue.enqueue("B")
        queue.enqueue("C")
        _ = queue.dequeue()

        print(queue.elements)
    }

    func testOpaque() {
        let stack = Stack<Int>()
        var opaque = makeOpaque(container: stack) as! Stack<Int>
        opaque.append(1)
        opaque.append(2)
        _ = opaque.remove()
    }

    func testAnyContainer() {
        let stack = Stack<Int>()
        let anyContainer = AnyContainer(stack)
        anyContainer.append(1)
        anyContainer.append(2)
        _ = anyContainer.remove()
    }
}

#Preview {
    CommonTestView()
}
