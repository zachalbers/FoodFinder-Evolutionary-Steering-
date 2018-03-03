//
//  Food.swift
//  gameProj2
//
//  Created by Zach Albers on 2017-10-07.
//  Copyright © 2017 Zach Albers. All rights reserved.
//

import Foundation
import SpriteKit



class Food: SKSpriteNode {
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    convenience init(color: SKColor, length: CGFloat = 10) {
        let size = CGSize(width: 5, height: 5);
        self.init(texture:nil, color: color, size: size)
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: 5)
        self.physicsBody?.isDynamic = false
        
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
