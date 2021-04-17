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
    public var retreatCost: [PTCGEnergy]
    
    /**
     * 進化状態を表す
     */
    public var evolutionType: PokemonEvolutionType
    
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
        let escape = "(E): \(retreatCost.count)"
        let skillsDescription = ("\(descriptionAll(skills, indent: "    "))" as NSString).replacingOccurrences(of: "\\n", with: "\n")
        return """
\(name) [\(maxHitPoint)] - \(type.emoji) | \(weakness), \(resistance), \(escape)
    \(ability == nil ? "" : "\(ability!)\n    ")\(skillsDescription)
"""
    }
}
