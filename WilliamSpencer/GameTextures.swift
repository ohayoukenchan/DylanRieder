//
//  GameTextures.swift
//  SpaceRunner
//
//  Created by Kenta Uemura on 2017/01/05.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import SpriteKit

class GameTextures {
    
    static let sharedInstance = GameTextures()
    
    // MARK: - Private class constants
    private let gameSprites = "GameSprites"
    private let interfaceSprites = "InterfaceSprites"
    
    // MARK: - Private class variables
    private var interfaceSpritesAtlas = SKTextureAtlas()
    private var gameSpritesAtlas = SKTextureAtlas()
    
    // MARK: - Init
    init() {
        self.interfaceSpritesAtlas = SKTextureAtlas(named: gameSprites)
        self.gameSpritesAtlas = SKTextureAtlas(named: interfaceSprites)
    }
    
    // MARK: - Public convenience methods
    func texture(name: String) -> SKTexture {
        return SKTexture(imageNamed: name)
    }
    
    func sprite(name: String) -> SKSpriteNode {
        return SKSpriteNode(imageNamed: name)
    }
}
