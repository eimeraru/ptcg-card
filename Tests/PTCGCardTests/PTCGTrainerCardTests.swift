import XCTest
@testable import PTCGCard

final class PTCGTrainerCardTests: XCTestCase {
    
    let itemCard = PTCGItemCard(
        id: "S1H-052/060-U",
        name: "クイックボール",
        effect: """
このカードは、自分の手札を1枚トラッシュしなければ使えない。自分の山札からたねポケモンを1枚選び、相手に見せて、手札に加える。そして山札を切る。グッズは、自分の番に何枚でも使える。
""")
    
    let battleItemCard = PTCGBattleItemCard(
        id: "SM11b-043/049-U",
        name: "リーリエのピッピ人形",
        effect: """
このカードは、HP30のタイプのたねポケモンとして、場に出すことができる。自分の番の中でなら、バトル場に出ているこのカードを山札の下にもどしてよい。（ついているカードは、すべてトラッシュする。）このカードは、にげられない。このカードがきぜつしても、相手はサイドをとれない。グッズは、自分の番に何枚でも使える。
""",
        type: .colorLess,
        maxHitPoint: 30,
        weaknessEnergy: nil,
        resistanceEnergy: nil,
        retreatCost: [],
        evolutionType: .basic,
        ability: nil,
        skills: [])
    
    let pokemonToolCard = PTCGPokemonToolCard(
        id: "S3-092/100-U",
        name: "タフネスマント",
        effect: """
ポケモンのどうぐは、自分のポケモンにつけて使う。ポケモン1匹につき1枚だけつけられ、つけたままにする。このカードをつけているたねポケモン（「ポケモンGX」をのぞく）の最大HPは「50」大きくなる。グッズは、自分の番に何枚でも使える。
""")
    
    let stadiumCard = PTCGStadiumCard(
        id: "SM12-091/095-U",
        name: "混沌のうねり",
        effect: """
おたがいのプレイヤーが、手札から別の名前のスタジアムを場に出したとき、このスタジアムをトラッシュしたあと、そのスタジアムもトラッシュする。（新しく出たスタジアムの効果ははたらかない。）スタジアムは、自分の番に1枚だけ、バトル場の横に出せる。別の名前のスタジアムが場に出たなら、このカードをトラッシュする。
""")
    
    func testItemCard() {
        XCTAssertEqual("S1H-052/060-U", itemCard.id)
        XCTAssertEqual("クイックボール", itemCard.name)
    }
    
    func testbattleItemCard() {
        XCTAssertEqual("SM11b-043/049-U", battleItemCard.id)
        XCTAssertEqual("リーリエのピッピ人形", battleItemCard.name)
    }
    
    func testPokemonToolCard() {
        XCTAssertEqual("S3-092/100-U", pokemonToolCard.id)
        XCTAssertEqual("タフネスマント", pokemonToolCard.name)
    }
    
    func testStadiumCard() {
        XCTAssertEqual("SM12-091/095-U", stadiumCard.id)
        XCTAssertEqual("混沌のうねり", stadiumCard.name)
    }

    static var allTests = [
        ("testItemCard", testItemCard),
        ("testbattleItemCard", testbattleItemCard),
        ("testPokemonToolCard", testPokemonToolCard),
        ("testStadiumCard", testStadiumCard),
    ]
}
