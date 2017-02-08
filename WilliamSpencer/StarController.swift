//
//  StarController.swift
//  SpaceRunner
//
//  Created by Kenta Uemura on 2017/01/30.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import SpriteKit

class StarController: SKNode {

    // MARK: - Private class constants
    private let star = Star()
    
    
    // MARK: - Private class variable
    private var frameCount = 0.0
    
    // MARK: - Spawn
    private func spawnStar() {
        let startX = RandomFloatRange(min: 0, max: kViewSize.width)
        let startY = kViewSize.height + 1.25
        
        let star = self.star.copy() as! Star
        star.position = CGPoint(x: startX, y: startY)
        star.drift = RandomFloatRange(min: -0.25, max: 0.25)
        self.addChild(star)
    }
    
    // MARK: - update
    func update(delta: TimeInterval) {
        self.frameCount += delta
        
        if self.frameCount >= 3.0 {
            // Spawn a star
            self.spawnStar()
        
            // Reset the frame counter
            self.frameCount = 0.0
        }
        
        for node in self.children {
            if let star = node as? Star {
                star.update(delta: delta)
            }
        }
    }
}
