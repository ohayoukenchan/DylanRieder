//
//  GameSettings.swift
//  WilliamSpencer
//
//  Created by Kenta Uemura on 2017/02/13.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import SpriteKit

class GameSettings {
    
    static let sharedInstance = GameSettings()
    
    // MARK: - Private class constants
    private let defaults = UserDefaults.standard
    private let keyFirstRun = "FirstRun"
    private let keyBestScore = "BestScore"
    private let keyBestStars = "BestStars"
    private let keyBestStreak = "BestStreaks"
    
    // MARK: - Init
    init() {
        if defaults.object(forKey: keyFirstRun) == nil {
            firstLaunch()
        }
    }
    
    // MARK: - Private methods
    private func firstLaunch() {
        defaults.set(0, forKey: keyBestScore)
        defaults.set(0, forKey: keyBestStars)
        defaults.set(0, forKey: keyBestStreak)
        defaults.set(false, forKey: keyFirstRun)
        
        defaults.synchronize()
    }
    
    // MARK: - Public Saving methods
    func saveBestScore(score: Int) {
        defaults.set(score, forKey: keyBestScore)
        
        defaults.synchronize()
    }
    
    func saveBestStars(stars: Int) {
        defaults.set(stars, forKey: keyBestStars)
        
        defaults.synchronize()
    }
    
    func saveBestStreak(streak: Int) {
        defaults.set(streak, forKey: keyBestStreak)
    
        defaults.synchronize()
    }
    
    //MARK: - Public retrieving methods
    func getBestScore() -> Int {
        return defaults.integer(forKey: keyBestScore)
    }
    
    func getBestStars() -> Int {
        return defaults.integer(forKey: keyBestStars)
    }
    
    func getBestStreak() -> Int {
        return defaults.integer(forKey: keyBestStreak)
    }

}
