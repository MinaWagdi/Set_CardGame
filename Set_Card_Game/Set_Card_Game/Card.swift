//
//  Card.swift
//  Set_Card_Game
//
//  Created by Mina Wagdi  on 4/23/19.
//  Copyright © 2019 Mina Wagdi . All rights reserved.
//

import Foundation

struct Card: Hashable{
    var shape: Shape
    var numberOfShapes : NumberOfShapes
    var shading : Shading
    var color : Color
    var identifier: Int
    
    static var IdentifierFactory: Int = 0
    var isVisible: Bool = false
    var isSelected: Bool = false
    var isPartOfSet: Bool = false
    
    var hashValue:Int {return identifier}
    
    static func AllSameOrDifferentShape(card1: Card, card2: Card, card3: Card)-> Bool{
        if card1.shape==card2.shape && card2.shape==card3.shape{
            return true;
        }else if card1.shape != card2.shape && card1.shape != card3.shape && card2.shape != card3.shape{
            return true
        }
        print("Shape MISMATCH")
        return false
    }
    
    static func AllSameOrDifferentColor(card1: Card, card2: Card, card3: Card)-> Bool{
        if card1.color==card2.color && card2.color==card3.color{
            return true;
        }else if card1.color != card2.color && card1.color != card3.color && card2.color != card3.color{
            return true
        }
        print("COLOR MISMATCH")
        return false
    }
    
    static func AllSameOrDifferentShading(card1: Card, card2: Card, card3: Card)-> Bool{
        if card1.shading==card2.shading && card2.shading==card3.shading{
            return true;
        }else if card1.shading != card2.shading && card1.shading != card3.shading && card2.shading != card3.shading{
            return true
        }
        print("Shading MISMATCH")
        return false
    }
    
    static func AllSameOrDifferentNumberOfShapes(card1: Card, card2: Card, card3: Card)-> Bool{
        if card1.numberOfShapes==card2.numberOfShapes && card2.numberOfShapes==card3.numberOfShapes{
            return true;
        }else if card1.numberOfShapes != card2.numberOfShapes && card1.numberOfShapes != card3.numberOfShapes && card2.numberOfShapes != card3.numberOfShapes{
            return true
        }
        print("Number Of Shapes MISMATCH")
        return false
    }
    
    init(shape: Shape, numberOfShapes: NumberOfShapes, shading: Shading, color: Color) {
        Card.IdentifierFactory += 1
        self.identifier = Card.IdentifierFactory
        
        self.shape=shape
        self.numberOfShapes=numberOfShapes
        self.shading=shading
        self.color=color
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool{
        if lhs.shape==rhs.shape && lhs.color==rhs.color && lhs.numberOfShapes==rhs.numberOfShapes && lhs.shading==rhs.shading{
            return true
        }
        return false
    }
}
