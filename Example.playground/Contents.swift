//: Playground - noun: a place where people can play

import Life
import XCPlayground

let origin = Coordinate(x: 0, y: 0)
let size = Size(width: 10, height: 10)
let board = boardByInsertingGliderAtCoordinate(origin, inBoard: Board.emptyBoard(size))

let rules = ConwayRule(edgeHandlingStyle: .Dead)
var game = Game(board: board, rules: [rules])

game.forEach {
    XCPlaygroundPage.currentPage.captureValue($0.description, withIdentifier: "Generation \($0.number)")
}



func boardByInsertingGliderAtCoordinate(offset: Coordinate, inBoard board: Board) -> Board {
    let coordinates = [
        Coordinate(x: 1, y: 0),
        Coordinate(x: 2, y: 1),
        Coordinate(x: 0, y: 2),
        Coordinate(x: 1, y: 2),
        Coordinate(x: 2, y: 2),
    ]
    let indecies = coordinates.map { board.cellIndexForCoordinate($0 + offset) }
    
    var cells = board.cells
    indecies.forEach { cells[$0] = .Alive }
    return Board(size: board.size, cells: cells)
}
