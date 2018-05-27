//
//  ViewController.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import UIKit

//MARK:- protocol declaration for updating detailed view from view model
protocol UpdateDetailData : class {
    func updateDetailTitle()
    func updateDetailImg()
    func updateDetailDesc()
}

class DetailViewController: UIViewController {
    
    //MARK:- declarations
    lazy var detailDataViewModel = DetailDataViewModel()
    
    var imgLink = ""
    var titleName = ""
    var desc  = ""
    
    @IBOutlet weak var dtlImgView: UIImageView!
    @IBOutlet weak var dtlDescLbl: UILabel!
    
    @IBOutlet weak var lblBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        detailDataViewModel.delegate = self
    }
    
    //MARK:- //pass data sent via segue to model
    override func viewWillAppear(_ animated: Bool) {
        addToViewModel() 
    }
    
    //MARK:- add passed data to view model
    func addToViewModel() {
        detailDataViewModel.setRowTitle(title: titleName)
        detailDataViewModel.setRowImgHref(link: imgLink)
        detailDataViewModel.setRowDescription(desc: desc)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK:- conform detail view controller to UpdateDetailData protocol
extension DetailViewController : UpdateDetailData  {
    
    //MARK:- update detail title
    func updateDetailTitle() {
        self.navigationItem.title = detailDataViewModel.getRowTitle()
    }
    
    //MARK:- update image
    func updateDetailImg() {
        
        if !imgLink.isEmpty {
            dtlImgView.isHidden = false
             dtlImgView.getImage(contentMode: .scaleAspectFit, url: detailDataViewModel.getRowImgHref())
            
        } else {
            
            dtlImgView.image = nil
            dtlImgView.isHidden = true
            lblBottomConstraint.constant = self.view.bounds.height / 2
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    //MARK:- update detail desc
    func updateDetailDesc() {
        dtlDescLbl.text = detailDataViewModel.getRowDescription()
    }
}
