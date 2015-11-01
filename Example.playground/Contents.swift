//: Playground - noun: a place where people can play

import Life
import XCPlayground

let glider = Glider()

let origin = Coordinate(x: 0, y: 0)
let size = Size(width: 10, height: 10)
let emptyBoard = Board.emptyBoard(size)
let board = emptyBoard.boardByInsertingPattern(glider, atCoordinate: origin)

let rules = ConwayRuleSet(edgeHandlingStyle: .Dead)
var game = Game(board: board, rules: rules)

// Make sure to reveal the Timeline in the Assistant Editor 👉🏼
game.forEach {
    XCPlaygroundPage.currentPage.captureValue($0.description, withIdentifier: "Generation \($0.number)")
}
