//
//  Loaf.swift
//  Life
//
//  Created by Brian Partridge on 11/1/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

public struct Loaf: Pattern {
    
    // MARK: - Initialization
    
    public init() {}
    
    // MARK: - Pattern
    
    public var size: Size {
        return Size(width: 4, height: 4)
    }
    
    public var coordinates: [Coordinate] {
        return [
            Coordinate(x: 1, y: 0),
            Coordinate(x: 2, y: 0),
            Coordinate(x: 0, y: 1),
            Coordinate(x: 3, y: 1),
            Coordinate(x: 1, y: 2),
            Coordinate(x: 3, y: 2),
            Coordinate(x: 2, y: 3)
        ]
    }
}
