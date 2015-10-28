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
    
    func test_countOfAliveCells() {
        XCTAssertEqual(countOfAliveCells([.Alive, .Dead, .Alive]), 2)
    }

}
