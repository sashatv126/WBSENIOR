//
//  AnyContainer.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

func makeOpaque<T: Container>(container: T) -> some Container {
    return container
}

final class AnyContainer<T>: Container {

    private let _append: (T) -> Void
    private let _remove: () -> T?

    init<C: Container>(_ container: C) where C.Item == T {
        var container = container
        _append = { container.append($0) }
        _remove = { container.remove() }
    }

    func append(_ item: T) {
        _append(item)
    }

    func remove() -> T? {
        _remove()
    }
}
