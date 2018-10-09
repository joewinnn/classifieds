//
//  AddLayoverView.swift
//  Classifieds
//
//  Created by Joe Nguyen on 10/8/18.
//  Copyright © 2018 Joe Nguyen. All rights reserved.
//

import UIKit

class AddLayoverView: UIView {
    
    let header = UILabel()
    let titleLabel = UILabel()
    let titleTextField = UITextField()
    let priceLabel = UILabel()
    let priceTextField = UITextField()
    let categoryLabel = UILabel()
    let categoryDropdown = UIPickerView()
    let descriptionLabel = UILabel()
    let descriptionTextField = UITextField()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCommon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCommon()
    }
    
    func initCommon(){
        self.backgroundColor = UIColor.white
        self.addSubview(header)
        self.addSubview(titleLabel)
        self.addSubview(titleTextField)
        self.addSubview(priceLabel)
        self.addSubview(priceTextField)
        self.addSubview(categoryLabel)
        self.addSubview(categoryDropdown)
        self.addSubview(descriptionLabel)
        self.addSubview(descriptionTextField)
        setupValues()
    }
    
    func setupLayout(){
        header.translatesAutoresizingMaskIntoConstraints = false
        //header.backgroundColor = UIColor.black
        header.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        header.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        header.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        header.heightAnchor.constraint(equalToConstant: 20).isActive = true
        

    }
    
    func setupValues(){
        header.text = "Add Classified Ad"
        header.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.text = "Title"
        titleTextField.attributedPlaceholder = NSAttributedString(string: "Enter Title", attributes: [kCTForegroundColorAttributeName as NSAttributedString.Key   : UIColor.gray])
        priceLabel.text = "Price"
        priceTextField.attributedPlaceholder = NSAttributedString(string: "Enter Price", attributes: [kCTForegroundColorAttributeName as NSAttributedString.Key   : UIColor.gray])
        categoryLabel.text = "Category"
        //TODO: category dropdown
        
        
        descriptionLabel.text = "Description"
        descriptionTextField.attributedPlaceholder = NSAttributedString(string: "Enter Additional Details", attributes: [kCTForegroundColorAttributeName as NSAttributedString.Key   : UIColor.gray])
    }

}
