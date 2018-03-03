//
//  GameScene.swift
//  gameProj2
//
//  Created by Zach Albers on 2017-10-07.
//  Copyright © 2017 Zach Albers. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation

class GameScene: SKScene {
    

    
    let node = Vehicle(color: .green)
    
    let node2 = Vehicle(color: .blue)
    
    let circle = SKShapeNode(circleOfRadius: 40)
    
    let line = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 4, height: 30))
    
    var food = [Food]()
    var poison = [Food]()
    

    
    override func didMove(to view: SKView) {

        for _ in 1...30 {
            food.append(Food(color: .blue))
            poison.append(Food(color: .red))
        }
        for i in food {
            let x = CGFloat( (arc4random_uniform(600)) ) - 300
            let y = CGFloat( (arc4random_uniform(1200)) ) - 600
            i.position = CGPoint(x: x, y: y)
            self.addChild(i)
        }
        for i in poison {
            let x = CGFloat( (arc4random_uniform(600)) ) - 300
            let y = CGFloat( (arc4random_uniform(1200)) ) - 600
            i.position = CGPoint(x: x, y: y)
            self.addChild(i)
        }
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border

        node.position = CGPoint(x: frame.midX - 200, y: frame.midY)

        
        node2.position = CGPoint(x: 200, y: 500)
        node2.physicsBody?.isDynamic = false
        
        line.strokeColor = .red
        line.fillColor = .red
        
        
        self.addChild(node)
        self.addChild(node2)
        
        self.addChild(circle)
        self.addChild(line)
        

        
        
        
    }


    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
//        node.seek(target: node2)
        eat(vehicle: node, food_list: food, type: "food")
//        eat(vehicle: node, food_list: poison, type: "poison")
 //       print(node.physicsBody?.velocity as Any)
        updateCircle(circle: circle, vehicle: node)
        updateLine(line: line, vehicle: node)
        
    }
    
    
    
    func eat(vehicle: Vehicle, food_list: [Food], type: String) {
        var record: Double = 3000
        var closest = -1
        for i in 0..<(food_list.count) {
            let current_distance = calculate_distance(vehicle: vehicle, item: food_list[i])
            if current_distance < record {
                record = current_distance
                closest = i
                
            }
        }
        
        vehicle.seek(target: food_list[closest])
        if record < 20 {
            if type == "food" {
            food_list[closest].removeFromParent()
            food.remove(at: closest)
            } else {
                food_list[closest].removeFromParent()
                poison.remove(at: closest)
            }
            
            
        }
    }
    
    func calculate_distance(vehicle: Vehicle, item: Food) -> Double {
        let dx = item.position.x - vehicle.position.x
        let dy = item.position.y - vehicle.position.y
        let dx_d = Double(dx*dx)
        let dy_d = Double(dy*dy)
        return sqrt(dx_d + dy_d)
        
    }
    
    
    func updateCircle(circle: SKShapeNode, vehicle: Vehicle) {
        circle.position = vehicle.position
    }
    
    func updateLine(line: SKShapeNode, vehicle: Vehicle) {
        line.position = vehicle.position
    }
    
}








