//
//  DataFetchDiscovery.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 08/12/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
import UIKit

class DataFetchDiscovery{
    
    func createSnacks() -> [Snack]{
     
     var snacken : [Snack] = [];
       
        let snack1 = Snack(image: UIImage(named: "paprika")!
                    , naam: "Lays Paprika"
            , prijs: 1.00
                    , beschrijving: """
                    De enige echte Lay's chips met paprikasmaak
                    Zonder kunstmatige kleurstoffen
                    Bevat 7-8 porties
                    """,
                      categorie: "chips");
        let snack2 = Snack(image: UIImage(named: "ketchup")!
                   , naam: "Lay's Su­per­chips Ketchup"
            , prijs: 1.20
                   , beschrijving: """
                   Lay's Superchips, extra crunchy gebakken met de heerlijke smaak van Heinz Tomato Ketchup.
                   """
                    , categorie: "chips");
        let snack3 = Snack(image: UIImage(named: "grills")!
                   , naam: "Grills"
                   , prijs: 1.00
                   , beschrijving: """
                    Grills is gemaakt van de lekkerste maïs en de beste aardappelen. Met een heerlijk gerookte bacon smaak
                   """,
                     categorie: "chips");
        let snack4 = Snack(image: UIImage(named: "worst")!
                   , naam: "Droge Worst"
                   , prijs: 1.5
                   , beschrijving: """
                   Lekker pittige Spaanse chorizo. Gedroogd in de traditionele vorm. Ideaal als snack of combinatie met andere gerechten.
                   """
                    ,categorie: "worst" );
        let snack5 = Snack(image: UIImage(named: "pickles")!
                   , naam: "Lays Pickles"
                   , prijs: 1.20
                   , beschrijving: """
                   De enige echte Lay's chips met de unieke en onovertroffen smaak van pickles.
                    bevat 7-8 porties
                   """
                    ,categorie: "chips");
        let snack6 = Snack(image: UIImage(named: "bifi")!
                          , naam: "Bifi Duo"
                          , prijs: 0.80
                          , beschrijving: """
                          2 heerlijke salami worstjes gemaakt van hoogwaardig kwaliteitsvlees.
                          """,  categorie: "worst" );
       
        
        
        snacken.append(snack1);
        snacken.append(snack2);
        snacken.append(snack3);
        snacken.append(snack4);
        snacken.append(snack5);
        snacken.append(snack6);
        return snacken;
    }
    
    func createDrinks () -> [Drink] {
        let drink1 = Drink(image: UIImage(named: "bockor")!, naam: "Bockor Pils", prijs: 1.40, beschrijving: """
            Bockor pils heeft een mooie, smeuïge schuimkraag wanneer het bier vakkundig geschonken wordt in een zuiver, goed ontvet glas. De geur heeft een frisse hoptoets en een mooie ingehouden bitterheid.
            """
            , categorie: "bier"
            , alcoholperc: 5.2);
        
        let drink2 = Drink(image: UIImage(named: "omer")!, naam: "Omer Traditional Beer", prijs: 2.00, beschrijving: """
                    OMER. dankt zijn fijn, fruitig aroma en subtiele bitterheid aan de zorgvuldig geselecteerde grondstoffen zoals de beste gerstemout uit de Loirestreek.
                   """
                   , categorie: "bier"
            , alcoholperc: 8.00);
        
        let drink3 = Drink(image: UIImage(named: "cola")!, naam: "Cola", prijs: 1.20, beschrijving: """
                          Coca-Cola is de meest favoriete frisdrank van de wereld. De 0,5L PET is de ideale verpakking voor onderweg.
                          """
                          , categorie: "soda"
            , alcoholperc: 0.00);
        
        let drink4 = Drink(image: UIImage(named: "wittewijn")!, naam: "Witte Wijn", prijs: 2.00, beschrijving: """
                           Dit is een heerlijke, frisse wijn om mee te borrelen. Hij heeft de fruitige smaak van peer en meloen. Gemaakt van biologisch verbouwde druiven.
                          """
                          , categorie: "wijn"
            , alcoholperc: 12.2);
        
        let drink5 = Drink(image: UIImage(named: "blauw")!, naam: "Bockor Blauw", prijs: 1.40, beschrijving: """
                       BLAUW is een export bier, een biertype van lage gisting dat in de jaren ’50 heel populair was.
                       In die tijd was zware handenarbeid erg belangrijk en dronken de arbeiders regelmatig bier.
                      """
                      , categorie: "bier"
            , alcoholperc: 5.2);
        
        let drink6 = Drink(image: UIImage(named: "bruintje")!, naam: "Vandeghiste Roodbruin", prijs: 1.40, beschrijving: """
                           VanderGhinste Roodbruin heette oorspronkelijk in 1892 “ouden tripel” en was het eerste bier dat Omer Vander Ghinste op
                           de markt bracht. Het is een Zuid-West-Vlaams roodbruin bier van gemengde gisting dat typisch is voor deze streek.
                          """
                          , categorie: "bier"
                , alcoholperc: 5.5);
        
        let drink7 = Drink(image: UIImage(named: "kriek")!, naam: "Kriek Max", prijs: 1.20, beschrijving: """
                   Kriek Max wordt gebrouwen op basis van spontane gisting. De perfecte combinatie van 25% natuurlijke kriekensappen, samen met het
                   basisbier bezorgen deze kriek niet enkel zijn uitstekende smaak maar ook zijn aangename geur.
                  """
                  , categorie: "bier"
            , alcoholperc: 3.5);
        
        let drink8 = Drink(image: UIImage(named: "rose")!, naam: "Rosé", prijs: 1.20, beschrijving: """
               Deze licht getinte, droge rose komt uit het zuiden van Frankrijk. Hij is fris en zit vol fruitig sap. Heerlijk om zo van te
               genieten. Met of zonder iets erbij.
              """
              , categorie: "wijn"
            , alcoholperc: 10.2);
        
        let drink9 = Drink(image: UIImage(named: "icetea")!, naam: "Ice Tea Green", prijs: 1.20, beschrijving: """
                      Koolzuurvrije frisdrank met groene thee-extract, limoensap en muntextract, gezoet met suiker en zoetstof van natuurlijke
                      oorsprong.
                     """
                     , categorie: "soda"
            , alcoholperc: 0.0);
        
        let drink10 = Drink(image: UIImage(named: "fanta")!, naam: "Fanta", prijs: 1.20, beschrijving: """
                  Proef de fruitige smaak van Fanta exotic no sugar. Fanta exotic no sugar is een combinatie van sprankelend water en exotisch
                  vruchtensap, zonder suiker. De 330ml blik is de ideale verpakking om onderweg van deze frisdrank te genieten
                 """
                 , categorie: "soda"
        , alcoholperc: 0.0);
        
        let drink11 = Drink(image: UIImage(named: "nalu")!, naam: "Nalu", prijs: 1.20, beschrijving: """
                  Nalu fruity energizer, een geweldige energiedrank met vruchtensappen, met suiker en zoetstoffen. Een beetje moe? Drink nalu!
                 """
                 , categorie: "soda"
        , alcoholperc: 0.0);
        
    
        
        var drinken = [Drink]();
        drinken.append(drink1);
        drinken.append(drink2);
        drinken.append(drink3);
        drinken.append(drink4);
        drinken.append(drink5);
        drinken.append(drink6);
        drinken.append(drink7);
        drinken.append(drink8);
        drinken.append(drink9);
        drinken.append(drink10);
        drinken.append(drink11);
        return drinken;
        
    }
    
    func createGames() -> [Game] {
          let game1 = Game(image: UIImage(named: "bierpongtafel")!, naam: "Bierpong", price: 10.0, description: "Bierpong spel, 2 tegen 2 met elk 10 bekers gevuld met bier.", categorie: "drinking");
          
          let game2 = Game(image: UIImage(named: "wieishet")!, naam: "Wie is het?", price: 4.50
              , description: """
              Dit is het originele Wie is het? raadspel! Wie is het?
              Elke speler kiest een geheime figuur en probeert dan met behulp van ja- en nee-vragen uit te vinden wie de geheime figuur van de tegenstander is.
              """
              , categorie: "board");
        
        let game3 = Game(image: UIImage(named: "trivial")!, naam: "Trivial P.", price: 6.0
                     , description: """
                     Het snelle weetjesspel voor de hele familie, met 2400 vragen. Haal iedereen bij elkaar voor een geweldige speelervaring! Deze
                     Trivial Pursuit Familie Editie biedt nieuwe vragen en een lekker hoog tempo
                     """
                     , categorie: "board");
        
        let game5 = Game(image: UIImage(named: "pietjesbak")!, naam: "Pietjesbak", price: 3.0
                            , description: """
                            Pietjesbak of Pitjesbak is een oud Vlaams dobbelspel met drie dobbelstenen voor twee tot acht spelers. Deze
                            8-kantige,houten pitjesbak is speciaal voor dat spel gemaakt.
                            """
                            , categorie: "board");
        
        let game6 = Game(image: UIImage(named: "uno")!, naam: "Uno", price: 1.0
                                   , description: """
                                   Uno is een leuk kaartspel voor de hele familie! Echter wordt er niet gespeeld met standaard kaarten met jokers,
                                   maar met kaarten met een eigen eenvoudige voorstelling.
                                   """
                                   , categorie: "board");
          
          var games = [Game] ();
          games.append(game1);
          games.append(game2);
          games.append(game3);
          games.append(game5);
          games.append(game6);
          return games;
          
        
      }
    
    
}


