//
//  SnackListTableViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 09/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit

class SnackListTableViewController: UITableViewController {
    
    var Snacks = [Snack] ();

    @IBOutlet var SnackTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SnackTableView.delegate = self;
        self.SnackTableView.dataSource = self;
        Snacks = createSnacks();
       

 
    }
    
    func createSnacks() -> [Snack]{
       
        let snack1 = Snack(image: UIImage(named: "paprika")!
                    , naam: "Lays Paprika"
            , prijs: 1.00
                    , beschrijving: """
                    De enige echte Lay's chips met paprikasmaak
                    Zonder kunstmatige kleurstoffen
                    Bevat 7-8 porties
                    """ );
        let snack2 = Snack(image: UIImage(named: "ketchup")!
                   , naam: "Lay's Su­per­chips Ketchup"
            , prijs: 1.20
                   , beschrijving: """
                   Lay's Superchips, extra crunchy gebakken met de heerlijke smaak van Heinz Tomato Ketchup.
                   """ );
        let snack3 = Snack(image: UIImage(named: "grills")!
                   , naam: "Grills"
                   , prijs: 1.00
                   , beschrijving: """
                    Grills is gemaakt van de lekkerste maïs en de beste aardappelen. Met een heerlijk gerookte bacon smaak
                   """ );
        let snack4 = Snack(image: UIImage(named: "worst")!
                   , naam: "Droge Worst"
                   , prijs: 1.5
                   , beschrijving: """
                   Lekker pittige Spaanse chorizo. Gedroogd in de traditionele vorm. Ideaal als snack of combinatie met andere gerechten.
                   """ );
        let snack5 = Snack(image: UIImage(named: "pickles")!
                   , naam: "Lays Pickles"
                   , prijs: 1.20
                   , beschrijving: """
                   De enige echte Lay's chips met de unieke en onovertroffen smaak van pickles.
                    bevat 7-8 porties
                   """ );
        let snack6 = Snack(image: UIImage(named: "bifi")!
                          , naam: "Bifi Duo"
                          , prijs: 0.80
                          , beschrijving: """
                          2 heerlijke salami worstjes gemaakt van hoogwaardig kwaliteitsvlees.
                          """ );
        var snacken = [Snack] ();
        snacken.append(snack1);
        snacken.append(snack2);
        snacken.append(snack3);
        snacken.append(snack4);
        snacken.append(snack5);
        snacken.append(snack6);
        return snacken;
        
        
    }

    // MARK: - Table view data source

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return Snacks.count;
      }

   

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let snackie = Snacks[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "snackcell", for: indexPath) as! SnackViewCell;
        
        cell.snackPicture.image = snackie.Image;
        cell.snackName.text = snackie.Naam;
        cell.snackPrice.text = "\(snackie.Prijs)";
        cell.snackDescription.text = snackie.Beschrijving;
        

        // Configure the cell...

        return cell
    }
    





}
