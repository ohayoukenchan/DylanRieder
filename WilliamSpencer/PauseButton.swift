//
//  PauseButton.swift
//  SpaceRunner
//
//  Created by Kenta Uemura on 2017/02/08.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import SpriteKit

class PauseButton: SKSpriteNode {
    
    // MARK: - Private class constants
    private let pauseTexture = GameTextures.sharedInstance.texture(name: SpriteName.pauseButton)
    private let resumeTexture = GameTextures.sharedInstance.texture(name: SpriteName.resumeButton)
    
    // MARK: - Private class variables
    private var gamePaused = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.pauseButton)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        // Put the anchorPoint in the top right corner of the sprite
        self.anchorPoint = CGPoint(x: 1.0, y: 1.0)
        
        // Position at top right corner of screen
        self.position = CGPoint(x: kViewSize.width, y: kViewSize.height)
    }
    
    // MARK: - Actions
    func tapped() {
        //Flip the value of gamePaused
        gamePaused = !gamePaused
        
        // Which texture should we use?
        self.texture = gamePaused ? resumeTexture : pauseTexture
    }
    
    func getPauseState() -> Bool {
        return gamePaused
    }

}
