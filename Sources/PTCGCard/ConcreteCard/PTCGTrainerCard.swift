//
//  PTCGTrainerCard.swift
//  PTCGCard
//
//  Created by Eimer on 2021/04/18.
//

import Foundation
import PTCGEnergy

public protocol PTCGTrainerCard: PTCGCard {
    var effect: String { get }
}

/**
 * ポケモンのどうぐ
 */
public struct PTCGPokemonToolCard: PTCGTrainerCard {
    public var id: String
    
    public var name: String
    
    public var category: PTCGCardCategory {
        .pokemonTool
    }
    
    public var effect: String
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
    
    public var effect: String
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
    
    public var effect: String
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
    
    public var effect: String
    
    // MARK: PTCGBattleAvailable
    
    public var type: PTCGEnergy
    
    public var maxHitPoint: Int
    
    public var weaknessEnergy: PTCGEnergy?
    
    public var resistanceEnergy: PTCGEnergy?
    
    public var retreatCost: [PTCGEnergy]
    
    public var evolutionType: PokemonEvolutionType
    
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
    
    public var effect: String
}
