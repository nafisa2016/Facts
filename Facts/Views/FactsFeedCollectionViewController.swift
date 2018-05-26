//
//  FactsFeedCollectionViewController.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FactsFeedCollectionViewController: UICollectionViewController {
    
    //MARK:- declarations
    lazy var factsFeedViewModel = FactsFeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- set flow layout estimated size for dynamic cell sizing
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        if #available(iOS 10.0, *) {
            layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        } else {
            layout.estimatedItemSize = CGSize(width: (self.collectionView?.bounds.width)!, height: 250)
        }
        self.collectionView?.collectionViewLayout = layout
        
        //MARK:- load data
        if let collectionView = self.collectionView {
            //get facts feed
            factsFeedViewModel.getFactsFeed{ [weak self] in
                
                if let weakSelf = self {
                    weakSelf.setNavTitle(navTitle: weakSelf.factsFeedViewModel.getNavBarTitle())
                }
                collectionView.collectionViewLayout.invalidateLayout()
                collectionView.reloadData()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     //MARK: Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
        
        
     }
    
    
    //MARK:- UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return factsFeedViewModel.getNumOfSections()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return factsFeedViewModel.getNumOfItems()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FactsFeedCollectionViewCell {
            
            //configure cell
            cell.configure(rowTitle: factsFeedViewModel.getCellTitle(index: indexPath.item), rowImgLink: factsFeedViewModel.getCellImgHref(index: indexPath.item))
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            return cell
        }
        
    }
    
    //MARK:- set navBar title
    func setNavTitle(navTitle: String) {
        
        //MARK: large title
        if #available(iOS 11.0, *) {
            
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.topItem?.title = navTitle
            navigationController?.navigationItem.largeTitleDisplayMode = .automatic
            
        } else {
            
            navigationController?.navigationBar.topItem?.title = navTitle
        }
    }
    
}

//MARK:- conform to flow layout delegate
extension FactsFeedCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
