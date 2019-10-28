# CircleGraph

![circleGraphsAnimated](https://user-images.githubusercontent.com/28221314/66121934-ada0ae80-e5de-11e9-9440-7a6454e0b215.gif)

## Table of Contents

1. [Introduction](#introduction)
2. [How to install CircleGraph](#how-to-install-circle-graph)
3. [How to use CircleGraph](#how-to-implement-circle-graph)
    - [Programmatically](#how-to-use-circle-graph-programmatically)
    - [Interface builder](#how-to-use-circle-graph-interface-builder)
4. [How to customize CircleGraph](#how-to-customize-circle-graph)
- [Colors](#how-to-customize-circle-graph-colors)
- [Direction](#how-to-customize-circle-graph-direction)
- [Animation](#how-to-customize-circle-graph-animation)
5. [Any questions](#any-questions)

## Introduction

If you are looking for a customizable circle graph to add to your project, you have come to the right place. This CircleGraph pods offers easy implementation with customizable parameters such as line width, size, color, multiple arcs and different animations (see some examples above). 



<img width="366" alt="circleGraphExplained" src="https://user-images.githubusercontent.com/28221314/66121933-ada0ae80-e5de-11e9-9851-f26bc8c62ad8.png">



<a name="how-to-install-circle-graph"></a>
## How to install CircleGraph

### Through CocoaPods

If you didn't use CocoaPods before, install it first.

```terminal
$ gem install cocoapods
$ pod setup
```

If you don't have a Podfile yet, navigate to your project file and run:

```terminal
pod init
```
If the Podfile is there, simply append the following line to your Podfile.

```terminal
pod 'CircleGraph', :git => 'https://github.com/pmgeurts/CircleGraph.git'
```
Then, run this command. 🎉

```
$ pod install
```
### Manually

Drag this file into your project.

CircleGrapph/CircleGraph.swift
And you can use CircleGraph. 🎉

<a name="how-to-use-circle-graph"></a>
## How to use CircleGraph

<a name="how-to-use-circle-graph-programmatically"></a>
### Programmatically:
Use this method if you purely want to use code to instantiate your Circle Graph:

```Swift

//Instantiate graph:
let doubleArcGraph = CircleGraph(frame: CGRect(x: 0, y: 0, width: 120, height: 120), strokeWidth: 15, passiveColor: UIColor.purple, activeColor: UIColor.magenta, inBetweenColor: UIColor.red)

//Add Subview:
let doubleArcGraph = CircleGraph(frame: CGRect(x: 0, y: 0, width: 120, height: 120), strokeWidth: 15, passiveColor: UIColor.purple, activeColor: UIColor.magenta, inBetweenColor: UIColor.red)

//Set anchors:
NSLayoutConstraint.activate([ ... ])

//Call the graph method:
doubleArcGraph.drawTwoLayerArc(from: 0, to: 0.5, animationDuration: 0.5, animationType: .linear)
```

<a name="how-to-use-circle-graph-interface-builder"></a>
### Interface builder:
Use this method if you define your Circle Graph container view in your XIB / Storyboard:

```Swift

//Setup your container view in your view file

//Create an outlet:
@IBOutlet weak var: circleGRaphContainr: UIView!

//Create graph object:
- var threeArcGraph: CircleGraph!

//Setup circle graph (the frame is taken from the container bounds):
threeArcGraph = CircleGraph(frame: circleGraphContainer.bounds, strokeWidth: 20, passiveColor: UIColor.lightGray, activeColor: UIColor.red, inBetweenColor: UIColor.orange)

//Add Subview:
- circleGraphContainer.addSubview(threeArcGraph)

//Call the graph method:
- threeArcGraph.drawThreeLayerArc(from: 0.75, to: 0.5, inBetween: 0.4, animationDuration: 1.5, animationType: .easeInEaseOut)
```

<a name="how-to-customize-circle-graph"></a>
## How to customize CircleGraph

<a name="how-to-customize-circle-graph-colors"></a>
### Colors
Passive color: Background circle
Active color: First animated circle
Second active color: Circle between passive color and active color

<a name="how-to-customize-circle-graph-direction"></a>
### Direction
Automatically determenied based on input values:
- From value smaller than to value: Clockwise
- From value bigger than to value: Counter clockwise

<a name="how-to-customize-circle-graph-animation"></a>
### Animation
Duration of the animation can be specified in the drawing function

<a name="any-questions"></a>
## Any questions?
Feel free to reach out! <pmgeurts@gmail.com>
