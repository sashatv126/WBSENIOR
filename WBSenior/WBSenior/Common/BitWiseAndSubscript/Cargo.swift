//
//  Cargo.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

infix operator +++: AdditionPrecedence

func +++ (lhs: Cargo, rhs: Cargo) -> Cargo {
    let width = lhs.width + rhs.width
    let height = lhs.height + rhs.height
    let depth = lhs.depth + rhs.depth
    return Cargo(width: width, height: height, depth: depth)
}

extension Array where Element == Cargo {
    subscript(index: Int) -> Double {
        self[index].volume
    }
}

struct Cargo {
    let width: Double
    let height: Double
    let depth: Double

    var volume: Double {
        return width * height * depth
    }
}
