//
//  ListDishesViewController.swift
//  Yammie
//
//  Created by sherif on 13/09/2022.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

    
    @IBOutlet weak var listDishesTableView: UITableView!
    var category:DishCategory!
    var dishes:[Dish] = [
    
        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", calories: 2.4, description: "HevyEat to Eat in mid night to destory health in hospital HevyEat to Eat in mid night to destory health in hospital HevyEat to Eat in mid night to destory health in hospital "),
        .init(id: "id1", name: "Indomi", image: "https://picsum.photos/100/200", calories: 3.9, description: "Light"),
        .init(id: "id1", name: "Pizza", image: "https://picsum.photos/100/200", calories: 4.1, description: "Heavy"),
        .init(id: "id1", name: "slada", image: "https://picsum.photos/100/200", calories: 8.8, description: "Light")
        
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        self.title = category.name
        
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") {[weak self] (result) in
            switch result{
            case.success(let dishes):
                
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.listDishesTableView.reloadData()
                
            case.failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells(){
        
        listDishesTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
 
}

extension ListDishesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dishes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath)as!DishListTableViewCell
        
        cell.setup(dish: dishes[indexPath.row])
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let controller = DishDetailViewController.instantiateVC()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }

}

