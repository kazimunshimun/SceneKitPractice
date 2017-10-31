//
//  GameLevel.swift
//  CrossyDig
//
//  Created by Anik on 10/25/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

import Foundation
import SceneKit

protocol GameLevelSpawnDelegate: NSObjectProtocol {
    func spawnCarAtPosition(position: SCNVector3)
}

enum GameLevelDataType: Int {
    case Invalid = -1
    case Grass = 0
    case Road
    case Obstacle
}

class GameLevel: CustomStringConvertible {
    var spawnDelegate: GameLevelSpawnDelegate?
    
    var data: Array2D
    let segmentSize: Float = 0.2
    var maxObstaclesPerRow: Int = 3
    
    var description: String = "";
    
    init(width: Int, height: Int) {
        data = Array2D(cols: width, rows: height, value: GameLevelDataType.Obstacle.rawValue)
        // Create the level procedurally
        for row in 5...data.rowCount() - 6 {
            var type = GameLevelDataType.Invalid
            
            // Determine if this should be a grass (0) or road (1)
            if row < 8 || row > data.rowCount() - 10 {
                // The first and last four rows will be grass
                type = GameLevelDataType.Grass
            } else {
                type = Int(arc4random_uniform(2)) > 0 ? GameLevelDataType.Grass : GameLevelDataType.Road
            }
            
            fillLevelDataRowWithType(type: type, row: row)
        }
        
        // Always make sure the player spawn point is not an obstacle
        // TODO: Make sure this is not hardcoded
        data[7, 6] = GameLevelDataType.Grass.rawValue
    }
    
    func fillLevelDataRowWithType(type: GameLevelDataType, row: Int) {
        for column in 0..<data.columnCount() {
            var obstacleCountInRow: Int = 0
            if column < 5 || column > data.columnCount() - 6 {
                // Always obstacles at borders
                data[column, row] = GameLevelDataType.Obstacle.rawValue
            } else {
                if type == GameLevelDataType.Grass && obstacleCountInRow < maxObstaclesPerRow {
                    // Determine if an obstacle should be added
                    if arc4random_uniform(100) > 80 {
                        // Add obstacle
                        data[column, row] = GameLevelDataType.Obstacle.rawValue
                        obstacleCountInRow++
                    } else {
                        // Add grass
                        data[column, row] = type.rawValue
                    }
                } else {
                    data[column, row] = type.rawValue
                }
            }
        }
    }
}
