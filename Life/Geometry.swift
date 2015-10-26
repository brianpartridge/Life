//
//  Geometry.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


public struct Size {
    
    // MARK: - Public Properties
    
    public let width: Int
    public let height: Int
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


public struct Coordinate: Equatable {
    public let x: Int
    public let y: Int
}


public func ==(left: Coordinate, right: Coordinate) -> Bool {
    return left.x == right.x && left.y == right.y
}
