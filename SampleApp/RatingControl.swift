//
//  RationControl.swift
//  SampleApp
//
//  Created by Dmytro Kiro on 6/27/19.
//  Copyright © 2019 Dmytro Kiro. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    override init(frame: CGRect) {
      super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    func ratingButtonTapped(button: UIButton){
        print("Button pressed ")
    }
    
    private func setupButtons(){
        let button = UIButton()
        button.backgroundColor = UIColor.red;
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        button.addTarget(self, action:
            #selector(rationButtonTapped(button:)), for: .touchUpInside)
        
        addArrangedSubview(button)
    }
}
