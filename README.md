# IndividuallyDroppingNumberView

## What is this?
![Animated Gif](https://github.com/hellotunamayo/IndividuallyDroppingNumberView/blob/main/IndividuallyDroppingNumberView.gif)

## Usage
```swift
var currencyLabelSet = IndividuallyDroppingNumberView(valueToDisplay: 0,
                                                          characterFontSize: 34.0,
                                                          isMonospaced: true,
                                                          animationDurationOfEachCharacter: 0.2)

currencyLabelSet.valueToDisplay = Double.random(in: -100000.0...100000.0)
currencyLabelSet.setupCharactersAndPlay()
```
