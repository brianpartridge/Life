//
//  Game.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


public struct Game {

    // MARK: - Public Properties
    
    public let initialBoard: Board
    public private(set) var currentGeneration: Generation
    
    public let rules: [Rule]
    
    // MARK: - Initializers
    
    public init(board: Board, rules:[Rule]) {
        self.initialBoard = board
        self.currentGeneration = Generation(number: 0, board: board)
        self.rules = rules
    }
    
    // MARK: - Public Methods
    
    public mutating func tick() {
        // TODO: (brianpartridge) Evaluate multiple rules at once
        let rule = rules.last!
        
        let current = currentGeneration
        let board = currentGeneration.board
        let newCells = board.map { rule.evaluateForCellAtCoordinate($0, inBoard: board) }
        let next = Generation(number: current.number+1, board: Board(size: board.size, cells: newCells))
        currentGeneration = next
    }
}


/// Represents a snapshot of a single generation in a Game.
public struct Generation: CustomStringConvertible {
    // MARK: - Public Properties
    
    public let number: Int
    public let board: Board
    
    // MARK: - CustomStringConvertable
    
    public var description: String {
        return "Generation \(number)\n\(board.description)"
    }
}
