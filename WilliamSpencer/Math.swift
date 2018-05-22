//
//  Math.swift
//  SpaceRunner
//
//  Created by Kenta Uemura on 2017/01/06.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import SpriteKit

func DegreesToRadians(degrees: CGFloat) -> CGFloat {
    return degrees * CGFloat(Double.pi) / 180.0
}

func RadiansToDegrees(radians: CGFloat) -> CGFloat {
    return radians * 180.0 / CGFloat(Double.pi)
}

func Smooth(startPoint: CGFloat, endPoint: CGFloat, percentToMove: CGFloat) -> CGFloat {
    return (startPoint * (1 - percentToMove)) + endPoint * percentToMove
}

func AngleBetweenPoints(targetPosition: CGPoint, currentPosition: CGPoint) -> CGFloat {
    let deltaX = targetPosition.x - currentPosition.x
    let deltaY = targetPosition.y - currentPosition.y
    
    return CGFloat(atan2(Float(deltaY), Float(deltaX))) - DegreesToRadians(degrees: 90)
}

func DistanceBetweenPoints(firstPoint: CGPoint, secondPoint: CGPoint) -> CGFloat {
    return CGFloat(hypotf(Float(secondPoint.x - firstPoint.x), Float(secondPoint.y - firstPoint.y)))
}

func Clamp(value: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
    
    var newMin = min
    var newMax = max
    
    if (min > max) {
        newMin = max
        newMax = min
    }
    
    return value < newMin ? newMin : value < newMax ? value : newMax
}

func RandomIntegerBetween(min: Int, max: Int) -> Int {
    return Int(UInt32(min) + arc4random_uniform(UInt32(max - min + 1)))
}

func RandomFloatRange(min: CGFloat, max: CGFloat) -> CGFloat {
    return CGFloat(Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
}
