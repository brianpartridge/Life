//
//  Geometry.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


/// Represents the two dimensional bounds of a Board.
public struct Size: Equatable {
    
    // MARK: - Public Properties
    
    public let width: Int
    public let height: Int
    
    /// The total number of elements contained within.
    public var volume: Int {
        return width * height
    }
    
    // MARK: - Initializers
    
    public init(width: Int, height: Int) {
        precondition(width > 0)
        precondition(height > 0)
        
        self.width = width
        self.height = height
    }
}


public func ==(left: Size, right: Size) -> Bool {
    return left.width == right.width && left.height == right.height
}


/// Identifies a location two dimensional space.
public struct Coordinate: Equatable {
    public let x: Int
    public let y: Int
}


public func ==(left: Coordinate, right: Coordinate) -> Bool {
    return left.x == right.x && left.y == right.y
}
