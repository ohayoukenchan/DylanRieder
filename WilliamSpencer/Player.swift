//
//  Player.swift
//  WilliamSpencer
//
//  Created by Kenta Uemura on 2017/03/10.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    // MARK: - Private class variables
    private var targetPosition = CGPoint()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.player)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
        //setupPhysics()
        self.name = "Player"
    }
    
    private func setup() {
        // Initial position is centered horizontally and 20% up the Y axis
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.2)
        
        targetPosition = self.position
    }
    
    private func setupPhysics() {
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width / 2, center: self.anchorPoint)
        self.physicsBody?.categoryBitMask = Contact.player
        self.physicsBody?.collisionBitMask = Contact.player
        self.physicsBody?.contactTestBitMask = Contact.meteor | Contact.star
    }

}
