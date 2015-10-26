//
//  Geometry.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


public struct Size {
    public let width: Int
    public let height: Int
    
    public func volume() -> Int {
        return width * height
    }
}


public struct Coordinate {
    public let x: Int
    public let y: Int
}


extension Coordinate: Equatable {}
public func ==(left: Coordinate, right: Coordinate) -> Bool {
    return left.x == right.x && left.y == right.y
}


public func wrappedCoordiateForCoordinate(coordinate: Coordinate, inSize size: Size) -> Coordinate {
    var x = coordinate.x
    var y = coordinate.y
    
    if x < 0 {
        x = size.width - 1
    } else if x >= size.width {
        x = 0
    }
    
    if y < 0 {
        y = size.height - 1
    } else if y >= size.height {
        y = 0
    }
    
    return Coordinate(x: x, y: y)
}
