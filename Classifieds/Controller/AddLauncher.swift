//
//  SettingsLauncher.swift
//  Classifieds
//
//  Created by Joe Nguyen on 10/6/18.
//  Copyright © 2018 Joe Nguyen. All rights reserved.
//

import UIKit

class AddLauncher: NSObject{
    
    
    let blackView = UIView()
    let height: CGFloat = 200

    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    func showAddOptions(){
        
        if let window = UIApplication.shared.keyWindow{
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBlackViewDismiss)))
            window.addSubview(blackView)
            let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: self.height)
            window.addSubview(collectionView)
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: self.height)
            })
        }
        print("tapped")
    }
    
    @objc func handleBlackViewDismiss(){
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: self.height)
            }

        })
    }
    
    override init() {
        super.init()
        //start doing something here
    }
}
