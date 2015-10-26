//
//  ConwayRule.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


public struct ConwayRule: Rule {
    
    // MARK: - Public Properties
    
    public let edgeHandlineStyle: EdgeCellNeighborStyle
    
    // MARK: - Rule
    
    public func evaluateForCellAtCoordiante(coordinate: Coordinate, inBoard board: Board) -> Cell {
        let cell: Cell = board.cellAtCoordinate(coordinate)
        let aliveNeighborCount = countOfAliveNeighborsOfCellAtCoordinate(coordinate, inBoard: board, edgeHandlingStyle: edgeHandlineStyle)
        
        switch (cell, aliveNeighborCount) {
            // Underpopulation
        case (.Alive, Int.min..<2) : return .Dead
            
            // Overpopulation
        case (.Alive, 4...Int.max): return .Dead
            
            // Reproduction
        case (.Dead, 3): return .Alive
            
        default: return cell
        }
    }
    
    // MARK: - Internal Methods
    
    internal func countOfAliveNeighborsOfCellAtCoordinate(coordinate: Coordinate, inBoard board: Board, edgeHandlingStyle: EdgeCellNeighborStyle) -> Int {
        let neighbors = board.neighborsOfCellAtCoordinate(coordinate, edgeHandlingStyle: edgeHandlingStyle)
        return neighbors.reduce(0, combine: { accumulator, next in
            switch next {
            case .Alive: return accumulator + 1
            default: return accumulator
            }
        })
    }
}
