//
//  Cell.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


/// A cell that is either alive or dead.
public enum Cell: Equatable {
    case Dead, Alive
}


public func ==(left: Cell, right: Cell) -> Bool {
    switch (left, right) {
    case (.Alive, .Alive): return true
    case (.Dead, .Dead): return true
    default: return false
    }
}
