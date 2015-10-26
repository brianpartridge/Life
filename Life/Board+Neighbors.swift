//
//  Board+Neighbors.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


public enum EdgeCellNeighborStyle {
    case Dead, Wrap
}

public func neighborsOfCellAtCoordinate(coordinate: Coordinate, board: Board, edgeHandlingStyle: EdgeCellNeighborStyle) -> [Cell] {
    var neighbors = [Cell]()
    
    for i in coordinate.x-1...coordinate.x+1 {
        for j in coordinate.y-1...coordinate.y+1 {
            if i == coordinate.x && j == coordinate.y {
                continue
            }
            
            let coordinate = Coordinate(x: i, y: j)
            let wrappedCoordiate = wrappedCoordiateForCoordinate(coordinate, inSize: board.size)
            let coordinateWraps = coordinate != wrappedCoordiate
            
            if coordinateWraps && edgeHandlingStyle == .Dead {
                neighbors.append(.Dead)
            } else {
                neighbors.append(board.cellAtCoordinate(coordinate))
            }
        }
    }
    return neighbors
}
