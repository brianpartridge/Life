//
//  Cell+CountTests.swift
//  Life
//
//  Created by Brian Partridge on 10/27/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

@testable import Life
import XCTest


class Cell_CountTests: XCTestCase {
    
    let size = Size(width: 3, height: 3)
    
    // MARK: - Tests

    func test_emptyBoard() {
        XCTAssertEqual(countOfAliveCells(Board.emptyBoard(size).cells), 0)
    }
    
    func test_fullBoard() {
        XCTAssertEqual(countOfAliveCells(Board.fullBoard(size).cells), 9)
    }

}
