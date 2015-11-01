//
//  Board+Pattern.swift
//  Life
//
//  Created by Brian Partridge on 11/1/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

public extension Board {
    func boardByInsertingPattern(pattern: Pattern, atCoordinate offset: Coordinate) -> Board {
        var newCells = cells
        let indecies = pattern.coordinates.map { cellIndexForCoordinate($0 + offset) }
        indecies.forEach { newCells[$0] = .Alive }
        return Board(size: size, cells: newCells)
    }
}
