//
//  BoardTests.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

@testable import Life
import XCTest


class BoardTests: XCTestCase {

    func test_cellAtCoordinate() {
        let board = Board(size: Size(width: 2, height: 2), cells: [.Alive, .Dead, .Alive, .Dead])
        XCTAssertEqual(board.cellAtCoordinate(Coordinate(x: 0, y: 0)), Cell.Alive)
        XCTAssertEqual(board.cellAtCoordinate(Coordinate(x: 1, y: 0)), Cell.Dead)
        XCTAssertEqual(board.cellAtCoordinate(Coordinate(x: 0, y: 1)), Cell.Alive)
        XCTAssertEqual(board.cellAtCoordinate(Coordinate(x: 1, y: 1)), Cell.Dead)
    }
}
