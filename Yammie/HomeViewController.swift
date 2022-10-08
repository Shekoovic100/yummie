//
//  HomeViewController.swift
//  Yammie
//
//  Created by sherif on 11/09/2022.
//

import UIKit
import ProgressHUD
class HomeViewController: UIViewController {
    
    
    //MARK:-Outlets : -
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionview: UICollectionView!
    
    var categories:[DishCategory] = [
        .init(id: "id1", name: "African Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Dish5", image: "https://picsum.photos/100/200")
    ]
    
    var popularDish :[Dish] = [

        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", calories: 2.4, description: "HevyEat to Eat in mid night to destory health in hospital HevyEat to Eat in mid night to destory health in hospital HevyEat to Eat in mid night to destory health in hospital "),
        .init(id: "id1", name: "Indomi", image: "https://picsum.photos/100/200", calories: 3.9, description: "Light"),
        .init(id: "id1", name: "Pizza", image: "https://picsum.photos/100/200", calories: 4.1, description: "Heavy"),
        .init(id: "id1", name: "slada", image: "https://picsum.photos/100/200", calories: 8.8, description: "Light")
    ]
    
    
    
    
    var special:[Dish] = [
        
        .init(id: "id1", name: "Fried Plaintain", image: "https://picsum.photos/100/200", calories: 4.1, description: "This is my Favourite"),
        .init(id: "id1", name: "Beans", image: "https://picsum.photos/100/200", calories: 8.8, description: "This is best ")
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
   
        registerCells()
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self](result) in
            switch result {
            case.success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.popularDish = allDishes.populars ?? []
                self?.special = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionview.reloadData()
            case.failure(let error):
                print("The eroor is :\(error.localizedDescription)")
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    
    //MARK:-Helper function
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        
        specialsCollectionview.register(UINib(nibName: DishLandScapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandScapeCollectionViewCell.identifier)
    }
    
}
extension HomeViewController : UICollectionViewDelegate ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView :
            
            return categories.count
            
        case popularCollectionView:
            
            return popularDish.count
        case specialsCollectionview :
            return special.count
        default:  return 0
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            
        case categoryCollectionView :
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
            
        case popularCollectionView :
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath)as! DishPortraitCollectionViewCell
            cell.setup(dishDetails: popularDish[indexPath.row])
            return cell
            
            
        case specialsCollectionview:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: DishLandScapeCollectionViewCell.identifier, for: indexPath)as! DishLandScapeCollectionViewCell
            cell.setup(dishLandscape: special[indexPath.row])
            return cell
            
        default: return  UICollectionViewCell()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiateVC()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else {
            let controller = DishDetailViewController.instantiateVC()
         //   controller.dish = popularDish[indexPath.row]
            
            //using ternary Operator :
            controller.dish = collectionView == popularCollectionView ? popularDish[indexPath.row]:special[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
