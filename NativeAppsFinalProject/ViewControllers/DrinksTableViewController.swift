//
//  DrinksTableViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 12/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit

class DrinksTableViewController: UITableViewController, UISearchBarDelegate{
    
    var Drinks = [Drink] ();
    var CurrentDrinks =  [Drink] ();

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        Drinks = createDrinks();
        CurrentDrinks = Drinks;
        self.navigationController?.isNavigationBarHidden = false;
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
        
    
        
        var drinken = [Drink]();
        drinken.append(drink1);
        drinken.append(drink2);
        drinken.append(drink3);
        drinken.append(drink4);
        return drinken;
    }
    
    @available(iOS 3.0, *)
       func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
           switch selectedScope{
                  case 0 : CurrentDrinks = createDrinks();
                      tableView.reloadData();
                      
                  case 1 :
                      CurrentDrinks = createDrinks().filter({ drink -> Bool in
                          drink.Categorie == "bier"
                      });
                      tableView.reloadData();
                  case 2 :
                    print("lololol");
                      CurrentDrinks = createDrinks().filter({ drink -> Bool in
                          drink.Categorie == "wijn";
                      });
                      tableView.reloadData();
                case  3 :
                      CurrentDrinks = createDrinks().filter({ drink -> Bool in
                          drink.Categorie == "soda";
                      });
                      tableView.reloadData();
                      
                  default:
                      return;
                  }
       }
       
       @available(iOS 2.0, *)
       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
           CurrentDrinks = Drinks.filter({ drink -> Bool in
                    switch searchBar.selectedScopeButtonIndex{
                    case 0 :
                        if searchText.isEmpty{ return drink.Categorie == "bier" || drink.Categorie == "wijn" || drink.Categorie == "soda" }
                        return drink.Naam.contains(searchText);
                    case 1 :
                        if searchText.isEmpty{return drink.Categorie == "bier" }
                        return drink.Naam.contains(searchText) && drink.Categorie == "bier";
                    case 2 :
                        if searchText.isEmpty{return drink.Categorie == "wijn";}
                        return drink.Naam.contains(searchText) && drink.Categorie == "wijn";
                    case 3 :
                        if searchText.isEmpty{return drink.Categorie == "soda";}
                        return drink.Naam.contains(searchText) && drink.Categorie == "soda";
                    default:
                        return false;
                    }
                    
                })
                tableView.reloadData();
       }
    
   
    // MARK: - Table view data source

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrentDrinks.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let drinkie = CurrentDrinks[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkcell", for: indexPath) as! DrinkViewCell;
        
        cell.DrinkImage.image = drinkie.Image;
        cell.DrinkBeschrijving.text = drinkie.Beschrijving;
        cell.DrinkName.text = drinkie.Naam;
        cell.DrinkPerc.text = "\(drinkie.AlcoholPerc)";
        cell.DrinkPrice.text = "\(drinkie.Prijs)";
        
        
         cell.selectionStyle = .none;
        
        return cell;
    }
}


