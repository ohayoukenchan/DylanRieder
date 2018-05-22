//
//  TapArea.swift
//  WilliamSpencer
//
//  Created by Kenta Takano on 2017/03/29.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import UIKit

class TapArea: UIButton {

    // MARK: - Setup
    private func setup() {
        
        self.zPosition = -1.0
        
        particlesLarge = GameParticles.sharedInstance.createParticles(particles: .background)
        particlesMedium = GameParticles.sharedInstance.createParticles(particles: .background)
        particlesSmall = GameParticles.sharedInstance.createParticles(particles: .background)
        
        particlesLarge.particleScale = 1.0
        particlesMedium.particleScale = 0.5
        particlesSmall.particleScale = 0.25
        
        particlesArray.append(particlesLarge)
        particlesArray.append(particlesMedium)
        particlesArray.append(particlesSmall)
        
        for particles in particlesArray {
            self.addChild(particles)
        }
        
        stopBackground()
    }


}
