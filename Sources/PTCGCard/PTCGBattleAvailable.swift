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
    var escapeEnergies: [PTCGEnergy] { get }
    
    /**
     * 特性
     */
    var ability: PokemonAbility? { get }
    
    /**
     * 技
     */
    var skills: [PokemonSkill] { get }
}
