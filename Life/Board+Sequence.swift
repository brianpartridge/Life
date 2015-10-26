//
//  Board+Sequence.swift
//  Life
//
//  Created by Brian Partridge on 10/25/15.
//  Copyright © 2015 PearTreeLabs. All rights reserved.
//

import Foundation


extension Board: SequenceType {
    public typealias Generator = AnyGenerator<Coordinate>
    
    public func generate() -> Generator {
        var index = 0
        return anyGenerator {
            let size = self.size
            
            if index >= size.width * size.height {
                return nil
            }
            
            let y = index / size.width
            let x = index - (y * size.width)
            let coordinate = Coordinate(x: x, y: y)
            index++
            return coordinate
        }
    }
}
