//
//  GameViewController.swift
//  SpaceRunner
//
//  Created by Kenta Uemura on 2016/12/22.
//  Copyright © 2016年 Kenta Takano. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let view = self.view as! SKView? {
            if (view.scene == nil) {
                if kDebug {
                    view.showsFPS = true
                    view.showsNodeCount = true
                    view.showsDrawCount = true
                    view.showsPhysics = true
                }
                
                let scene = MenuScene(size: kViewSize)
                let transition = SKTransition.fade(with: SKColor.black, duration: 0.5)
                
                view.presentScene(scene, transition: transition)
            }
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
