//
//  Game.swift
//  Set_Card_Game
//
//  Created by Mina Wagdi  on 4/25/19.
//  Copyright © 2019 Mina Wagdi . All rights reserved.
//

import Foundation

struct Game{
    
    var cards = [Card]()
    var IndexToCardsArray:Int = 0 // to indicate to which card index we have shown in our view
    var set = Set()
    
    init() {
        for shape in Shape.all(){
            for numberOfShapes in NumberOfShapes.all(){
                for color in Color.all(){
                    for shading in Shading.all(){
                        cards.append(Card(shape: shape, numberOfShapes: numberOfShapes, shading: shading, color: color))
                    }
                }
            }
        }
        print("Cards counts is \(cards.count)")
        cards.shuffle()
        
    }
}
