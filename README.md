# CircleGraph

## Introduction
In use of a circle graph in your project? This one's for you.

1. How to install CircleGraph
2. How to implement CircleGraph
- Programmatically
- Though the Interface builder
3. How to customize CircleGraph
4. Any questions?


![Farmers Market Finder Demo](demo/demo.gif)

## How to install CircleGraph
Wip...

## How to use CircleGraph
Wip...

### Programmatically:
- Instantiate graph: let doubleArcGraph = CircleGraph(frame: CGRect(x: 0, y: 0, width: 120, height: 120), strokeWidth: 15, passiveColor: UIColor.purple, activeColor: UIColor.magenta, inBetweenColor: UIColor.red)
- Add subview: self.view.addSubview(doubleArcGraph)
- Set translatesAutoresizingMaskIntoConstraints to false: doubleArcGraph.translatesAutoresizingMaskIntoConstraints = false
- Set anchors:  NSLayoutConstraint.activate([ ... ])
- Call method: doubleArcGraph.drawTwoLayerArc(from: 0, to: 0.5, animationDuration: 0.5, animationType: .linear)

### Interface builder:
- var threeArcGraph: CircleGraph!
- threeArcGraph = CircleGraph(frame: circleGraphContainer.bounds, strokeWidth: 20, passiveColor: UIColor.lightGray, activeColor: UIColor.red, inBetweenColor: UIColor.orange)
- circleGraphContainer.addSubview(threeArcGraph)
- threeArcGraph.drawThreeLayerArc(from: 0.75, to: 0.5, inBetween: 0.4, animationDuration: 1.5, animationType: .easeInEaseOut)

## How to customize CircleGraph

### Colors
Passive color: Background circle
Active color: First animated circle
Second active color: Circle between passive color and active color

### Direction
Automatically determenied based on input values:
- From value smaller than to value: Clockwise
- From value bigger than to value: Counter clockwise

### Animation
Duration of the animation can be specified in the drawing function


## Any questions?
Feel free to reach out!
