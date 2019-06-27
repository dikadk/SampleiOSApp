//
//  RationControl.swift
//  SampleApp
//
//  Created by Dmytro Kiro on 6/27/19.
//  Copyright © 2019 Dmytro Kiro. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    private var ratingButtons = [UIButton]()
    
    var rating = 0{
        didSet{
            updateButttonSelectionStates()
        }
    }

    override init(frame: CGRect) {
      super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = ratingButtons.firstIndex(of: button) else{
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        let selectedRating = index+1;
        if selectedRating == rating{
            rating = 0
        }
        else{
            rating = selectedRating
        }
    }
    
    private func updateButttonSelectionStates(){
        for(index, button) in ratingButtons.enumerated(){
            button.isSelected = index<rating
        }
    }
    
    private func setupButtons(){
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for _ in 0..<starCount {
            let button = UIButton()
        
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: startSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: startSize.width).isActive = true
        
            button.addTarget(self, action:
                #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
        
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
    }
    
    @IBInspectable var startSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet{
            setupButtons()
        }
    }
}


