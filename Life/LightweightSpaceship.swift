//
//  LightweightSpaceship.swift
//  Life
//
//  Created by Brian Partridge on 11/1/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

public struct LightweightSpaceship: Pattern {
    
    // MARK: - Initialization
    
    public init() {}
    
    // MARK: - Pattern
    
    public var size: Size {
        return Size(width: 5, height: 4)
    }
    
    public var coordinates: [Coordinate] {
        return [
            Coordinate(x: 1, y: 0),
            Coordinate(x: 2, y: 0),
            Coordinate(x: 3, y: 0),
            Coordinate(x: 4, y: 0),
            Coordinate(x: 0, y: 1),
            Coordinate(x: 4, y: 1),
            Coordinate(x: 4, y: 2),
            Coordinate(x: 0, y: 3),
            Coordinate(x: 3, y: 3),
        ]
    }
}
