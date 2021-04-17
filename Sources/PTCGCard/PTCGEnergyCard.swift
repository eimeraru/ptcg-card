//
//  PTCGEnergyCard.swift
//  PTCGCard
//
//  Created by Eimer on 2021/04/18.
//

import Foundation
import PTCGEnergy

public protocol PTCGEnergyCard: PTCGCard {
    var capacity: Int { get set }
    var energies: Array<PTCGEnergy> { get set }
}

/**
 * 基本エネルギー
 */
public struct PTCGBasicEnergyCard: PTCGEnergyCard {

    public init(at energy: PTCGEnergy) {
        self.energies = [energy]
    }
    
    // MARK:
    
    public var id: String {
        guard let energy = energies.first else {
            fatalError("basic energy card is needed available one energy")
        }
        return "basic-energy-\(energy)"
    }

    public var name: String {
        guard let energy = energies.first else {
            fatalError("basic energy card is needed available one energy")
        }
        return "基本\(energy.name)エネルギー"
    }

    public var category: PTCGCardCategory {
        .basicEnergy
    }
    
    // MARK:
    
    public var energies: [PTCGEnergy]
    
    public var capacity: Int = 1
}

public struct PTCGSpecialEnergyCard: PTCGEnergyCard {
    public var id: String

    public var name: String
    
    public var category: PTCGCardCategory {
        .specialEnergy
    }

    public var energies: [PTCGEnergy]
    
    public var capacity: Int
}
