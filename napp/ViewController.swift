//
//  ViewController.swift
//  napp
//
//  Created by Jonah Rubin on 4/15/18.
//  Copyright © 2018 Jonah Rubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eyeOpenView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "eyeOpen"))
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .blue
        view.backgroundColor = UIColor(red: 51/255.0, green: 224/255.0, blue: 255/255.0, alpha: 1)

        view.addSubview(eyeOpenView)

        // enable autoLayout for imageView
        eyeOpenView.translatesAutoresizingMaskIntoConstraints = false
        eyeOpenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        eyeOpenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        eyeOpenView.widthAnchor.constraint(equalToConstant:  300).isActive = true
        eyeOpenView.heightAnchor.constraint(equalToConstant :  200).isActive = true
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

