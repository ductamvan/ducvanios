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

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Snacks = createSnacks();
        CurrentSnacks = Snacks;
        
 
    }
    
    func createSnacks() -> [Snack]{
       
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
        var snacken = [Snack] ();
        snacken.append(snack1);
        snacken.append(snack2);
        snacken.append(snack3);
        snacken.append(snack4);
        snacken.append(snack5);
        snacken.append(snack6);
        return snacken;
        
        
    }
    
    
   
    
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
        

      

        return cell
    }
    





}
