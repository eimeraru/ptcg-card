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
    
    // MARK: Initialize
    
    public init(id: String, name: String, effect: String) {
        self.id = id
        self.name = name
        self.effect = effect
    }
    
    // MARK: PTCGCard
    
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
    
    // MARK: Initialize
    
    public init(id: String, name: String, effect: String) {
        self.id = id
        self.name = name
        self.effect = effect
    }
    
    // MARK: PTCGCard
    
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
    
    // MARK: Initialize
    
    public init(id: String, name: String, effect: String) {
        self.id = id
        self.name = name
        self.effect = effect
    }
    
    // MARK: PTCGCard
    
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
    
    // MARK: Initialize
    
    public init (
        id: String,
        name: String,
        effect: String,
        type: PTCGEnergy,
        maxHitPoint: Int,
        weaknessEnergy: PTCGEnergy? = nil,
        resistanceEnergy: PTCGEnergy? = nil,
        evolutionType: PokemonEvolutionType,
        retreatCost: Array<PTCGEnergy> = [],
        ability: PokemonAbility? = nil,
        skills: Array<PokemonSkill> = []
    ) {
        self.id = id
        self.name = name
        self.effect = effect
        self.type = type
        self.maxHitPoint = maxHitPoint
        self.weaknessEnergy = weaknessEnergy
        self.resistanceEnergy = resistanceEnergy
        self.retreatCost = retreatCost
        self.evolutionType = evolutionType
        self.ability = ability
        self.skills = skills
    }
    
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
    
    public var retreatCost: Array<PTCGEnergy>
    
    public var evolutionType: PokemonEvolutionType
    
    public var ability: PokemonAbility?
    
    public var skills: Array<PokemonSkill>
}

/**
 * スタジアム
 */
public struct PTCGStadiumCard: PTCGTrainerCard {
    
    // MARK: Initialize
    
    public init(id: String, name: String, effect: String) {
        self.id = id
        self.name = name
        self.effect = effect
    }
    
    // MARK: PTCGCard
    
    public var id: String
    
    public var name: String
    
    public var category: PTCGCardCategory {
        .stadium
    }
    
    public var effect: String
}
