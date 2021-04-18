//
//  PTCGEnergyCard.swift
//  PTCGCard
//
//  Created by Eimer on 2021/04/18.
//

import Foundation
import PTCGEnergy

/**
 * エネルギーカードの抽象化定義
 * エネルギーカードは1個でも、複数のエネルギーになりえる場合(e.g. トリプル加速エネルギー)もあれば、
 * 複数の種別としては扱えても1個のエネルギーとしか見なさない場合(e.g. レインボーエネルギー)もある
 * そのため対応するエネルギー種別と、エネルギー数を表現している
 */
public protocol PTCGEnergyCard: PTCGCard {
    /**
     * エネルギー数
     * エネルギーカードを付けて技を使う場合に、必要エネルギー数として計算する際に用いられる
     */
    var capacity: Int { get }

    /**
     * エネルギー種別
     * エネルギーカードを付けて技を使う場合に、必要エネルギー種別として計算する際に用いられる
     */
    var energies: Array<PTCGEnergy> { get }
}

public struct AnyPTCGEnergyCard: PTCGEnergyCard {
    
    public var capacity: Int {
        base.capacity
    }
    
    public var energies: Array<PTCGEnergy> {
        base.energies
    }
    
    public var id: String {
        base.id
    }
    
    public var name: String {
        base.name
    }
    
    public var category: PTCGCardCategory {
        base.category
    }
    
    // MARK: Initialize
    
    var base: PTCGEnergyCard
    
    public init(_ energyCard: PTCGEnergyCard) {
        self.base = energyCard
    }
}

extension AnyPTCGEnergyCard: Equatable {

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.capacity == rhs.capacity
            && lhs.category == rhs.category
            && lhs.energies == rhs.energies
    }
}

/**
 * 基本エネルギー
 */
public struct PTCGBasicEnergyCard: PTCGEnergyCard {
    
    /**
     * 指定したエネルギーに合わせた基本エネルギーを生成
     * - Parameter energy: エネルギー種別
     */
    public init(at energy: PTCGEnergy) {
        self.basicEnergy = energy
    }
    
    var basicEnergy: PTCGEnergy
    
    // MARK: PTCGCard
    
    public var id: String {
        return "basic-energy-\(basicEnergy)"
    }

    public var name: String {
        return "基本\(basicEnergy.name)エネルギー"
    }

    public var category: PTCGCardCategory {
        .basicEnergy
    }
    
    // MARK: PTCGEnergyCard
    
    public var energies: [PTCGEnergy] {
        [basicEnergy]
    }
    
    public var capacity: Int { 1 }
}

extension PTCGBasicEnergyCard: Equatable {

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.category == rhs.category
            && lhs.energies == rhs.energies
            && lhs.capacity == rhs.capacity
    }
}

public struct PTCGSpecialEnergyCard: PTCGEnergyCard {
    // MARK: PTCGCard
    public var id: String
    public var name: String
    public var category: PTCGCardCategory {
        .specialEnergy
    }
    // MARK: PTCGEnergyCard
    public var energies: [PTCGEnergy]
    public var capacity: Int
}

extension PTCGSpecialEnergyCard: Equatable {

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.category == rhs.category
            && lhs.energies == rhs.energies
            && lhs.capacity == rhs.capacity
    }
}
