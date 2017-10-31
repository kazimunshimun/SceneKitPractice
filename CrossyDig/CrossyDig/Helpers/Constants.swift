//
//  File.swift
//  CrossyDig
//
//  Created by Anik on 10/25/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

enum GameState {
    case WaitingForFirstTap
    case Playing
    case GameOver
    case RestartLevel
}

enum MoveDirection {
    case Forward
    case Backward
    case Left
    case Right
}

struct PhysicsCategory {
    static let None: Int        = 0;
    static let Player: Int      = 0b1;
    static let Car: Int         = 0b10;
    static let Obstracle: Int   = 0b100;
}
