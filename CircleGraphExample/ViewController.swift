//
//  ViewController.swift
//  CircleGraphExample
//
//  Created by Paul Geurts on 01/08/2019.
//  Copyright © 2019 Paul Geurts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var circleGraphContainer: CircleGraph!
    @IBOutlet weak var circleGraphContainer: UIView!
    
    let singleArcGraph = CircleGraph(frame: CGRect(x: 0, y: 0, width: 80, height: 80), strokeWidth: 5, passiveColor: UIColor.gray, activeColor: UIColor.yellow, reservedColor: UIColor.red)
    let doubleArcGraph = CircleGraph(frame: CGRect(x: 0, y: 0, width: 120, height: 120), strokeWidth: 15, passiveColor: UIColor.red, activeColor: UIColor.blue, reservedColor: UIColor.green)
    let threeArcGraph = CircleGraph(frame: CGRect(x: 0, y: 0, width: 200, height: 200), strokeWidth: 30, passiveColor: UIColor.gray, activeColor: UIColor.blue, reservedColor: UIColor.green)
    
    var circleGraph: CircleGraph!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        circleGraph = CircleGraph(frame: circleGraphContainer.bounds, strokeWidth: 20, passiveColor: UIColor.lightGray, activeColor: UIColor.red, reservedColor: UIColor.orange)
        
        circleGraphContainer.addSubview(circleGraph)
        
//        circleGraph = CircleGraph(frame: circleGraphContainer.bounds, strokeWidth: 8, passiveColor: UIColor.gray, activeColor: UIColor.orange)
        
        self.view.addSubview(singleArcGraph)
        self.view.addSubview(doubleArcGraph)
        self.view.addSubview(threeArcGraph)
        singleArcGraph.translatesAutoresizingMaskIntoConstraints = false
        doubleArcGraph.translatesAutoresizingMaskIntoConstraints = false
        threeArcGraph.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            singleArcGraph.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            singleArcGraph.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 25),
            singleArcGraph.widthAnchor.constraint(equalToConstant: 80),
            singleArcGraph.heightAnchor.constraint(equalToConstant: 80)
            ])
        
        NSLayoutConstraint.activate([
            doubleArcGraph.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            doubleArcGraph.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            doubleArcGraph.widthAnchor.constraint(equalToConstant: 120),
            doubleArcGraph.heightAnchor.constraint(equalToConstant: 120)
            ])
        
        NSLayoutConstraint.activate([
            threeArcGraph.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            threeArcGraph.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            threeArcGraph.widthAnchor.constraint(equalToConstant: 200),
            threeArcGraph.heightAnchor.constraint(equalToConstant: 200)
            ])
        
        singleArcGraph.drawTrackPath()
        doubleArcGraph.drawTwoLayerArc(from: 0, to: 0.5, animationDuration: 2.0)
        threeArcGraph.drawThreeLayerArc(from: 0.75, to: 0.5, toto: 0.25, animationDuration: 3.0)
        circleGraph.drawThreeLayerArc(from: 0.75, to: 0.5, toto: 0.4, animationDuration: 3.0)
        
    }


}

//@IBOutlet weak var graphContainer: UIView!
//var graphView: CircleGraph!
//    graphView = CircleGraph(frame: graphContainer.bounds, strokeWidth: 40, passiveColor: UIContext.darkGrayColor, activeColor: UIContext.abnGreenColor)
//    graphContainer.addSubview(graphView)
