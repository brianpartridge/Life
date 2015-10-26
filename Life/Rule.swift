//
//  Rule.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


/// Constraints that are evaluated against a Board in a Game.
public protocol Rule {
    
    /// Evaluates the rule against a Cell, returning the calculated value.
    func evaluateForCellAtCoordinate(coordinate: Coordinate, inBoard board: Board) -> Cell
}
