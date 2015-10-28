//
//  Board+NeighborsTests.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

@testable import Life
import XCTest


class Board_NeighborsTests: XCTestCase {
    
    func test_neighborsOfCellAtCoordinate() {
        let board = Board.fullBoard(Size(width: 3, height: 3))        
        let topLeft = Coordinate(x: 0, y: 0)
        let center = Coordinate(x: 1, y: 1)
        let bottomRight = Coordinate(x: 2, y: 2)
        
        // Dead
        do {
            let style = EdgeCellNeighborStyle.Dead
            XCTAssertEqual(neighborsOfCellAtCoordinate(topLeft, board: board, edgeHandlingStyle: style), [
                .Dead, .Dead,  .Dead,
                .Dead,         .Alive,
                .Dead, .Alive, .Alive])
            XCTAssertEqual(neighborsOfCellAtCoordinate(center, board: board, edgeHandlingStyle: style), [
                .Alive, .Alive, .Alive,
                .Alive,         .Alive,
                .Alive, .Alive, .Alive])
            XCTAssertEqual(neighborsOfCellAtCoordinate(bottomRight, board: board, edgeHandlingStyle: style), [
                .Alive, .Alive, .Dead,
                .Alive,         .Dead,
                .Dead,  .Dead,  .Dead])
        }
        
        // Wrap
        do {
            let style = EdgeCellNeighborStyle.Wrap
            XCTAssertEqual(neighborsOfCellAtCoordinate(topLeft, board: board, edgeHandlingStyle: style), [
                .Alive, .Alive, .Alive,
                .Alive,         .Alive,
                .Alive, .Alive, .Alive])
            XCTAssertEqual(neighborsOfCellAtCoordinate(center, board: board, edgeHandlingStyle: style), [
                .Alive, .Alive, .Alive,
                .Alive,         .Alive,
                .Alive, .Alive, .Alive])
            XCTAssertEqual(neighborsOfCellAtCoordinate(bottomRight, board: board, edgeHandlingStyle: style), [
                .Alive, .Alive, .Alive,
                .Alive,         .Alive,
                .Alive, .Alive, .Alive])
        }
    }
    
    func test_wrappedCoordiateForCoordinate() {
        let board = Board.fullBoard(Size(width: 10, height: 10))
        
        // Within Bounds
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 0, y: 0), inBoard: board), Coordinate(x: 0, y: 0))
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 3, y: 4), inBoard: board), Coordinate(x: 3, y: 4))
        
        // Outside X Bounds
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 10, y: 0), inBoard: board), Coordinate(x: 0, y: 0))
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 15, y: 0), inBoard: board), Coordinate(x: 5, y: 0))
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 25, y: 0), inBoard: board), Coordinate(x: 5, y: 0))
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: -5, y: 0), inBoard: board), Coordinate(x: 5, y: 0))
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: -15, y: 0), inBoard: board), Coordinate(x: 5, y: 0))
        
        // Outside Y Bounds
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 0, y: 10), inBoard: board), Coordinate(x: 0, y: 0))
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 0, y: 15), inBoard: board), Coordinate(x: 0, y: 5))
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 0, y: 25), inBoard: board), Coordinate(x: 0, y: 5))
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 0, y: -5), inBoard: board), Coordinate(x: 0, y: 5))
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 0, y: -15), inBoard: board), Coordinate(x: 0, y: 5))
        
        // Outside Both
        XCTAssertEqual(wrappedCoordiateForCoordinate(Coordinate(x: 10, y: 10), inBoard: board), Coordinate(x: 0, y: 0))
    }

}
