//
//  Board+Random.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


public extension Board {
    /// Generates a random Board with the give population density.
    /// @param populationDensity Approximate percentage of Cells on the generated Board which should be alive.
    public static func randomBoard(size: Size, populationDensity: Float) -> Board {
        var cells = [Cell]()
        for _ in 0..<(size.volume) {
            let pivot = Int(populationDensity * 100)
            let state = Int(arc4random_uniform(100))
            let cell: Cell = state < pivot ? .Alive : .Dead
            cells.append(cell)
        }
        let board = Board(size: size, cells: cells)
        return board
    }
    
    /// Generate a board filled with dead cells.
    public static func emptyBoard(size: Size) -> Board {
        let cells = [Cell](count: size.volume, repeatedValue: .Dead)
        return Board(size: size, cells: cells)
    }
    
    /// Generate a board filled with alive cells.
    public static func fullBoard(size: Size) -> Board {
        let cells = [Cell](count: size.volume, repeatedValue: .Alive)
        return Board(size: size, cells: cells)
    }
}
