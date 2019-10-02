//
//  ViewController.swift
//  CircleGraphExample
//
//  Created by Paul Geurts on 01/08/2019.
//  Copyright © 2019 Paul Geurts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //TO DO:
    // Update readme with screenshots

    @IBOutlet weak var singleArcGraphContainer: UIView!
    @IBOutlet weak var doubleArcGraphContainer: UIView!
    @IBOutlet weak var tripleArcGraphContainer: UIView!
    @IBOutlet weak var reloadButton: UIButton!
    
    var trackPathGraph: CircleGraph!
    var singleArcAnimatedGraph: CircleGraph!
    var doubleArcAnimatedGraph: CircleGraph!
    
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
        trackPathGraph = CircleGraph(frame: singleArcGraphContainer.bounds, strokeWidth: 5, passiveColor: UIColor.lightGray, activeColor: UIColor.lightGray, inBetweenColor: UIColor.lightGray)
        singleArcAnimatedGraph = CircleGraph(frame: doubleArcGraphContainer.bounds, strokeWidth: 15, passiveColor: Color.eggBlue, activeColor: Color.lightGreenishBlue, inBetweenColor: UIColor.lightGray)
        doubleArcAnimatedGraph = CircleGraph(frame: tripleArcGraphContainer.bounds, strokeWidth: 20, passiveColor: Color.cityLights, activeColor: Color.pinkGlamour, inBetweenColor: Color.fadedPoster)
        
        clearBackgrounds()
        addGraphSubviewsToContainers()
    }
    
    private func drawGraphs() {
        trackPathGraph.drawTrackPath()
        singleArcAnimatedGraph.drawTwoLayerArc(from: 0, to: 0.5, animationDuration: 0.75, animationType: .easeOut)
        doubleArcAnimatedGraph.drawThreeLayerArc(from: 0.8, to: 0.6, inBetween: 0.4, animationDuration: 1.5, animationType: .easeInEaseOut)
    }
    
    private func highlightBorder() {
        reloadButton.layer.borderColor = self.view.tintColor.cgColor
    }
    
    @objc private func unhighlightBorder() {
        reloadButton.layer.borderColor = UIColor(displayP3Red: 210/255, green: 228/255, blue: 253/255, alpha: 1).cgColor
    }
    
    private func cleanupLayersForReload() {
        
        if var trackPathSublayersCount = trackPathGraph.layer.sublayers?.count {
            
            while trackPathSublayersCount > 1 {
                trackPathGraph.layer.sublayers?.removeLast()
                trackPathSublayersCount -= 1
            }
        }
        
        if var singleArcAnimatedSublayersCount = singleArcAnimatedGraph.layer.sublayers?.count {
            
            while singleArcAnimatedSublayersCount > 1 {
                singleArcAnimatedGraph.layer.sublayers?.removeLast()
                singleArcAnimatedSublayersCount -= 1
            }
        }
        
        if var doubleArcAnimatedSublayersCount = doubleArcAnimatedGraph.layer.sublayers?.count {
            
            while doubleArcAnimatedSublayersCount > 1 {
                doubleArcAnimatedGraph.layer.sublayers?.removeLast()
                doubleArcAnimatedSublayersCount -= 1
            }
        }
    }
    
    private func clearBackgrounds() {
        singleArcGraphContainer.backgroundColor = UIColor.clear
        doubleArcGraphContainer.backgroundColor = UIColor.clear
        tripleArcGraphContainer.backgroundColor = UIColor.clear
    }
    
    private func addGraphSubviewsToContainers () {
        singleArcGraphContainer.addSubview(trackPathGraph)
        doubleArcGraphContainer.addSubview(singleArcAnimatedGraph)
        tripleArcGraphContainer.addSubview(doubleArcAnimatedGraph)
    }
    
}
