//
//  PTCGTrainerCard.swift
//  PTCGCard
//
//  Created by Eimer on 2021/04/18.
//

import Foundation
import PTCGEnergy

public protocol PTCGTrainerCard: PTCGCard {}

/**
 * ポケモンのどうぐ
 */
public struct PTCGPokemonToolCard: PTCGTrainerCard {
    public var id: String
    
    public var name: String
    
    public var category: PTCGCardCategory {
        .pokemonTool
    }
}

/**
 * サポート
 */
public struct PTCGSupporterCard: PTCGTrainerCard {
    public var id: String
    
    public var name: String
    
    public var category: PTCGCardCategory {
        .supporter
    }
}

/**
 * グッズ
 */
public struct PTCGItemCard: PTCGTrainerCard {
    public var id: String
    
    public var name: String
    
    public var category: PTCGCardCategory {
        .item
    }
}

/**
 * バトル場、またはベンチに出すことができるグッズ
 */
public struct PTCGBattleItemCard: PTCGTrainerCard, PTCGBattleAvailable {
    
    // MARK: PTCGCard
    
    public var id: String
    
    public var name: String
    
    public var category: PTCGCardCategory {
        .item
    }
    
    // MARK: PTCGBattleAvailable
    
    public var type: PTCGEnergy
    
    public var maxHitPoint: Int
    
    public var weaknessEnergy: PTCGEnergy?
    
    public var resistanceEnergy: PTCGEnergy?
    
    public var escapeEnergies: [PTCGEnergy]
    
    public var ability: PokemonAbility?
    
    public var skills: [PokemonSkill]
}

/**
 * スタジアム
 */
public struct PTCGStadiumCard: PTCGTrainerCard {
    public var id: String
    
    public var name: String
    
    public var category: PTCGCardCategory {
        .stadium
    }
}
