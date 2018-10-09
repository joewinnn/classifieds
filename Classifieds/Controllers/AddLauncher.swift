//
//  AddLauncher.swift
//  Classifieds
//
//  Created by Joe Nguyen on 10/6/18.
//  Copyright © 2018 Joe Nguyen. All rights reserved.
//

import UIKit

class AddLancher: NSObject {
    
    var mapViewController: MapViewController?
    let blackView = UIView()
    
    let height: CGFloat = 200
    
//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = UIColor.white
//        return cv
//    }()
    
//    let addView: UIView = {
//        let v = UIView(frame: .zero)
//        v.backgroundColor = UIColor.white
//        return v
//    }()
    
    let addView = AddLayoverView(frame: .zero)
    
    func setupAddView(){
        
        let headerLabel: UILabel = {
            let label = UILabel()
            //enables autolayout for imageView
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        
        headerLabel.backgroundColor = UIColor.black
        
        self.addView.addSubview(headerLabel)
        
       
        //must activate
        headerLabel.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: addView.topAnchor, constant: 10).isActive = true
        headerLabel.widthAnchor.constraint(equalToConstant: addView.frame.width).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func showAddSettings(){
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            
            window.addSubview(addView)
            
            let y = window.frame.height - window.frame.height/2
            addView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height/3)
//            UIView.animate(withDuration: 0.5) {
//                self.blackView.alpha = 1
//                self.collectionView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: self.height)
//            }
//            setupAddView()
            addView.setupLayout()
            UIView.animate(withDuration:0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity:1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.addView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: window.frame.height/2)
            }, completion: nil)
        }
    }
    
    @objc func handleDismiss(){
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.addView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height/2)
            }
        })
    }
    
    override init() {
        super.init()
        
        //do addiitional things here
        
        
    }
}
