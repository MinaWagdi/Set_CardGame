//
//  Memento.swift
//  Set_Card_Game
//
//  Created by Mina Wagdi  on 5/17/19.
//  Copyright © 2019 Mina Wagdi . All rights reserved.
//

import Foundation

class Memento{
    private var cards = [Card]()
    var cardsOfSetState: ((Card?,Int?),(Card?,Int?),(Card?,Int?))
    var score = 0
    
    init(cards: [Card], cardsOfSet: ((Card?,Int?),(Card?,Int?),(Card?,Int?)),score:Int){
        self.cards=cards
        self.cardsOfSetState = cardsOfSet
        self.score=score
    }
    public func getCardsState()->[Card]{
        return self.cards
    }
    public func getCardsOfSet()->((Card?,Int?),(Card?,Int?),(Card?,Int?)){
        return self.cardsOfSetState
    }
    public func getScore()->Int{
        return self.score
    }
    
}
