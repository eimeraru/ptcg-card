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
    var capacity: Int { get set }

    /**
     * エネルギー種別
     * エネルギーカードを付けて技を使う場合に、必要エネルギー種別として計算する際に用いられる
     */
    var energies: Array<PTCGEnergy> { get set }
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
