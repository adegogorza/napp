//
//  SwipingController.swift
//  napp
//
//  Created by Jonah Rubin on 4/16/18.
//  Copyright © 2018 Jonah Rubin. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "eyeOpen", headerText: "This can be the feed", bodyText: "Profile, list of who isn't awake but should be"),
        Page(imageName: "eyeClosed", headerText: "This will be the page where users set their alarms", bodyText: "Big white clock in the center, scroll to change time, background color changes with it"),
        Page(imageName: "eyeOpen", headerText: "Not sure about this", bodyText: "I'll leave this here just in case"),
        Page(imageName: "eyeClosed", headerText: "This can be settings/ preferences", bodyText: "Account settings, UI preferences, etc.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true

    }
    
    // spacing between pages
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // number of pages
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    // deque and reuse
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        // go to index of name corrisponding to page number
        let page = pages[indexPath.item]

        cell.page = page
        
        return cell
    }
    
    // set page size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    

}
