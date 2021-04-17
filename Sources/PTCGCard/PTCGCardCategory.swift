//
//  PTCGCardCategory.swift
//  PTCGCard
//
//  Created by Eimer on 2021/04/18.
//

import Foundation

/**
 * ポケモンカードにおけるカードカテゴリ
 */
public enum PTCGCardCategory {

    /**
     * ポケモン
     */
    case pokemon
    
    /**
     * 基本エネルギー
     */
    case basicEnergy
    
    /**
     * 特殊エネルギー
     */
    case specialEnergy
    
    /**
     * サポート
     */
    case supporter
    
    /**
     * グッズ
     */
    case item
    
    /**
     * ポケモンのどうぐ
     */
    case pokemonTool
    
    /**
     * スタジアム
     */
    case stadium

    var name: String {
        switch self {
        case .pokemon:
            return "ポケモン"
        case .basicEnergy:
            return "基本エネルギー"
        case .specialEnergy:
            return "特殊エネルギー"
        case .supporter:
            return "サポート"
        case .item:
            return "グッズ"
        case .pokemonTool:
            return "ポケモンのどうぐ"
        case .stadium:
            return "スタジアム"
        }
    }
}
