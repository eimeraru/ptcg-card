//
//  PTCGEnergyCard.swift
//  PTCGCard
//
//  Created by Eimer on 2021/04/18.
//

import Foundation

public protocol PTCGEnergyCard: PTCGCard {
    var energies: Array<String> { get }
}

public struct PTCGBasicEnergyCard: PTCGEnergyCard {

    public var id: String {
        "basic-energy-xxx"
    }

    public var name: String {
        "基本\(energies)エネルギー"
    }

    public var energies: [String] {
        ["無色"]
    }

    public var category: PTCGCardCategory {
        .basicEnergy
    }
}

public struct PTCGSpecialEnergyCard: PTCGEnergyCard {
    public var id: String {
        "special-energy-xxx"
    }

    public var name: String {
        "特殊エネルギー"
    }

    public var energies: [String] {
        ["みず", "とう"]
    }

    public var category: PTCGCardCategory {
        .specialEnergy
    }
}
