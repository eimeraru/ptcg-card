//
//  PTCGPokemonCard.swift
//  PTCGCard
//
//  Created by Eimer on 2021/04/18.
//

import Foundation
import PTCGEnergy

private func descriptionAll(_ elements: Array<Any>, indent: String = "") -> String {
    elements.enumerated().map {
        "[\(NSString(format: "%02d", $0.offset))]: \($0.element)"
    }.reduce("") { (ret, addition) -> String in
        let space = ret.isEmpty ? "" : "    "
        return ret + space + addition
    }
}

/**
 * ポケモンカード定義
 */
public struct PTCGPokemonCard: PTCGCard, PTCGBattleAvailable {
    
    // MARK: PTCGCard
    public var id: String
    public var name: String
    public var category: PTCGCardCategory {
        .pokemon
    }
    
    // MARK: PTCGPokemonCard
    
    /**
     * ポケモンのエネルギー種別
     */
    public var type: PTCGEnergy
    
    /**
     * ポケモンの最大HP
     */
    public var maxHitPoint: Int
    
    /**
     * ポケモンの弱点
     */
    public var weaknessEnergy: PTCGEnergy?
    
    /**
     * ポケモンの抵抗
     */
    public var resistanceEnergy: PTCGEnergy?
    
    /**
     * ポケモンが逃げるのに必要なエネルギー
     */
    public var escapeEnergies: [PTCGEnergy]
    
    /**
     * 特性
     */
    public var ability: PokemonAbility?
    
    /**
     * 技
     */
    public var skills: [PokemonSkill]
}

extension PTCGPokemonCard: CustomDebugStringConvertible {
    public var debugDescription: String {
        let weakness = "(W): \(weaknessEnergy == nil ? "-" : weaknessEnergy!.emoji)"
        let resistance = "(R): \(resistanceEnergy == nil ? "-" : resistanceEnergy!.emoji)"
        let escape = "(E): \(escapeEnergies.count)"
        let skillsDescription = ("\(descriptionAll(skills, indent: "    "))" as NSString).replacingOccurrences(of: "\\n", with: "\n")
        return """
\(name) [\(maxHitPoint)] - \(type.emoji) | \(weakness), \(resistance), \(escape)
    \(ability == nil ? "" : "\(ability!)\n    ")\(skillsDescription)
"""
    }
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
