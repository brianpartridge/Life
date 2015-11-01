//
//  Pattern.swift
//  Life
//
//  Created by Brian Partridge on 11/1/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//


/// Interface for any pattern of Cells which can be represented on a Board.
public protocol Pattern {
    /// The initial bounds of the pattern.
    var size: Size { get }
    
    /// Coordinates within size of alive Cells.
    var coordinates: [Coordinate] { get }
}
