//
//  Contact.swift
//  SpaceRunner
//
//  Created by Kenta Uemura on 2017/01/27.
//  Copyright © 2017年 Kenta Takano. All rights reserved.
//

import Foundation

class Contact {
    class var player:UInt32 { return 1 << 0 }
    class var meteor:UInt32 { return 1 << 1 }
    class var star:UInt32 { return 1 << 2 }
}
