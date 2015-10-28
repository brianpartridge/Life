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
        let rules = TestRuleSet()
        var game = Game(board: emptyBoard, rules: rules)
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentGeneration.board, emptyBoard)
        XCTAssertEqual(game.currentGeneration.number, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentGeneration.board, emptyBoard)
        XCTAssertEqual(game.currentGeneration.number, 2)
    }
    
    func test_tick_full_passthrough() {
        let rules = TestRuleSet()
        var game = Game(board: fullBoard, rules: rules)
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentGeneration.board, fullBoard)
        XCTAssertEqual(game.currentGeneration.number, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentGeneration.board, fullBoard)
        XCTAssertEqual(game.currentGeneration.number, 2)
    }
    
    func test_tick_empty_conway_dead() {
        let rules = ConwayRuleSet(edgeHandlingStyle: .Dead)
        var game = Game(board: emptyBoard, rules: rules)
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentGeneration.board, emptyBoard)
        XCTAssertEqual(game.currentGeneration.number, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentGeneration.board, emptyBoard)
        XCTAssertEqual(game.currentGeneration.number, 2)
    }
    
    func test_tick_empty_conway_wrap() {
        let rules = ConwayRuleSet(edgeHandlingStyle: .Wrap)
        var game = Game(board: emptyBoard, rules: rules)
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentGeneration.board, emptyBoard)
        XCTAssertEqual(game.currentGeneration.number, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, emptyBoard)
        XCTAssertEqual(game.currentGeneration.board, emptyBoard)
        XCTAssertEqual(game.currentGeneration.number, 2)
    }
    
    func test_tick_full_conway_dead() {
        let rules = ConwayRuleSet(edgeHandlingStyle: .Dead)
        var game = Game(board: fullBoard, rules: rules)
        let firstTickBoard = Board(size: fullBoard.size, cells: [
            .Alive, .Dead, .Alive,
            .Dead,  .Dead, .Dead,
            .Alive, .Dead, .Alive])
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentGeneration.board, firstTickBoard)
        XCTAssertEqual(game.currentGeneration.number, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentGeneration.board, emptyBoard)
        XCTAssertEqual(game.currentGeneration.number, 2)
    }

    func test_tick_full_conway_wrap() {
        let rules = ConwayRuleSet(edgeHandlingStyle: .Wrap)
        var game = Game(board: fullBoard, rules: rules)
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentGeneration.board, emptyBoard)
        XCTAssertEqual(game.currentGeneration.number, 1)
        game.tick()
        XCTAssertEqual(game.initialBoard, fullBoard)
        XCTAssertEqual(game.currentGeneration.board, emptyBoard)
        XCTAssertEqual(game.currentGeneration.number, 2)
    }

}


class TestRuleSet: RuleSet {
    func evaluateForCellAtCoordinate(coordinate: Coordinate, inBoard board: Board) -> Cell {
        return board.cellAtCoordinate(coordinate)
    }
}
