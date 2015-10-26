//
//  Rule.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


public protocol Rule {
    func evaluateForCellAtCoordiante(coordinate: Coordinate, inBoard board: Board) -> Cell
}
