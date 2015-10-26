//
//  Board+Neighbors.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


public enum EdgeCellNeighborStyle {
    /// Neighbors beyond the edge of the board should be considered Dead.
    case Dead
    
    /// Neighbors beyond the edge of the board should be wrap to the opposite edge of the board.
    case Wrap
}


/// Returns the 8 neighbors of the cell at the coordinate.
public func neighborsOfCellAtCoordinate(coordinate: Coordinate, board: Board, edgeHandlingStyle: EdgeCellNeighborStyle) -> [Cell] {
    var neighbors = [Cell]()
    
    for i in coordinate.x-1...coordinate.x+1 {
        for j in coordinate.y-1...coordinate.y+1 {
            if i == coordinate.x && j == coordinate.y {
                continue
            }
            
            let coordinate = Coordinate(x: i, y: j)
            let resolvedCoordinate = wrappedCoordiateForCoordinate(coordinate, inBoard: board)
            let coordinateWraps = coordinate != resolvedCoordinate
            
            if coordinateWraps && edgeHandlingStyle == .Dead {
                neighbors.append(.Dead)
            } else {
                neighbors.append(board.cellAtCoordinate(resolvedCoordinate))
            }
        }
    }
    return neighbors
}

/// Calculates the coordinate for the given coordinate in the g
internal func wrappedCoordiateForCoordinate(coordinate: Coordinate, inBoard board: Board) -> Coordinate {
    let size = board.size
    var xWrapped = true
    var yWrapped = true
    var x = coordinate.x
    var y = coordinate.y
    
    if x < 0 {
        x = size.width + x
    } else if x >= size.width {
        x = x - size.width
    } else {
        xWrapped = false
    }
    
    if y < 0 {
        y = size.height + y
    } else if y >= size.height {
        y = y - size.height
    } else {
        yWrapped = false
    }
    
    let coordinate = Coordinate(x: x, y: y)
    if !xWrapped && !yWrapped {
        // Nothing wrapped, return the coordinate.
        return coordinate
    }
    
    // Wrapping was necessary, recurse to handle any additional wrapping.
    return wrappedCoordiateForCoordinate(coordinate, inBoard: board)
}
