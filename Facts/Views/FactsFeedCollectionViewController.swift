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
    
    @IBOutlet weak var refreshBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- set flow layout estimated size for dynamic cell sizing
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        if #available(iOS 10.0, *) {
            layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        } else {
            layout.estimatedItemSize = CGSize(width: 1.0, height: 1.0)
        }
        self.collectionView?.collectionViewLayout = layout
        
        //MARK:- load data
        if let collectionView = self.collectionView {
            //get facts feed
            loadData()
            
            //refresh control
            if #available(iOS 10.0, *) {
                
                let refreshController:UIRefreshControl = UIRefreshControl()
                
                refreshController.attributedTitle = NSAttributedString(string: "Pull to refresh",attributes:nil )
                refreshController.tintColor = UIColor.blue
                refreshController.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
                collectionView.alwaysBounceVertical = true
                collectionView.refreshControl = refreshController
                collectionView.addSubview(refreshController)
                
                refreshBtn.isEnabled = false
                refreshBtn.tintColor = UIColor.clear
                
            } else {
                refreshBtn.isEnabled = true
            }
        }
        
    }
    
    //MARK:- load data
    func loadData() {
        //get facts feed
        factsFeedViewModel.getFactsFeed{ [weak self] in
            
            if let weakSelf = self {
                weakSelf.setNavTitle(navTitle: weakSelf.factsFeedViewModel.getNavBarTitle())
                weakSelf.collectionView?.collectionViewLayout.invalidateLayout()
                weakSelf.collectionView?.reloadData()
            }
        }
    }
    
    //MARK:- refresh data
    @objc func refresh() {
        
        //load data
        loadData()
        
        //end refresh control
        if #available(iOS 10.0, *) { collectionView?.refreshControl?.endRefreshing()
        }
    }
    
    
    //MARK:- press button to refresh data for versions previous to ios 10
    @IBAction func refreshBtnPressed(_ sender: UIBarButtonItem) {
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "show"
        {
            if let destinationVC = segue.destination as? DetailViewController {
                let cell = sender as! UICollectionViewCell
                let index = collectionView?.indexPath(for: cell)
                
                if let indexPath = index?.item {
                    
                    destinationVC.imgLink = factsFeedViewModel.getCellImgHref(index: indexPath)
                    destinationVC.titleName = factsFeedViewModel.getCellTitle(index: indexPath)
                    destinationVC.desc = factsFeedViewModel.getCellDescription(index: indexPath)
                }
                
            }
        }
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
            collectionView.reloadSections(IndexSet(integer: 0))
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
        return 30.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30.0
    }
}
