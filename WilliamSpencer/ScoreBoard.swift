//
//  ScoreBoard.swift
//  WilliamSpencer
//
//  Created by Kenta Uemura on 2017/02/24.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import SpriteKit

class ScoreBoard: SKNode {
    
    //MARK: - Private class constants
    private let fonts = GameFonts.sharedInstance
    
    //MARK: - Private class vars
    private var background = SKShapeNode()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
    }
    
    convenience init(score: Int, stars: Int, streak: Int) {
        self.init()
        
        setupBackground()
        setupLabels(score: score, stars: stars, streak: streak)
        animate()
    }
    
    // MARK: -
    private func setupBackground() {
        //Rectangle thea is 90% of the width and 25% of the height of the screen
        let backgroundRect = CGRect(x: 0, y: 0, width: kViewSize.width * 0.9, height: kViewSize.height * 0.25)
        
        // Make an SKShapeNode with a rect with arounded corner
        background = SKShapeNode(rect: backgroundRect, cornerRadius: 5.0)
        
        // give a background border stroke
        background.strokeColor = Colors.colorFromRGB(rgbvalue: Colors.border)
        background.lineWidth = 5.0
        
        // Position one full screen width off screen left and 35% up
        background.position = CGPoint(x: -kViewSize.width, y: kViewSize.height * 0.35)
        
        self.addChild(background)
    }
    
    private func setupLabels(score: Int, stars: Int, streak: Int) {
        // width and height convenience variables
        let frameWidth = background.frame.width
        let frameHeight = background.frame.height
        
        // get the recorded best from GameSettings
        let bestScore = GameSettings.sharedInstance.getBestScore()
        let bestStars = GameSettings.sharedInstance.getBestStars()
        let bestStreak = GameSettings.sharedInstance.getBestStreak()
        
        // labels
        let scoreLabel = fonts.createLabel(string: "Score", type: .label)
        let streakLabel = fonts.createLabel(string: "Streak", type: .label)
        let starsLabel = fonts.createLabel(string: "Stars", type: .label)
        
        let bestScoreLabel = fonts.createLabel(string: "best", type: .label)
        let bestStreakLabel = fonts.createLabel(string: "best", type: .label)
        let bestStarsLabel = fonts.createLabel(string: "best", type: .label)
        
        //scores
        let scoreValue = fonts.createLabel(string: String(score), type: .label)
        let bestScoreValue = fonts.createLabel(string: String(bestScore), type: .label)
        
        let streakValue = fonts.createLabel(string: String(streak), type: .label)
        let bestStreakValue = fonts.createLabel(string: String(bestStreak), type: .label)
        
        let starsValue = fonts.createLabel(string: String(stars), type: .label)
        let bestStarsValue = fonts.createLabel(string: String(bestStars), type: .label)
        
        // Positioning
        scoreLabel.position = CGPoint(x: frameWidth * 0.05, y: frameHeight * 0.75)
        scoreValue.position = CGPoint(x: frameWidth * 0.25, y: frameHeight * 0.75)
        
        bestScoreLabel.position = CGPoint(x: frameWidth * 0.5, y: frameHeight * 0.75)
        bestScoreValue.position = CGPoint(x: frameWidth * 0.7, y: frameHeight * 0.75)
        
        starsLabel.position = CGPoint(x: frameWidth * 0.05, y: frameHeight * 0.5)
        starsValue.position = CGPoint(x: frameWidth * 0.25, y: frameHeight * 0.5)
        
        bestStarsLabel.position = CGPoint(x: frameWidth * 0.5, y: frameHeight * 0.5)
        bestStarsValue.position = CGPoint(x: frameWidth * 0.7, y: frameHeight * 0.5)
        
        streakLabel.position = CGPoint(x: frameWidth * 0.05, y: frameHeight * 0.25)
        streakValue.position = CGPoint(x: frameWidth * 0.25, y: frameHeight * 0.25)
        
        bestStreakLabel.position = CGPoint(x: frameWidth * 0.5, y: frameHeight * 0.25)
        bestStreakValue.position = CGPoint(x: frameWidth * 0.7, y: frameHeight * 0.25)

        // Add to the background
        background.addChild(scoreLabel)
        background.addChild(scoreValue)
        
        background.addChild(bestScoreLabel)
        background.addChild(bestScoreValue)
        
        background.addChild(starsLabel)
        background.addChild(starsValue)
        
        background.addChild(bestStarsLabel)
        background.addChild(bestStarsValue)
        
        background.addChild(streakLabel)
        background.addChild(streakValue)
        
        background.addChild(bestStreakLabel)
        background.addChild(bestStreakValue)
        
    }
    
    // MARK: Animations
    private func animate() {
        background.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.05, y: kViewSize.height * 0.35), duration: 0.25))
    }
    
}
