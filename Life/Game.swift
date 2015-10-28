//
//  Game.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


protocol GameType {
    func tick()
}

public struct Game: CustomStringConvertible {

    // MARK: - Public Properties
    
    public let initialBoard: Board
    public private(set) var currentBoard: Board
    public private(set) var tickCount: Int = 0
    
    public let rules: [Rule]
    
    // MARK: - Initializers
    
    public init(board: Board, rules:[Rule]) {
        self.initialBoard = board
        self.currentBoard = board
        self.rules = rules
    }
    
    // MARK: - Public Methods
    
    public mutating func tick() {
        // TODO: (brianpartridge) Evaluate multiple rules at once
        let rule = rules.last!
        
        let board = currentBoard
        let newCells = board.map { rule.evaluateForCellAtCoordinate($0, inBoard: board) }
        currentBoard = Board(size: board.size, cells: newCells)
        tickCount++
    }
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        return "Generation: \(tickCount)\n\(board)"
    }
}
