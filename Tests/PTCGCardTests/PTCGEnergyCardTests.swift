import XCTest
@testable import PTCGCard

final class PTCGEnergyCardTests: XCTestCase {

    let basicFireEnergyCard = PTCGBasicEnergyCard.init(at: .fire)
    let tripleAccelerationEnergy = PTCGSpecialEnergyCard(id: "SM10-091/095-U",
                                                         name: "トリプル加速エネルギー",
                                                         energies: [.colorLess, .colorLess, .colorLess],
                                                         capacity: 3)

    func testBasicEnergyCard() {
        XCTAssertEqual("basic-energy-fire", basicFireEnergyCard.id)
        XCTAssertEqual(.fire, basicFireEnergyCard.energies.first)
        XCTAssertEqual("基本炎エネルギー", basicFireEnergyCard.name)
        XCTAssertEqual(1, basicFireEnergyCard.capacity)
    }
    
    func testSpecialEnergyCard() {
        XCTAssertEqual("SM10-091/095-U", tripleAccelerationEnergy.id)
        XCTAssertEqual([.colorLess, .colorLess, .colorLess], tripleAccelerationEnergy.energies)
        XCTAssertEqual("トリプル加速エネルギー", tripleAccelerationEnergy.name)
        XCTAssertEqual(3, tripleAccelerationEnergy.capacity)
    }

    static var allTests = [
        ("testBasicEnergyCard", testBasicEnergyCard),
        ("testSpecialEnergyCard", testSpecialEnergyCard)
    ]
}
