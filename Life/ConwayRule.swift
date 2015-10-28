//
//  ConwayRule.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


/// The classic rules:
/// 1. Any live Cell with fewer than two live neighbors dies, as if caused by under-population.
/// 2. Any live Cell with two or three live neighbors lives on to the next generation.
/// 3. Any live Cell with more than three live neighbors dies, as if by over-population.
/// 4. Any dead Cell with exactly three live neighbors becomes a live Cell, as if by reproduction.
public struct ConwayRule: Rule {
    
    // MARK: - Public Properties
    
    public let edgeHandlingStyle: EdgeCellNeighborStyle
    
    // MARK: - Initializers
    
    public init(edgeHandlingStyle: EdgeCellNeighborStyle) {
        self.edgeHandlingStyle = edgeHandlingStyle
    }
    
    // MARK: - Rule
    
    public func evaluateForCellAtCoordinate(coordinate: Coordinate, inBoard board: Board) -> Cell {
        let cell: Cell = board.cellAtCoordinate(coordinate)
        let neighbors = neighborsOfCellAtCoordinate(coordinate, board: board, edgeHandlingStyle: edgeHandlingStyle)
        let aliveNeighborCount = countOfAliveCells(neighbors)
        
        switch (cell, aliveNeighborCount) {
            // Underpopulation
        case (.Alive, Int.min..<2) : return .Dead
            
            // Overpopulation
        case (.Alive, 4..<Int.max): return .Dead
            
            // Reproduction
        case (.Dead, 3): return .Alive
            
        default: return cell
        }
    }
}
