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
        // enable autoLayout for eyeOpen image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // for landscape mode
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()

    let descriptionTextView: UITextView = {
        let textView = UITextView()
    
        // set up mutable text
        let attributedText = NSMutableAttributedString(string: "We help you nap.", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        
        // add text with alternate style
        attributedText.append(NSAttributedString(string: "\n\n\nThis will be the page where users set their alarms", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText

        // set up textview
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor(red: 51/255.0, green: 224/255.0, blue: 255/255.0, alpha: 1)
        textView.textColor = .white
        return textView
    }()
    
    // set up "previous" button
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.addSubview(eyeOpenView)
        view.addSubview(descriptionTextView)
        
        // add image constraints, set background color
        setupLayout()
        
        // set up bottom menu
        setupBottomControls()

    }
    
    // construct bottom menu
    func setupBottomControls() {
        view.addSubview(previousButton)
        previousButton.backgroundColor = .red
        
    }

    private func setupLayout() {
        // define background color
        let babyBlue: UIColor = UIColor(red: 51/255.0, green: 224/255.0, blue: 255/255.0, alpha: 1)
        view.backgroundColor = babyBlue
        
        // set up container
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        // define constraints for container
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        
        // add image to container
        topImageContainerView.addSubview(eyeOpenView)
        
        // define constraints for eyeOpen image
        NSLayoutConstraint.activate([
            eyeOpenView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            eyeOpenView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            eyeOpenView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6),
            eyeOpenView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.75)
        ])

        
        // define constraints for text
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 50),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}

