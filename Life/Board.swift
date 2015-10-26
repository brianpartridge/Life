//
//  Board.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


public struct Board {

    // MARK: - Public Properties
    
    public let size: Size
    public let cells: [Cell]
    
    // MARK: - Initializers
    
    public init(size: Size, cells: [Cell]) {
        precondition(size.volume() == cells.count)
        
        self.size = size
        self.cells = cells
    }
    
    // MARK: - Public Methods
    
    public func cellAtCoordinate(coordinate: Coordinate) -> Cell {
        precondition(coordinate.x > 0 && coordinate.x < size.width)
        precondition(coordinate.y > 0 && coordinate.y < size.height)
        
        let index = (coordinate.y * size.width) + coordinate.x
        return cells[index]
    }
}
