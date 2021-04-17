//
//  PTCGEnergyCard.swift
//  PTCGCard
//
//  Created by Eimer on 2021/04/18.
//

import Foundation

protocol PTCGEnergyCard: PTCGCard {
    var energies: Array<String> { get }
}

struct PTCGBasicEnergyCard: PTCGEnergyCard {

    var id: String {
        "basic-energy-xxx"
    }

    var name: String {
        "基本\(energies)エネルギー"
    }

    var energies: [String] {
        ["無色"]
    }

    var category: PTCGCardCategory {
        .basicEnergy
    }
}

struct PTCGSpecialEnergyCard: PTCGEnergyCard {
    var id: String {
        "special-energy-xxx"
    }

    var name: String {
        "特殊エネルギー"
    }

    var energies: [String] {
        ["みず", "とう"]
    }

    var category: PTCGCardCategory {
        .specialEnergy
    }
}
