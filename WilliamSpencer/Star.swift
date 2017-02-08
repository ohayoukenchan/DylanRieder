//
//  Star.swift
//  SpaceRunner
//
//  Created by Kenta Uemura on 2017/01/30.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import SpriteKit

class Star: SKSpriteNode {
    
    // MARK: - Public class variable
    var drift = CGFloat()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.star)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        setupPhysics()
        
        self.name = "Star"
    }
    
    private func setupPhysics() {
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width / 2, center: self.anchorPoint)
        self.physicsBody?.categoryBitMask = Contact.star
        self.physicsBody?.collisionBitMask = 0x0
        self.physicsBody?.contactTestBitMask = 0x0
    }
    
    // MARK - Update
    func update(delta: TimeInterval) {
        
        self.position.y = self.position.y - CGFloat(delta * 60 * 2)
        
        self.position.x = self.position.x - self.drift
        
        // Remove from parent if off the bottom of the screen
        if self.position.y < (0 - self.size.height) {
            self.removeFromParent()
        }
        
        // Remove from parent if off the screen to the left or right
        if self.position.x < (0 - self.size.width) || self.position.x > (kViewSize.width + self.size.width) {
            self.removeFromParent()
        }
        
        // Rotate slowly while moving down the screen
        self.zRotation = self.zRotation + CGFloat(delta)
        
    }
    
    // MARK - COntact
    func contact() {
        self.removeFromParent()
    }
    
}
