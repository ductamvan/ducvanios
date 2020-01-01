//
//  GamesTableViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 13/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit

class GamesTableViewController: UITableViewController, UISearchBarDelegate{
    var Games = [Game] ();
    var CurrentGames = [Game] ();
    let Data = DataFetchDiscovery();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Games = createElements();
        CurrentGames = Games;
        self.navigationController?.isNavigationBarHidden = false;

      
    }
    //halen games
    func createElements() -> [Game] {
        let gamies = Data.createGames();
        return gamies;
        
      
    }
    //zoeken scope
    @available(iOS 3.0, *)
          func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
              switch selectedScope{
                     case 0 : CurrentGames = createElements();
                         tableView.reloadData();
                         
                     case 1 :
                         CurrentGames = createElements().filter({ game -> Bool in
                             game.Categorie == "drinking"
                         });
                         tableView.reloadData();
                     case 2 :
                       
                         CurrentGames = createElements().filter({ game -> Bool in
                             game.Categorie == "board";
                         });
                         tableView.reloadData();
                  
                     default:
                         return;
                     }
          }
          //zoeken text
          @available(iOS 2.0, *)
          func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
              CurrentGames = Games.filter({ game -> Bool in
                       switch searchBar.selectedScopeButtonIndex{
                       case 0 :
                           if searchText.isEmpty{ return game.Categorie == "drinking" || game.Categorie == "board" }
                           return game.Name.contains(searchText);
                       case 1 :
                           if searchText.isEmpty{return game.Categorie == "drinking" }
                           return game.Name.contains(searchText) && game.Categorie == "drinking";
                       case 2 :
                           if searchText.isEmpty{return game.Categorie == "board";}
                           return game.Name.contains(searchText) && game.Categorie == "board";
                     
                       default:
                           return false;
                       }
                       
                   })
                   tableView.reloadData();
          }
    
  
    
    
   
    
    
    

    
    
   
    
    // MARK: - Table view data source

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CurrentGames.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gamie = CurrentGames[indexPath.row];

        let cell = tableView.dequeueReusableCell(withIdentifier: "gamestable", for: indexPath) as! GameViewCell;
        
        cell.GameImage.image = gamie.GameImage;
        cell.GameName.text = gamie.Name;
        cell.GameDescription.text = gamie.Description;
        cell.GamePrice.text = "\(gamie.Price)";
        
         cell.selectionStyle = .none;
        
        return cell
    }
    
    
    

   


}
