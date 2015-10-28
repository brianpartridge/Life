//
//  Game+SequenceTests.swift
//  Life
//
//  Created by Brian Partridge on 10/27/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

@testable import Life
import XCTest


class Game_SequenceTests: XCTestCase {

    let rules = ConwayRule(edgeHandlingStyle: .Dead)
    
    func test_generate_returnsInitialValue() {
        let board = Board(size: Size(width: 2, height: 2), cells: [
            .Alive, .Dead,
            .Dead,  .Dead])
        let game = Game(board: board, rules: [rules])
        
        let generator = game.generate()
        XCTAssertEqual(generator.next()!, board)
    }
    
    func test_generate_terminates() {
        let board = Board(size: Size(width: 2, height: 2), cells: [
            .Alive, .Dead,
            .Dead,  .Dead])
        let game = Game(board: board, rules: [rules])
        
        let generator = game.generate()
        let first = generator.next()!
        XCTAssertEqual(first, board)
        
        let second = generator.next()!
        XCTAssertEqual(second, Board.emptyBoard(board.size))
        
        let third = generator.next()
        XCTAssertNil(third)
    }

}
