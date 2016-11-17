//
//  RPS
//  RockPaperScissors
//
//  Created by Jason on 11/14/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation

// MARK: - RPS

// The RPS enum represents a move.

enum RPS {
    case rock, paper, scissors

    // The init method randomly generates the opponent's move
    init() {
        switch arc4random() % 3 {
        
        case 0:
            self = .rock
        case 1:
            self = .paper
        default:
            self = .scissors
        }
    }

    // The defeats method defines the hierarchy of moves, Rock defeats Scissors etc.
    func defeats(_ opponent: RPS) -> Bool {
        
        switch (self, opponent) {
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return false;
        default:
            return true;
        }
    }

}

// MARK: - RPS: CustomStringConvertible

extension RPS: CustomStringConvertible {
    
    var description: String {
        get {
            switch (self) {
            case .rock:
                return "Rock"
            case .paper:
                return "Paper"
            case .scissors:
                return "Scissors"
            }
        }
    }
}

