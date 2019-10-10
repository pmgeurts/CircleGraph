//
//  AnimationExamplesViewController.swift
//  CircleGraphExample
//
//  Created by Paul Geurts on 02/10/2019.
//  Copyright © 2019 Paul Geurts. All rights reserved.
//

import Foundation
import UIKit

class AnimationExamplesViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    @IBOutlet weak var linearAnimatedGraphContainer: UIView!
    @IBOutlet weak var easeInAnimatedGraphContainer: UIView!
    @IBOutlet weak var easeOutAnimatedGraphContainer: UIView!
    @IBOutlet weak var easeInEaseOutAnimatedGraphContainer: UIView!
    @IBOutlet weak var reloadButton: UIButton!
    
    var linearAnimatedGraph: CircleGraph!
    var easeInEaseOutAnimatedGraph: CircleGraph!
    var easeInAnimatedGraph: CircleGraph!
    var easeOutAnimatedGraph: CircleGraph!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        setupGraphs()
        drawGraphs()
    }
    
    @objc private func reloadView() {

        highlightBorder()
        cleanupLayersForReload()
        drawGraphs()
    }

    private func setupButton() {
        reloadButton.layer.borderWidth = 1
        reloadButton.layer.borderColor = self.view.tintColor.cgColor
        reloadButton.layer.cornerRadius = 8.0
        reloadButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        reloadButton.addTarget(self, action: #selector(unhighlightBorder), for: .touchDown)
        reloadButton.addTarget(self, action: #selector(reloadView), for: .touchUpInside)
    }
    
    private func setupGraphs() {
        linearAnimatedGraph = CircleGraph(frame: linearAnimatedGraphContainer.bounds, strokeWidth: 4, passiveColor: Color.cityLights, activeColor: Color.pinkGlamour, inBetweenColor: Color.fadedPoster)
        easeInEaseOutAnimatedGraph = CircleGraph(frame: easeInEaseOutAnimatedGraphContainer.bounds, strokeWidth: 4, passiveColor: Color.cityLights, activeColor: Color.pinkGlamour, inBetweenColor: Color.fadedPoster)
        easeInAnimatedGraph = CircleGraph(frame: easeInAnimatedGraphContainer.bounds, strokeWidth: 4, passiveColor: Color.cityLights, activeColor: Color.pinkGlamour, inBetweenColor: Color.fadedPoster)
        easeOutAnimatedGraph = CircleGraph(frame: easeOutAnimatedGraphContainer.bounds, strokeWidth: 4, passiveColor: Color.cityLights, activeColor: Color.pinkGlamour, inBetweenColor: Color.fadedPoster)

        clearBackgrounds()
        addGraphSubviewsToContainers()
    }
    
    private func drawGraphs() {
        linearAnimatedGraph.drawThreeLayerArc(from: 0, to: 0.75, inBetween: 0.5, animationDuration: 1, animationType: .linear)
        easeInEaseOutAnimatedGraph.drawThreeLayerArc(from: 0, to: 0.75, inBetween: 0.5, animationDuration: 1, animationType: .easeInEaseOut)
        easeInAnimatedGraph.drawThreeLayerArc(from: 0, to: 0.75, inBetween: 0.5, animationDuration: 1, animationType: .easeIn)
        easeOutAnimatedGraph.drawThreeLayerArc(from: 0, to: 0.75, inBetween: 0.5, animationDuration: 1, animationType: .easeOut)
    }
    
    private func highlightBorder() {
        reloadButton.layer.borderColor = self.view.tintColor.cgColor
    }

    @objc private func unhighlightBorder() {
        reloadButton.layer.borderColor = Color.appleBlue.cgColor
    }
    
    private func cleanupLayersForReload() {
        
        if var linearPathSublayersCount = linearAnimatedGraph.layer.sublayers?.count {
            
            while linearPathSublayersCount > 1 {
                linearAnimatedGraph.layer.sublayers?.removeLast()
                linearPathSublayersCount -= 1
            }
        }
        
        if var easeInEaseOutAnimatedSublayersCount = easeInEaseOutAnimatedGraph.layer.sublayers?.count {
            
            while easeInEaseOutAnimatedSublayersCount > 1 {
                easeInEaseOutAnimatedGraph.layer.sublayers?.removeLast()
                easeInEaseOutAnimatedSublayersCount -= 1
            }
        }
        
        if var easeInAnimatedSublayersCount = easeInAnimatedGraph.layer.sublayers?.count {
            
            while easeInAnimatedSublayersCount > 1 {
                easeInAnimatedGraph.layer.sublayers?.removeLast()
                easeInAnimatedSublayersCount -= 1
            }
        }
        
        if var easeOutAnimatedSublayersCount = easeOutAnimatedGraph.layer.sublayers?.count {
            
            while easeOutAnimatedSublayersCount > 1 {
                easeOutAnimatedGraph.layer.sublayers?.removeLast()
                easeOutAnimatedSublayersCount -= 1
            }
        }
    }
    
    private func clearBackgrounds() {
        linearAnimatedGraphContainer.backgroundColor = UIColor.clear
        easeInEaseOutAnimatedGraphContainer.backgroundColor = UIColor.clear
        easeInAnimatedGraphContainer.backgroundColor = UIColor.clear
        easeOutAnimatedGraphContainer.backgroundColor = UIColor.clear
    }
  
    private func addGraphSubviewsToContainers () {
        linearAnimatedGraphContainer.addSubview(linearAnimatedGraph)
        easeInEaseOutAnimatedGraphContainer.addSubview(easeInEaseOutAnimatedGraph)
        easeInAnimatedGraphContainer.addSubview(easeInAnimatedGraph)
        easeOutAnimatedGraphContainer.addSubview(easeOutAnimatedGraph)
    }
    
}
