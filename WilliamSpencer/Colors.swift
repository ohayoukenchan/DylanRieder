//
//  Colors.swift
//  SpaceRunner
//
//  Created by Kenta Uemura on 2017/01/05.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import SpriteKit

class Colors {
    
    // RGB Colors
    class var background:Int        { return 0x000013 }
    class var dust:Int              { return 0x04f2de }
    class var engine:Int            { return 0x55f87e }
    class var bonus:Int             { return 0xb3ff01 }
    class var score:Int             { return 0xe6e7e8 }
    class var border:Int            { return 0x49b9ea }
    
    class func colorFromRGB(rgbvalue rgbValue: Int) -> SKColor {
        return SKColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: 1.0)
    }
}
