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
    
    //Examples on how to setup CircleGraphs programmatically
//    let singleArcGraph = CircleGraph(frame: CGRect(x: 0, y: 0, width: 80, height: 80), strokeWidth: 5, passiveColor: UIColor.lightGray, activeColor: UIColor.yellow, inBetweenColor: UIColor.red)
//    let doubleArcGraph = CircleGraph(frame: CGRect(x: 0, y: 0, width: 120, height: 120), strokeWidth: 15, passiveColor: UIColor.purple, activeColor: UIColor.magenta, inBetweenColor: UIColor.red)
    
    var singleArcGraph: CircleGraph!
    var doubleArcGraph: CircleGraph!
    var tripleArcGraph: CircleGraph!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadButton.addTarget(self, action: #selector(self.reloadView), for: .touchUpInside)
        
        singleArcGraph = CircleGraph(frame: singleArcGraphContainer.bounds, strokeWidth: 5, passiveColor: UIColor.lightGray, activeColor: UIColor.yellow, inBetweenColor: UIColor.red)
        doubleArcGraph = CircleGraph(frame: doubleArcGraphContainer.bounds, strokeWidth: 15, passiveColor: UIColor.purple, activeColor: UIColor.magenta, inBetweenColor: UIColor.red)
        tripleArcGraph = CircleGraph(frame: tripleArcGraphContainer.bounds, strokeWidth: 20, passiveColor: UIColor.lightGray, activeColor: UIColor.red, inBetweenColor: UIColor.orange)
        
        singleArcGraphContainer.backgroundColor = UIColor.clear
        doubleArcGraphContainer.backgroundColor = UIColor.clear
        tripleArcGraphContainer.backgroundColor = UIColor.clear
        
        singleArcGraphContainer.addSubview(singleArcGraph)
        doubleArcGraphContainer.addSubview(doubleArcGraph)
        tripleArcGraphContainer.addSubview(tripleArcGraph)
        
        //Constraint functions
//        setupConstraintSingArcGraph()
//        setupConstraintsDoubleArc()
        
        //Draw functions
        drawCircles()
    }
    
//    private func setupConstraintSingArcGraph() {
//
//        self.view.addSubview(singleArcGraph)
//        singleArcGraph.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            singleArcGraph.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            singleArcGraph.topAnchor.constraint(equalTo: self.drawCircleLabel.bottomAnchor, constant: 16),
//            singleArcGraph.widthAnchor.constraint(equalToConstant: 80),
//            singleArcGraph.heightAnchor.constraint(equalToConstant: 80)
//            ])
//    }

//    private func setupConstraintsDoubleArc() {
//
//        self.view.addSubview(doubleArcGraph)
//        doubleArcGraph.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            doubleArcGraph.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            doubleArcGraph.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
//            doubleArcGraph.widthAnchor.constraint(equalToConstant: 120),
//            doubleArcGraph.heightAnchor.constraint(equalToConstant: 120)
//            ])
//    }
    
    private func drawCircles() {
        singleArcGraph.drawTrackPath()
        doubleArcGraph.drawTwoLayerArc(from: 0, to: 0.5, animationDuration: 0.5, animationType: .linear)
        tripleArcGraph.drawThreeLayerArc(from: 0.75, to: 0.5, inBetween: 0.4, animationDuration: 1.5, animationType: .easeInEaseOut)
    }
    
    @objc private func reloadView() {
        
        if var singleArcSublayersCount = singleArcGraph.layer.sublayers?.count {
            
            while singleArcSublayersCount > 1 {
                singleArcGraph.layer.sublayers?.removeLast()
                singleArcSublayersCount -= 1
            }
        }
        
        if var doubleArcSublayersCount = doubleArcGraph.layer.sublayers?.count {
            
            while doubleArcSublayersCount > 1 {
                doubleArcGraph.layer.sublayers?.removeLast()
                doubleArcSublayersCount -= 1
            }
        }
        
        if var tripleArcSublayersCount = tripleArcGraph.layer.sublayers?.count {
            
            while tripleArcSublayersCount > 1 {
                tripleArcGraph.layer.sublayers?.removeLast()
                tripleArcSublayersCount -= 1
            }
        }
        
        singleArcGraph.drawTrackPath()
        doubleArcGraph.drawTwoLayerArc(from: 0, to: 0.5, animationDuration: 0.5, animationType: .linear)
        tripleArcGraph.drawThreeLayerArc(from: 0.75, to: 0.5, inBetween: 0.4, animationDuration: 1.5, animationType: .easeInEaseOut)
    }
}
