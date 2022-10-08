//
//  ListOrdersViewController.swift
//  Yammie
//
//  Created by sherif on 13/09/2022.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var orderTableView: UITableView!
    
    var orders:[Orders] = [
    
    .init(id: "id1", name: "Sherif Samy", dish: .init(id: "id1", name: "Meat Grilled", image: "https://picsum.photos/100/200", calories: 4.1, description: "This is my Favourite")),
    .init(id: "id2", name: "Ayman Samy", dish:  .init(id: "id1", name: "Beans and stew", image: "https://picsum.photos/100/200", calories: 8.8, description: "Squezzed beans with stew and girlled for 30minutes  Squezzed beans with stew and girlled for 30minutes ")),
    .init(id: "id3", name: "Mohamed Samy", dish:  .init(id: "id1", name: "Freied Chicken", image: "https://picsum.photos/100/200", calories: 8.8, description: "This is best From Chefs choices This is best From Chefs choices This is best From Chefs choices")),
    .init(id: "id3", name: "Mohamed Kamal", dish:  .init(id: "id1", name: "Kebda We Makrona", image: "https://picsum.photos/100/200", calories: 8.8, description: "This Meal wondrful because kebda is best This Meal wondrful This Meal wondrful "))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        ProgressHUD.show()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkService.shared.fetchOrders { [weak self](Result) in
            switch Result{
            case.success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.orderTableView.reloadData()
            case.failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
    
    private func registerCells() {
        
        orderTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}
extension ListOrdersViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath)as! DishListTableViewCell
        
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DishDetailViewController.instantiateVC()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
}
