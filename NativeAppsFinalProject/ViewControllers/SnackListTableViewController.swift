//
//  SnackListTableViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 09/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit


class SnackListTableViewController: UITableViewController, UISearchBarDelegate {
    
    var Snacks = [Snack] ();
    var CurrentSnacks = [Snack] ();
    let Data = DataFetchDiscovery();

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Snacks = createSnacks();
        CurrentSnacks = Snacks;
        self.navigationController?.isNavigationBarHidden = false;
        
 
    }
    
    //snacks halen
    func createSnacks()-> [Snack]{
        let snackies = Data.createSnacks();
        return snackies;
        
        
    }
    
    //zoekbalk/scope
    @available(iOS 3.0, *)
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        
        switch selectedScope{
               case 0 : CurrentSnacks = createSnacks();
                   tableView.reloadData();
                   
               case 1 :
                   CurrentSnacks = createSnacks().filter({ snack -> Bool in
                       snack.Categorie == "chips"
                   });
                   tableView.reloadData();
               case 2 :
                   CurrentSnacks = createSnacks().filter({ snack -> Bool in
                       snack.Categorie == "worst";
                   });
                   tableView.reloadData();
                   
               default:
                   return;
               }
    }
    //zoekbalk zoeken
    @available(iOS 2.0, *)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        CurrentSnacks = Snacks.filter({ snack -> Bool in
                 switch searchBar.selectedScopeButtonIndex{
                 case 0 :
                     if searchText.isEmpty{ return snack.Categorie == "chips" || snack.Categorie == "worst" }
                     return snack.Naam.contains(searchText);
                 case 1 :
                     if searchText.isEmpty{return snack.Categorie == "chips" }
                     return snack.Naam.contains(searchText) && snack.Categorie == "chips";
                 case 2 :
                     if searchText.isEmpty{return snack.Categorie == "worst";}
                     return snack.Naam.contains(searchText) && snack.Categorie == "worst";
                 default:
                     return false;
                 }
                 
             })
             tableView.reloadData();
    }
    
    
    

    // MARK: - Table view data source

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return CurrentSnacks.count;
      }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let snackie = CurrentSnacks[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "snackcell", for: indexPath) as! SnackViewCell;
        
        cell.snackPicture.image = snackie.Image;
        cell.snackName.text = snackie.Naam;
        cell.snackPrice.text = "\(snackie.Prijs)";
        cell.snackDescription.text = snackie.Beschrijving;
        
         cell.selectionStyle = .none;
      

        return cell
    }
    





}
