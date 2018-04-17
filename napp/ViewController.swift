//
//  ViewController.swift
//  napp
//
//  Created by Jonah Rubin on 4/15/18.
//  Copyright © 2018 Jonah Rubin. All rights reserved.
//

import UIKit

extension UIColor {
    //static var babyBlue = UIColor(red: 51/255.0, green: 224/255.0, blue: 255/255.0, alpha: 1)
    static var babyBlue = UIColor(red: 147/255.0, green: 208/255.0, blue: 251/255.0, alpha: 1)

}

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
        textView.backgroundColor = .babyBlue
        textView.textColor = .white
        return textView
    }()
    
    // set up "previous" button
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // set up "next" button
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)

        return button
    }()
    
    // st up page indicator
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("Jonah was eaten by a whale")
        
        // add text
        view.addSubview(descriptionTextView)
        
        // do setup
        setupLayout()
        
        // set up bottom menu
        setupBottomControls()

    }
    
    // construct bottom menu
    func setupBottomControls() {
        
        // set up StackView array
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        
        // set array layout
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually

        // display
        view.addSubview(bottomControlsStackView)
        
        // set StackView constraints
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])

        
    }

    private func setupLayout() {
        // set background color
        view.backgroundColor = .babyBlue
        
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

