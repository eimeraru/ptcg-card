/**
 * Switcher pattern
 */
public enum PTCGCardSwitcher {
    case pokemon(PTCGPokemonCard)
    case pokemonTool(PTCGPokemonToolCard)
    case item(PTCGItemCard)
    case battleItem(PTCGBattleItemCard)
    case supporter(PTCGSupporterCard)
    case stadium(PTCGStadiumCard)
    case basicEnergy(PTCGBasicEnergyCard)
    case specialEnergy(PTCGSpecialEnergyCard)
}

/**
 * ポケモンカードゲームにおけるカード1枚を表す抽象定義
 */
public protocol PTCGCard {
    
    /**
     * ポケモンカードゲーム上でのカードの種別ごとにユニークとなる識別子
     */
    var id: String { get }
    
    /**
     * ポケモンカード名
     */
    var name: String { get }
    
    /**
     * ポケモンカードのカテゴリ
     */
    var category: PTCGCardCategory { get }
    
    var switcher: PTCGCardSwitcher? { get }
}

public extension PTCGCard where Self: CustomDebugStringConvertible {

    var debugDescription: String {
        return "\(self)"
    }
}

extension PTCGCard where Self: Equatable {

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}


public struct AnyPTCGCard: PTCGCard {

    // MARK: Initialize

    public init(_ card: PTCGCard) {
        self.card = card
    }

    // MARK:

    public var card: PTCGCard

    public var id: String {
        card.id
    }

    public var name: String {
        card.name
    }

    public var category: PTCGCardCategory {
        card.category
    }
    
    public var switcher: PTCGCardSwitcher? {
        card.switcher
    }
}

extension AnyPTCGCard: CustomDebugStringConvertible {

    public var debugDescription: String {
        return "\(self.card)"
    }
}

extension AnyPTCGCard: Equatable {

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.category == rhs.category
            && lhs.debugDescription == rhs.debugDescription
    }
}
