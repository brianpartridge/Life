//
//  ConwayRuleTests.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

@testable import Life
import XCTest


class ConwayRuleTests: XCTestCase {
    
    let size = Size(width: 3, height: 3)
    let center = Coordinate(x: 1, y: 1)
    let rule = ConwayRule(edgeHandlingStyle: .Wrap)
    
    // MARK: - Tests
    
    func test_dead_threeAliveNeighbors_becomesAlive() {
        let board = Board(size: size, cells: [
            .Alive, .Alive, .Alive,
            .Dead,  .Dead,  .Dead,
            .Dead,  .Dead,  .Dead])
        XCTAssertEqual(board.cellAtCoordinate(center), Cell.Dead)
        XCTAssertEqual(rule.evaluateForCellAtCoordinate(center, inBoard: board), Cell.Alive)
    }
    
    func test_dead_nonThreeAliveNeighbors_staysDead() {
        for aliveNeighborCount in 0..<size.volume {
            if aliveNeighborCount == 3 {
                continue
            }
            
            let board = threeByThreeBoard(.Dead, aliveNeighborCount: aliveNeighborCount)
            XCTAssertEqual(board.cellAtCoordinate(center), Cell.Dead)
            XCTAssertEqual(rule.evaluateForCellAtCoordinate(center, inBoard: board), Cell.Dead)
        }
    }
    
    func test_alive_lessThanTwoAliveNeighbors_dies() {
        for aliveNeighborCount in 0..<2 {
            let board = threeByThreeBoard(.Alive, aliveNeighborCount: aliveNeighborCount)
            XCTAssertEqual(board.cellAtCoordinate(center), Cell.Alive)
            XCTAssertEqual(rule.evaluateForCellAtCoordinate(center, inBoard: board), Cell.Dead)
        }
    }
    
    func test_alive_twoOrThreeAliveNeighbors_staysAlive() {
        for aliveNeighborCount in 2...3 {
            let board = threeByThreeBoard(.Alive, aliveNeighborCount: aliveNeighborCount)
            XCTAssertEqual(board.cellAtCoordinate(center), Cell.Alive)
            XCTAssertEqual(rule.evaluateForCellAtCoordinate(center, inBoard: board), Cell.Alive)
        }
    }
    
    func test_alive_greaterThanThreeAliveNeighbors_dies() {
        for aliveNeighborCount in 4..<size.volume {
            let board = threeByThreeBoard(.Alive, aliveNeighborCount: aliveNeighborCount)
            XCTAssertEqual(board.cellAtCoordinate(center), Cell.Alive)
            XCTAssertEqual(rule.evaluateForCellAtCoordinate(center, inBoard: board), Cell.Dead)
        }
    }
    
    // MARK: - Helpers
    
    func threeByThreeBoard(centerCell: Cell, aliveNeighborCount: Int) -> Board {
        let size = Size(width: 3, height: 3)
        
        var cells = [Cell]()
        var aliveNeighborsAdded = 0
        for i in 0..<size.volume {
            if i == 4 {
                cells.append(centerCell)
            } else if aliveNeighborsAdded < aliveNeighborCount {
                cells.append(.Alive)
                aliveNeighborsAdded++
            } else {
                cells.append(.Dead)
            }
        }
        return Board(size: size, cells: cells)
    }
}
