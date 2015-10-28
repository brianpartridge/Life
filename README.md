# Life

## Description
[Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) library in Swift

## Usage

    import Life
    
    let conway = ConwayRule(edgeHandlingStyle: .Wrap)
    let board = Board.randomBoard(Size(width: 10, height: 10), populationDensity: 0.3)
    let game = Game(board: board, rules: conway)
    for i in 0...100 {
      print(game)
    }
    
See [Example.playground](Example.playground) for more.

## License
[MIT](LICENSE)

## Contact
[Brian Partridge](http://brianpartridge.name) - [@brianpartridge](http://twitter.com/brianpartridge)
