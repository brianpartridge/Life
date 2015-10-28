//
//  Cell.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


/// A cell that is either alive or dead.
public enum Cell: CustomStringConvertible, Equatable {
    case Dead, Alive
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        switch self {
        case .Dead: return "⬜️"
        case .Alive: return "⬛️"
        }
    }
}


public func ==(left: Cell, right: Cell) -> Bool {
    switch (left, right) {
    case (.Alive, .Alive): return true
    case (.Dead, .Dead): return true
    default: return false
    }
}
