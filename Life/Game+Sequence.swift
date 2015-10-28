//
//  Game+Sequence.swift
//  Life
//
//  Created by Brian Partridge on 10/27/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


extension Game: SequenceType {
    public typealias Generator = AnyGenerator<Generation>
    
    public func generate() -> Generator {
        var game = self
        var hasReturnedInitialValue = false
        return anyGenerator {
            if !hasReturnedInitialValue {
                hasReturnedInitialValue = true
                return game.currentGeneration
            }
            
            let previousBoard = game.currentGeneration.board
            game.tick()
            let generatedBoard = game.currentGeneration.board
            if previousBoard != generatedBoard {
                return game.currentGeneration
            }
            
            return nil
        }
    }
}
