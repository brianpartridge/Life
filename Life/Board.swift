//
//  Board.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


/// A two dimensional collection of Cells, representing a point in time in a Game.
public struct Board: CustomStringConvertible, Equatable {

    // MARK: - Public Properties
    
    public let size: Size
    public let cells: [Cell]
    
    // MARK: - Initializers
    
    public init(size: Size, cells: [Cell]) {
        precondition(size.volume == cells.count)
        
        self.size = size
        self.cells = cells
    }
    
    // MARK: - Public Methods
    
    public func cellAtCoordinate(coordinate: Coordinate) -> Cell {
        return cells[cellIndexForCoordinate(coordinate)]
    }
    
    public func cellIndexForCoordinate(coordinate: Coordinate) -> Int {
        precondition(coordinate.x >= 0 && coordinate.x < size.width)
        precondition(coordinate.y >= 0 && coordinate.y < size.height)
        
        return (coordinate.y * size.width) + coordinate.x
    }
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        var row = ""
        var rows = [String]()
        for (i, cell) in cells.enumerate() {
            let columnIndex = i % size.width
            if  columnIndex == 0 {
                row = "|"
            }
            row.appendContentsOf("\(cell)")
            if columnIndex == size.width-1 {
                row.appendContentsOf("|")
                rows.append(row)
            }
        }
        return rows.joinWithSeparator("\n")
    }
}


public func ==(left: Board, right: Board) -> Bool {
    return left.size == right.size && left.cells == right.cells
}
