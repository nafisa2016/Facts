//
//  ViewController.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import UIKit

protocol UpdateDetailData : class {
    func updateDetailTitle()
    func updateDetailDesc()
}

class DetailViewController: UIViewController {
    
    //MARK:- declarations
    lazy var detailDataViewModel = DetailDataViewModel()
    
    var img : UIImage?  
    var titleName = ""
    var desc  = ""
    
    @IBOutlet weak var dtlImgView: UIImageView!
    @IBOutlet weak var dtlDescLbl: UILabel!
    
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
        detailDataViewModel.setRowDescription(desc: desc)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension DetailViewController : UpdateDetailData  {
    
    //MARK:- update detail title
    func updateDetailTitle() {
        
        self.navigationItem.title = detailDataViewModel.getRowTitle()
       // self.navigationItem.largeTitleDisplayMode
        
    }
    
    //MARK:- update detail desc
    func updateDetailDesc() {
        dtlDescLbl.text = detailDataViewModel.getRowDescription()
    }
}
