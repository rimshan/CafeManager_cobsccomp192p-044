//
//  CategoryViewController.swift
//  CafeManager
//
//  Created by Rimshan on 4/30/21.
//  Copyright © 2021 Rimshan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Loaf

class CategoryViewController: UIViewController {

    let databaseReference = Database.database().reference()
    
    var categoryList: [Category] = []
    
    @IBOutlet weak var txtCategoryName: UITextField!
    @IBOutlet weak var tblCategory: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onAddCategoryPressed(_ sender: UIButton) {
        if let name  = txtCategoryName.text {
            addCategory(name: name)
        }else{
             Loaf("Category name is required", state: .error, sender:self).show()
        }
    }
}

extension CategoryViewController{
    func addCategory(name: String){
        databaseReference.child("categories").childByAutoId()
            .child("name").setValue(name){
                error, ref in
                if let error = error{
                    Loaf(error.localizedDescription, state: .error, sender:self).show()
                }else{
                    Loaf("Category created successfully", state: .success, sender:self).show()
                    self.refreshCategory()
                }
        }
    }
    
    func refreshCategory(){
        databaseReference.child("categories")
            .observeSingleEvent(of: .value, with: {
                snapshot in
                if snapshot.hasChildren(){
                    print(snapshot)
                }
            })
    }
}
