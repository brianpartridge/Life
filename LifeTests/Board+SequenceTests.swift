//
//  Board+SequenceTests.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

@testable import Life
import XCTest


class Board_SequenceTests: XCTestCase {

    func test_generate() {
        let board = Board.randomBoard(Size(width: 2, height: 2), populationDensity: 1)
        let expectedCoordinates = [
            Coordinate(x: 0, y: 0),
            Coordinate(x: 1, y: 0),
            Coordinate(x: 0, y: 1),
            Coordinate(x: 1, y: 1)
        ]
        let coordinates = board.map { return $0 }
        XCTAssertEqual(coordinates, expectedCoordinates)
    }
}
