//
//  RetryButton.swift
//  WilliamSpencer
//
//  Created by Kenta Uemura on 2017/02/24.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import SpriteKit

class RetryButton: SKSpriteNode {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.retryButton)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
        animate()
    }
    
    private func setup() {
        self.position = CGPoint(x: kViewSize.width / 2, y: 0 - kViewSize.height * 0.25)
    }
    
    //MARK: - Animations
    private func animate() {
        let moveIn = SKAction.move(to: CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.25), duration: 0.25)
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.125)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.125)
        
        self.run(SKAction.sequence([moveIn, scaleUp, scaleDown]))
    }
    
    //MARK: - Actions
    func tapped () {
    }

}
