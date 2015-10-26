//
//  Cell+Count.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


internal func countOfAliveCells(cells: [Cell]) -> Int {
    return cells.reduce(0, combine: { accumulator, next in
        switch next {
        case .Alive: return accumulator + 1
        default: return accumulator
        }
    })
}
