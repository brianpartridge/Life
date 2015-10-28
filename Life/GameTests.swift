//
//  GameTests.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

@testable import Life
import XCTest


class GameTests: XCTestCase {

    let fullBoard = Board.fullBoard(Size(width: 3, height: 3))
    let emptyBoard = Board.emptyBoard(Size(width: 3, height: 3))
    
    // MARK: - Tests
    
    func test_tick_empty_passthrough() {
        let rule = TestRule()
        var game = Game(board: emptyBoard, rules: [rule])
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentBoard, emptyBoard)
        XCTAssertEqual(game.tickCount, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentBoard, emptyBoard)
        XCTAssertEqual(game.tickCount, 2)
    }
    
    func test_tick_full_passthrough() {
        let rule = TestRule()
        var game = Game(board: fullBoard, rules: [rule])
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentBoard, fullBoard)
        XCTAssertEqual(game.tickCount, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentBoard, fullBoard)
        XCTAssertEqual(game.tickCount, 2)
    }
    
    func test_tick_empty_conway_dead() {
        let rule = ConwayRule(edgeHandlingStyle: .Dead)
        var game = Game(board: emptyBoard, rules: [rule])
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentBoard, emptyBoard)
        XCTAssertEqual(game.tickCount, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentBoard, emptyBoard)
        XCTAssertEqual(game.tickCount, 2)
    }
    
    func test_tick_empty_conway_wrap() {
        let rule = ConwayRule(edgeHandlingStyle: .Wrap)
        var game = Game(board: emptyBoard, rules: [rule])
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentBoard, emptyBoard)
        XCTAssertEqual(game.tickCount, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentBoard, emptyBoard)
        XCTAssertEqual(game.tickCount, 2)
    }
    
    func test_tick_full_conway_dead() {
        let rule = ConwayRule(edgeHandlingStyle: .Dead)
        var game = Game(board: fullBoard, rules: [rule])
        let firstTickBoard = Board(size: fullBoard.size, cells: [
            .Alive, .Dead, .Alive,
            .Dead,  .Dead, .Dead,
            .Alive, .Dead, .Alive])
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentBoard, firstTickBoard)
        XCTAssertEqual(game.tickCount, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentBoard, emptyBoard)
        XCTAssertEqual(game.tickCount, 2)
    }

    func test_tick_full_conway_wrap() {
        let rule = ConwayRule(edgeHandlingStyle: .Wrap)
        var game = Game(board: fullBoard, rules: [rule])
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentBoard, emptyBoard)
        XCTAssertEqual(game.tickCount, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentBoard, emptyBoard)
        XCTAssertEqual(game.tickCount, 2)
    }

}


class TestRule: Rule {
    func evaluateForCellAtCoordinate(coordinate: Coordinate, inBoard board: Board) -> Cell {
        return board.cellAtCoordinate(coordinate)
    }
}
