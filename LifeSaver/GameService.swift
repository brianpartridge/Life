//
//  GameService.swift
//  LifeSaver
//
//  Created by Brian Partridge on 11/1/15.
//  Copyright © 2015 Pear Tree Labs. All rights reserved.
//

import Foundation
import LifeTVOS


let GameDidChangeNotification = "GameDidChange"


class GameService {

    // MARK: - Public Properties
    
    private(set) var currentGame: Game? {
        didSet {
            NSNotificationCenter.defaultCenter().postNotificationName(GameDidChangeNotification, object: self)
        }
    }
    
    // MARK: - Private Properties
    
    private let rules: RuleSet
    
    // MARK: - Initialization
    
    init() {
        rules = ConwayRuleSet(edgeHandlingStyle: .Dead)
    }
    
    // MARK: - Public Methods

    func newGameWithSize(size: Size) {
        let board = Board.randomBoard(size, populationDensity: 0.3)
        newGameWithBoard(board)
    }
    
    func newGameWithBoard(board: Board) {
        currentGame = Game(board: board, rules: rules)
    }
    
    func tick() {
        precondition(currentGame != nil)
        currentGame?.tick()
    }
}
