//
//  OnboardingViewController.swift
//  Yammie
//
//  Created by sherif on 11/09/2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    //MARK:-Outlets:
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var ButoonOutlet: UIButton!
    
    
    //MARK:-Vars
    var slides : [OnBoardingSlide] = []
    var currentPage = 0{
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                ButoonOutlet.setTitle("Get Started", for: .normal)
            }else{
                ButoonOutlet.setTitle("Next", for: .normal)
            }
        }
    }
    
    //MARK:- APP LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSlider()
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        if currentPage == slides.count - 1 {
            guard let homeVC = else {return}
            homeVC.modalPresentationStyle = .fullScreen
            homeVC.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
                    present(homeVC, animated: true)
        }else{
            currentPage += 1
           let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
    }
    //MARK:- Helper Functions
    
    func setupSlider(){
        
        slides = [
            OnBoardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide3")),
            OnBoardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide2")),
            OnBoardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide1"))
               ]
    }
    
    
}

//MARK:-Extensions
extension OnboardingViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell  = collectionView.dequeueReusableCell(withReuseIdentifier:OnBoardingCollectionViewCell.identifier, for: indexPath)as! OnBoardingCollectionViewCell
         cell.setup(slides[indexPath.row])
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    // To adjust scroll when page control to be scrolled
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
}
