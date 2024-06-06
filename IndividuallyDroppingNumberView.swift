//
//  IndividuallyDroppingNumberView.swift
//  UIKitPlayground
//
//  Created by Minyoung Yoo on 6/6/24.
//

class IndividuallyDroppingNumberView: UIView {
    
    var valueToDisplay: Double
    var characterFontSize: CGFloat
    var isMonospaced: Bool
    var animationDurationOfEachCharacter: TimeInterval
    
    init(valueToDisplay: Double, characterFontSize: CGFloat, 
         isMonospaced: Bool, animationDurationOfEachCharacter: TimeInterval) {
        self.valueToDisplay = valueToDisplay
        self.characterFontSize = characterFontSize
        self.isMonospaced = isMonospaced
        self.animationDurationOfEachCharacter = animationDurationOfEachCharacter
        super.init(frame: .zero)
        
        setupCharactersAndPlay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCharactersAndPlay() {
        //remove all subviews if exists
        if !self.subviews.isEmpty {
            self.subviews.forEach { view in
                view.removeFromSuperview()
            }
        }
        
        //setup values
        let showingValue = self.valueToDisplay
        let valueCharacterArray = Array(showingValue.formatted())
        let reversedValueCharacterArray = valueCharacterArray.reversed() as [Character]
        
        //setup variables
        var trailingConstraintConstant: CGFloat = 0.0
        let individualLabelWidth: CGFloat = self.characterFontSize * 0.65
        var intervalDelay: CGFloat = 0.0
        
        //create UILabel for each character
        reversedValueCharacterArray.enumerated().forEach { index, item in
            let label = UILabel()
            
            //setup label's properties
            if isMonospaced {
                label.font = UIFont.monospacedSystemFont(ofSize: self.characterFontSize, weight: .regular)
            } else {
                label.font = UIFont.systemFont(ofSize: self.characterFontSize, weight: .regular)
            }
            label.textAlignment = .center
            label.text = String(item)
            label.clipsToBounds = true
            label.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(label)
            
            //autolayout label
            NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalToConstant: individualLabelWidth),
                label.heightAnchor.constraint(equalToConstant: label.font.pointSize + 10),
                label.trailingAnchor.constraint(equalTo: self.trailingAnchor, 
                                                constant: trailingConstraintConstant * -1),
                label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50)
            ])
            
            //set alpha
            label.alpha = 0.0
            
            //animate with delay
            DispatchQueue.main.asyncAfter(deadline: .now() + intervalDelay) { [weak self] in
                self?.translateYAnimation(target: label)
            }
            
            //update data for interval process
            intervalDelay += 0.05
            trailingConstraintConstant += individualLabelWidth
        }
    }
    
    private func translateYAnimation(target: UIView) {
        UIView.animate(withDuration: self.animationDurationOfEachCharacter) {
            target.transform = CGAffineTransform(translationX: 0, y: 50)
        }
        UIView.animate(withDuration: self.animationDurationOfEachCharacter) {
            target.alpha = 1.0
        }
    }
    
}
