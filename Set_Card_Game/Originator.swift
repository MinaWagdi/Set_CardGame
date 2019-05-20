//
//  Originator.swift
//  Set_Card_Game
//
//  Created by Mina Wagdi  on 5/17/19.
//  Copyright © 2019 Mina Wagdi . All rights reserved.
//

import Foundation

class Originator{
    var cardsState = [Card]()
    var cardsOfSetState: ((Card?,Int?),(Card?,Int?),(Card?,Int?))
    var score = 0
    
    public func setState(cards:[Card],cardsOfSet: ((Card?,Int?),(Card?,Int?),(Card?,Int?)),score:Int){
        self.cardsState=cards
        self.cardsOfSetState=cardsOfSet
        self.score=score
    }
    public func getCardsState()->[Card]{
        return self.cardsState
    }
    public func getCardsOfSet()->((Card?,Int?),(Card?,Int?),(Card?,Int?)){
        return self.cardsOfSetState
    }
    public func getScore()->Int{
        return self.score
    }
    
    
    public func saveStateToMemento()-> Memento{
        let memento = Memento(cards:cardsState, cardsOfSet:cardsOfSetState,score:score)
        return memento
    }
    public func getStateFromMemento(memento : Memento){
        cardsState = memento.getCardsState()
        cardsOfSetState = memento.getCardsOfSet()
        score = memento.getScore()
    }
    
}
