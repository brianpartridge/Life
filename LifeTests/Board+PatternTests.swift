//
//  Board+PatternTests.swift
//  Life
//
//  Created by Brian Partridge on 11/1/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

@testable import Life
import XCTest


class Board_PatternTests: XCTestCase {

    // MARK: - Tests
    
    func test_boardByInsertingPattern() {
        let pattern = TestPattern()
        let board = Board.emptyBoard(Size(width: 10, height: 10))
        
        do {
            let newBoard = board.boardByInsertingPattern(pattern, atCoordinate: Coordinate(x: 0, y: 0))
            XCTAssertEqual(newBoard.cellAtCoordinate(Coordinate(x: 0, y: 0)), Cell.Alive)
            XCTAssertEqual(newBoard.cellAtCoordinate(Coordinate(x: 1, y: 0)), Cell.Dead)
            XCTAssertEqual(newBoard.cellAtCoordinate(Coordinate(x: 0, y: 1)), Cell.Dead)
            XCTAssertEqual(newBoard.cellAtCoordinate(Coordinate(x: 1, y: 1)), Cell.Alive)
        }
        
        do {
            let newBoard = board.boardByInsertingPattern(pattern, atCoordinate: Coordinate(x: 3, y: 4))
            XCTAssertEqual(newBoard.cellAtCoordinate(Coordinate(x: 3, y: 4)), Cell.Alive)
            XCTAssertEqual(newBoard.cellAtCoordinate(Coordinate(x: 4, y: 4)), Cell.Dead)
            XCTAssertEqual(newBoard.cellAtCoordinate(Coordinate(x: 3, y: 5)), Cell.Dead)
            XCTAssertEqual(newBoard.cellAtCoordinate(Coordinate(x: 4, y: 5)), Cell.Alive)
        }
    }

    // MARK: - Fixtures
    
    struct TestPattern: Pattern {
        
        // MARK: - Pattern
        
        var size: Size {
            return Size(width: 2, height: 2)
        }
        
        var coordinates: [Coordinate] {
            return [
                Coordinate(x: 0, y: 0),
                Coordinate(x: 1, y: 1)
            ]
        }
    }
}
