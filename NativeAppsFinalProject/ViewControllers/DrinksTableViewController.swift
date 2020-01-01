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
    let Data = DataFetchDiscovery();

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        Drinks = createDrinks();
        CurrentDrinks = Drinks;
        self.navigationController?.isNavigationBarHidden = false;
    }
    
    //drinks halen
    func createDrinks () -> [Drink] {
        let drinkies = Data.createDrinks();
        return drinkies;
        
    }
    //zoeken scope
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
       //zoeken text
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


