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
}

public extension PTCGCard where Self: CustomDebugStringConvertible {

    var debugDescription: String {
        return "\(self)"
    }
}

extension PTCGCard where Self: Equatable {

    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

public struct AnyPTCGCard: PTCGCard {
    
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
}

extension AnyPTCGCard: CustomDebugStringConvertible {

    public var debugDescription: String {
        return "\(self.card)"
    }
}

extension AnyPTCGCard: Equatable {

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
