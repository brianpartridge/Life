//
//  Game+Sequence.swift
//  Life
//
//  Created by Brian Partridge on 10/27/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


extension Game: SequenceType {
    public typealias Generator = AnyGenerator<Board>
    
    public func generate() -> Generator {
        var game = self
        var hasReturnedInitialValue = false
        return anyGenerator {
            if !hasReturnedInitialValue {
                hasReturnedInitialValue = true
                return game.initialBoard
            }
            
            let previousBoard = game.currentBoard
            game.tick()
            let generatedBoard = game.currentBoard
            if previousBoard != generatedBoard {
                return generatedBoard
            }
            
            return nil
        }
    }
}
