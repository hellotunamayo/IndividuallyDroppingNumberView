//
//  IndividuallyDroppingNumberViewController.swift
//  UIKitPlayground
//
//  Created by Minyoung Yoo on 6/6/24.
//

import UIKit

class IndividuallyDroppingNumberViewController: UIViewController {
    
    var currencyLabelSet = IndividuallyDroppingNumberView(valueToDisplay: Double.random(in: -100000.0...100000.0),
                                                          characterFontSize: 34.0, 
                                                          isMonospaced: true,
                                                          animationDurationOfEachCharacter: 0.2)
    let restartButton: UIButton = {
        let btn = UIButton()
        btn.configuration = .borderedProminent()
        btn.configuration?.title = "Randomize"
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.addTarget(self, action: #selector(restartAnimation), for: .touchUpInside)
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        currencyLabelSet.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(currencyLabelSet)
        self.view.addSubview(restartButton)
        
        NSLayoutConstraint.activate([
            currencyLabelSet.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            currencyLabelSet.heightAnchor.constraint(equalToConstant: 40),
            currencyLabelSet.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            currencyLabelSet.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            restartButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            restartButton.topAnchor.constraint(equalTo: currencyLabelSet.bottomAnchor, constant: 40)
        ])
    }
    
    @objc func restartAnimation() {
        self.currencyLabelSet.valueToDisplay = Double.random(in: -100000.0...100000.0)
        self.currencyLabelSet.setupCharactersAndPlay()
    }
}
