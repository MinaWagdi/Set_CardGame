//
//  ViewController.swift
//  Set_Card_Game
//
//  Created by Mina Wagdi  on 4/23/19.
//  Copyright © 2019 Mina Wagdi . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = Game()
    var SelectedButtons : (button1: UIButton, button2: UIButton, button3: UIButton)? = nil
    var NumberOfSelectedButton : Int = 0
    var GameCardIndexVsButtonIndexDictionary = [Int:Int]() // the first Int is the index of the card of the game variable and the second Int is the index of the card in the Buttons outlet Collection array
    var attributes=[NSAttributedString.Key:Any]() //= [.font: 40.0]
    var emptyIndicesInCardsArrayOfButtons = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeButtons()
        updateViewFromModel()
        InitEmptyIndicesInCardsArrayOfButtons()
        
    }
    
    func InitEmptyIndicesInCardsArrayOfButtons(){
        for cardIndex in 12..<Cards.count{
            emptyIndicesInCardsArrayOfButtons.append(cardIndex)
        }
    }
    
    func initializeButtons(){
        for card in Cards{
//            card.isHidden=true
            card.backgroundColor = UIColor.clear
        }
        //Since game.cards is a shuffled array, we will show the first 12 cards in the beginning of the game
        for cardIndex in 0..<12{
            game.cards[cardIndex].isVisible=true
            GameCardIndexVsButtonIndexDictionary[cardIndex]=cardIndex
        }
    }
    
    func showCardDetails(cardIndex: Int, cardButtonIndexKey: Int){
        
        var buttonShapeString: String = "" // either triangle, circle or square
        var cardColor=UIColor() // the color of the Card, either green, blue or red
        attributes.removeAll() // the NSAttributedString attributes
        
//        Cards[cardButtonIndexKey].isHidden=false // show the card
        
        switch game.cards[cardIndex].color{
        case .green:
            cardColor = UIColor.green
        case .red:
            cardColor = UIColor.red
        case .blue:
            cardColor = UIColor.blue
        }
        
        switch game.cards[cardIndex].shading{
        case .solid: attributes[.foregroundColor] = cardColor.withAlphaComponent(1)
        case .shaded: attributes[.foregroundColor] = cardColor.withAlphaComponent(0.3)
        case .open:
            attributes[NSAttributedString.Key.strokeWidth] = 10
            attributes[NSAttributedString.Key.strokeColor] = cardColor
        }
        
        switch (game.cards[cardIndex].shape){
        case .circle: buttonShapeString="●"
        case .rectangle: buttonShapeString = "■"
        case .triangle: buttonShapeString = "▲"
        }
        
        switch (game.cards[cardIndex].numberOfShapes){
        case .one:
            break
        case .two:
            buttonShapeString.append(buttonShapeString)
        case .three:
            buttonShapeString.append("\(buttonShapeString)\(buttonShapeString)")
        }
        
        Cards[cardButtonIndexKey].setAttributedTitle(NSAttributedString(string:buttonShapeString,attributes: attributes), for: UIControl.State.normal)
        if(game.cards[cardIndex].isPartOfSet){
            Cards[cardButtonIndexKey].backgroundColor = #colorLiteral(red: 0.2987604737, green: 0.2987604737, blue: 0.2987604737, alpha: 1)
        }else{
            Cards[cardButtonIndexKey].backgroundColor=UIColor.white
        }
        
    }
    
    
    func updateViewFromModel(){
//        for card in Cards{
//            card.isHidden=true
//        }
        for cardIndex in 0..<game.cards.count{
            if let cardButtonIndexValue = GameCardIndexVsButtonIndexDictionary[cardIndex]{
                if game.cards[cardIndex].isVisible{
                    showCardDetails(cardIndex: cardIndex, cardButtonIndexKey: cardButtonIndexValue)
                }
                
            }
        }
    }
    
    @IBOutlet var Cards: [UIButton]!
    
    @IBAction func DrawCards(_ sender: UIButton) {
        if emptyIndicesInCardsArrayOfButtons.count>0{
            print("empty indices array is greater than 0")
            var sortedArray = emptyIndicesInCardsArrayOfButtons.sorted(by: <)
            print("sortedArray is \(sortedArray)")
            var cardsToDraw = 3
            for cardIndex in game.cards.indices{
                if !game.cards[cardIndex].isVisible && !game.cards[cardIndex].isPartOfSet && GameCardIndexVsButtonIndexDictionary[cardIndex]==nil{
                    print("entered in the conditions")
                    GameCardIndexVsButtonIndexDictionary[cardIndex]=sortedArray[0]
                    showCardDetails(cardIndex: cardIndex, cardButtonIndexKey: sortedArray.remove(at: 0))
                    cardsToDraw -= 1
                    emptyIndicesInCardsArrayOfButtons=sortedArray
                    if(cardsToDraw==0){
                        break
                    }
                }
            }
        }else{
            return
        }
        
        
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if sender.backgroundColor != UIColor.clear{
            let index = Cards.index(of:sender)
            // loop on all the cards available on the screen to search for the index of the card touched in the Model's game cards instance
            for gameCardIndex in GameCardIndexVsButtonIndexDictionary.keys{
                // if card is found, and is not a part of a set enter the condition
                if GameCardIndexVsButtonIndexDictionary[gameCardIndex]==index && game.cards[gameCardIndex].isPartOfSet == false{
                    print("Color is : \(game.cards[gameCardIndex].color)")
                    if game.cards[gameCardIndex].isSelected == false && NumberOfSelectedButton < 3{
                        SelectButton(sender: sender,gameCardIndex: gameCardIndex )
                        NumberOfSelectedButton += 1
                        game.set.addCard(card: game.cards[gameCardIndex],index: gameCardIndex)
                    }else if game.cards[gameCardIndex].isSelected == true{
                        diselectButton(sender: sender, gameCardIndex: gameCardIndex)
                        NumberOfSelectedButton -= 1
                        game.set.CancelCard(card: game.cards[gameCardIndex],index: gameCardIndex)
                    }else{
                        print("cannot be selected nor deselected, number of Selected Button is \(NumberOfSelectedButton)")
                        print("\(game.cards[gameCardIndex].isSelected)")
                    }
                    break
                }
            }
            if NumberOfSelectedButton==3{
                if game.set.isSet(){
                    print("Is Set")
                    let card1IndexInGameArray = game.set.card1.IndexOfCardInGameCardArray!
                    let card2IndexInGameArray = game.set.card2.IndexOfCardInGameCardArray!
                    let card3IndexInGameArray = game.set.card3.IndexOfCardInGameCardArray!
                    
                    game.cards[card1IndexInGameArray].isPartOfSet=true
                    game.cards[card2IndexInGameArray].isPartOfSet=true
                    game.cards[card3IndexInGameArray].isPartOfSet=true
                    
                    game.cards[card1IndexInGameArray].isVisible=false
                    game.cards[card2IndexInGameArray].isVisible=false
                    game.cards[card3IndexInGameArray].isVisible=false
                    
                    if let CardButtonIndexReleased = GameCardIndexVsButtonIndexDictionary.removeValue(forKey: card1IndexInGameArray){
                        emptyIndicesInCardsArrayOfButtons.append(CardButtonIndexReleased)
                    }else{
                        print("Nil value found when removing card1IndexInGameArray from GameCardIndexVsButtonIndexDictionary")
                    }
                    if let CardButtonIndexReleased = GameCardIndexVsButtonIndexDictionary.removeValue(forKey: card2IndexInGameArray){
                        emptyIndicesInCardsArrayOfButtons.append(CardButtonIndexReleased)
                    }else{
                        print("Nil value found when removing card2IndexInGameArray from GameCardIndexVsButtonIndexDictionary")
                    }
                    if let CardButtonIndexReleased = GameCardIndexVsButtonIndexDictionary.removeValue(forKey: card3IndexInGameArray){
                        emptyIndicesInCardsArrayOfButtons.append(CardButtonIndexReleased)
                    }else{
                        print("Nil value found when removing card3IndexInGameArray from GameCardIndexVsButtonIndexDictionary")
                    }
                    
                    game.set.CancelAllCardsinSet()
                    NumberOfSelectedButton=0
                    updateViewFromModel()
                }
                else{
                    // TODO: deal with the mis matched cards
                }
            }
        }
    }

    
    
    func SelectButton(sender : UIButton, gameCardIndex: Int){
        sender.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        game.cards[gameCardIndex].isSelected=true
    }
    func diselectButton(sender: UIButton, gameCardIndex: Int){
        sender.backgroundColor = UIColor.white
        game.cards[gameCardIndex].isSelected = false
    }
    
    

}

