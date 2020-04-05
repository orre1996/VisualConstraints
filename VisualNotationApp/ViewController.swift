//
//  ViewController.swift
//  VisualNotationApp
//
//  Created by Oscar Berggren on 2020-04-04.
//  Copyright © 2020 Oscar Berggren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var blueView: UIView!
    var redView: UIView!
    var greenView: UIView!
    var yellowView: UIView!
    
    lazy var views: [String: UIView] = ["blueView": blueView, "redView": redView, "greenView": greenView, "yellowView": yellowView]
    
    var firstConstraints = [NSLayoutConstraint]()
    var secondConstraints = [NSLayoutConstraint]()
    var thirdConstraints = [NSLayoutConstraint]()
    var fourthConstraints = [NSLayoutConstraint]()
    
    lazy var allConstraints = [firstConstraints, secondConstraints, thirdConstraints, fourthConstraints]
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    let rectWidth: CGFloat = 40
    let rectHeight: CGFloat = 40
    let yBorderOffset: CGFloat = 50
    let xBorderOffset: CGFloat = 30
    let rectStretch: CGFloat = 20
    
    var constraintIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAllViews()
        setupViews()
        setupConstraint()
        activateNextConstraint()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    private func createView(backgroundColor: UIColor, viewRect: CGRect) -> UIView {
        let view = UIView(frame: viewRect)
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(blueView)
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(yellowView)
    }
    
    private func createAllViews() {
        blueView = createView(backgroundColor: .blue, viewRect: CGRect(x: xBorderOffset, y: yBorderOffset, width: rectWidth + rectStretch, height: rectHeight))
        redView = createView(backgroundColor: .red, viewRect: CGRect(x: xBorderOffset, y: screenHeight - rectHeight - yBorderOffset - rectStretch, width: rectWidth, height: rectHeight + rectStretch))
        greenView = createView(backgroundColor: .green, viewRect: CGRect(x: screenWidth - rectWidth - yBorderOffset, y: screenHeight - rectHeight - yBorderOffset, width: rectWidth + rectStretch, height: rectHeight))
        yellowView = createView(backgroundColor: .yellow, viewRect: CGRect(x: screenWidth - rectWidth - xBorderOffset, y: yBorderOffset, width: rectWidth, height: rectHeight + rectStretch))
    }
    
    private func setupConstraint() {
        let blueRedConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[blueView(40)]->=0-[redView(60)]-50-|", metrics: nil, views: views)
        let blueYellowConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[blueView(60)]->=0-[yellowView(40)]-30-|", metrics: nil, views: views)
        let redGreenConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[redView(40)]->=0-[greenView(60)]-30-|", metrics: nil, views: views)
        let yellowGreenConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[yellowView(60)]->=0-[greenView(40)]-50-|", metrics: nil, views: views)
        
        firstConstraints.append(contentsOf: blueRedConstraint)
        firstConstraints.append(contentsOf: blueYellowConstraint)
        firstConstraints.append(contentsOf: redGreenConstraint)
        firstConstraints.append(contentsOf: yellowGreenConstraint)
        
        let yellowBlueConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[yellowView(40)]->=0-[blueView(60)]-50-|", metrics: nil, views: views)
        let redBlueConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[blueView(40)]->=0-[redView(60)]-30-|", metrics: nil, views: views)
        let greenRedConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[greenView(60)]->=0-[redView(40)]-50-|", metrics: nil, views: views)
        let greenYellowConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[yellowView(60)]->=0-[greenView(40)]-30-|", metrics: nil, views: views)
        
        secondConstraints.append(contentsOf: yellowBlueConstraint)
        secondConstraints.append(contentsOf: redBlueConstraint)
        secondConstraints.append(contentsOf: greenRedConstraint)
        secondConstraints.append(contentsOf: greenYellowConstraint)
        
        let blueRedConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[redView(60)]->=0-[blueView(40)]-50-|", metrics: nil, views: views)
        let blueYellowConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[yellowView(40)]->=0-[blueView(60)]-30-|", metrics: nil, views: views)
        let redGreenConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[greenView(60)]->=0-[redView(40)]-30-|", metrics: nil, views: views)
        let yellowGreenConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[greenView(40)]->=0-[yellowView(60)]-50-|", metrics: nil, views: views)
        
        thirdConstraints.append(contentsOf: blueRedConstraint1)
        thirdConstraints.append(contentsOf: blueYellowConstraint1)
        thirdConstraints.append(contentsOf: redGreenConstraint1)
        thirdConstraints.append(contentsOf: yellowGreenConstraint1)
        
        let yellowBlueConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[blueView(60)]->=0-[yellowView(40)]-50-|", metrics: nil, views: views)
        let redBlueConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[redView(60)]->=0-[blueView(40)]-30-|", metrics: nil, views: views)
        let greenRedConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[redView(40)]->=0-[greenView(60)]-50-|", metrics: nil, views: views)
        let greenYellowConstraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[greenView(40)]->=0-[yellowView(60)]-30-|", metrics: nil, views: views)
        
        fourthConstraints.append(contentsOf: yellowBlueConstraint1)
        fourthConstraints.append(contentsOf: redBlueConstraint1)
        fourthConstraints.append(contentsOf: greenRedConstraint1)
        fourthConstraints.append(contentsOf: greenYellowConstraint1)
    }
    
    private func activateNextConstraint() {
        allConstraints.forEach({ constraintsArray in NSLayoutConstraint.deactivate(constraintsArray) })
        
        constraintIndex += 1
        if let _ = allConstraints[safely: constraintIndex] {
        } else {
            constraintIndex = 0
        }
        
        NSLayoutConstraint.activate(allConstraints[constraintIndex])
        nextAnimation()
    }
    
    private func nextAnimation() {
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.activateNextConstraint()
        })
    }
}

extension Array {
    subscript(safely index: Int) -> Element? {
        if index < count {
            return self[index]
        }
        return nil
    }
}
