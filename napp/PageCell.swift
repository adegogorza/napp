//
//  PageCell.swift
//  napp
//
//  Created by Jonah Rubin on 4/16/18.
//  Copyright © 2018 Jonah Rubin. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        // set background color
        backgroundColor = .babyBlue
        
        // set up container
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        // define constraints for container
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
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
        
        
        addSubview(descriptionTextView)
        // define constraints for text
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 50),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
