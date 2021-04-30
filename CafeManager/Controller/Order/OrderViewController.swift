//
//  OrderViewController.swift
//  CafeManager
//
//  Created by Rimshan on 4/30/21.
//  Copyright © 2021 Rimshan. All rights reserved.
//

import UIKit
import Firebase
import Loaf

class OrderViewController: UIViewController {
    
    @IBOutlet weak var segTabs: UISegmentedControl!
    var orders: [Order] = []
    var filteredOrders: [Order] = []

    let databaseReference = Database.database().reference()
    @IBOutlet weak var tblOrders: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblOrders.register(UINib(nibName: OrderTableViewCell.nibName, bundle: nil), forCellReuseIdentifier:OrderTableViewCell.reuseIdentifier)


    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.fetchOrders()
    }
    

    @IBAction func onSegChanged(_ sender: Any) {
        filterOrders(status: sender.selectedSegmentIndex)
    }


}

extension OrderViewController {
    
    func filterOrders(status: Int) {
        filteredOrders.removeAll()
        filteredOrders = self.orders.filter {$0.status_code == status}
        tblOrders.reloadData()
    }
    
    func fetchOrders() {
        self.filteredOrders.removeAll()
        self.orders.removeAll()
        self.databaseReference
            .child("orders")
            .observe(.value, with: {
                snapshot in
//            })
//            .observeSingleEvent(of: .value, with: {
//                snapshot in
                self.filteredOrders.removeAll()
                self.orders.removeAll()
                if snapshot.hasChildren() {
                    guard let data = snapshot.value as? [String: Any] else {
                        Loaf("Could not parse data", state: .error, sender: self).show()
                        return
                    }
                    
                    for order in data {
                        if let orderInfo = order.value as? [String: Any] {
                            var singleOrder = Order(orderID: order.key,
                                                    cust_email: orderInfo["cust_email"] as! String,
                                                    cust_name: orderInfo["cust_name"] as! String,
                                                    date: orderInfo["date"] as! Double,
                                                    status_code: orderInfo["status_code"] as! Int)
                            if let orderItems = orderInfo["items"] as? [String: Any] {
                                for item in orderItems {
                                    if let singleItem = item.value as? [String: Any] {
                                        singleOrder.orderItems.append(
                                            OrderItem(item_name: singleItem["item_name"] as! String,
                                                      price: singleItem["price"] as! Double))
                                    }
                                }
                            }
                            
                            self.orders.append(singleOrder)
                        }
                    }
                    
                    self.filteredOrders.append(contentsOf: self.orders)
                    self.onSegChanged(self.segtabs)
                } else {
                    Loaf("No orders found", state: .error, sender: self).show()
                }
            })
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblOrders.dequeueReusableCell(withIdentifier: OrderTableViewCell.reuseIdentifier, for: indexPath) as! OrderTableViewCell
        cell.selectionStyle = .none
        cell.configXIB(order: filteredOrders[indexPath.row])
        return cell
    }
}
