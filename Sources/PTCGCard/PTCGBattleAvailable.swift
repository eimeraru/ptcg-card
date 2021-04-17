//
//  PTCGBattleAvailable.swift
//  PTCGCard
//
//  Created by Eimer on 2021/04/18.
//

import Foundation
import PTCGEnergy

/**
 * 準拠していれば対戦として場に出すことが可能
 */
public protocol PTCGBattleAvailable {
    /**
     * ポケモンのエネルギー種別
     */
    var type: PTCGEnergy { get }
    
    /**
     * ポケモンの最大HP
     */
    var maxHitPoint: Int { get }
    
    /**
     * ポケモンの弱点
     */
    var weaknessEnergy: PTCGEnergy? { get }
    
    /**
     * ポケモンの抵抗
     */
    var resistanceEnergy: PTCGEnergy? { get }
    
    /**
     * ポケモンが逃げるのに必要なエネルギー
     */
    var retreatCost: [PTCGEnergy] { get }
    
    /**
     * 進化状態
     */
    var evolutionType: PokemonEvolutionType { get }
    
    /**
     * 特性
     */
    var ability: PokemonAbility? { get }
    
    /**
     * 技
     */
    var skills: [PokemonSkill] { get }
}

/**
 * ポケモンの進化状態
 */
public enum PokemonEvolutionType {
    /**
     * たねポケモン
     */
    case basic
    /**
     * 進化1ポケモン
     */
    case stage1
    /**
     * 進化2ポケモン
     */
    case stage2
}

/**
 * ポケモンの特性
 */
public struct PokemonAbility {
    /**
     * ポケモンの特性名
     */
    public let name: String
    
    /**
     * 特性の効果
     */
    public let effect: String
}

extension PokemonAbility: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[Ability]: \(name)\n    \(effect)"
    }
}

/**
 * ポケモンの技
 */
public struct PokemonSkill {
    
    /**
     * 技に必要なエネルギー
     */
    public var needEnergies: [PTCGEnergy]

    /**
     * 技名
     */
    public var name: String
    
    /**
     * 技によって与えるダメージ
     */
    public var damagePoint: String?

    /**
     * 効果
     */
    public var effect: String?
}

extension PokemonSkill: CustomDebugStringConvertible {
    public var debugDescription: String {
        let energiesLogo: String = needEnergies.reduce("") { (ret, energy) -> String in
            ret + energy.emoji
        }
        return "\(energiesLogo) \(name) \(damagePoint ?? "")\n    \(effect ?? "")\n"
    }
}
