//
//  Geometry.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


/// Represents the two dimensional bounds of a Board.
public struct Size: CustomStringConvertible, Equatable {
    
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
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        return "w: \(width), h: \(height)"
    }
}


public func ==(left: Size, right: Size) -> Bool {
    return left.width == right.width && left.height == right.height
}


/// Identifies a location two dimensional space.
public struct Coordinate: CustomStringConvertible, Equatable {
    // MARK: - Public Properties
    
    public let x: Int
    public let y: Int
    
    // MARK: - Initializers
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        return "x: \(x), y: \(y)"
    }
}


public func ==(left: Coordinate, right: Coordinate) -> Bool {
    return left.x == right.x && left.y == right.y
}

public func +(left: Coordinate, right: Coordinate) -> Coordinate {
    return Coordinate(x: left.x + right.x, y: left.y + right.y)
}
