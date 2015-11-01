//
//  Block.swift
//  Life
//
//  Created by Brian Partridge on 11/1/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

public struct Block: Pattern {
    
    // MARK: - Initialization
    
    public init() {}
    
    // MARK: - Pattern
    
    public var size: Size {
        return Size(width: 2, height: 2)
    }
    
    public var coordinates: [Coordinate] {
        return [
            Coordinate(x: 0, y: 0),
            Coordinate(x: 1, y: 0),
            Coordinate(x: 0, y: 1),
            Coordinate(x: 1, y: 1)
        ]
    }
}
