//
//  CircleGraphTests.swift
//  CircleGraphTests
//
//  Created by Paul Geurts on 01/08/2019.
//  Copyright © 2019 Paul Geurts. All rights reserved.
//

import XCTest
@testable import CircleGraph

class CircleGraphTests: XCTestCase {
    
    let circleGraph = CircleGraph(frame: CGRect(x: 0, y: 0, width: 5, height: 5), strokeWidth: 2, passiveColor: UIColor.red, activeColor: UIColor.blue, reservedColor: UIColor.gray)

    func testCircleGraph() {
        XCTAssertEqual(circleGraph.activeColor, UIColor.blue, "Not equal")
        XCTAssertEqual(circleGraph.passiveColor, UIColor.red, "Not equal")
        XCTAssertEqual(circleGraph.reservedColor, UIColor.gray, "Not equal")
        XCTAssertEqual(circleGraph.frame, CGRect(x: 0, y: 0, width: 5, height: 5))
        XCTAssertEqual(circleGraph.strokeWidth, 2, "Not equal")
        XCTAssertEqual(circleGraph.radius, 1.5, "Not equal")
    }
    
    func testDrawTrackPath() {
        
    }
    
    func test() {
        circleGraph.drawTwoLayerArc(from: 0, to: 0.5, animationDuration: 2.0)
    }

}
