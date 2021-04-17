import XCTest
@testable import PTCGCard

final class PTCGEnergyCardTests: XCTestCase {

    func testBasicEnergyCard() {
        let basicFireEnergyCard = PTCGBasicEnergyCard.init(at: .fire)
        XCTAssertEqual("basic-energy-fire", basicFireEnergyCard.id)
        XCTAssertEqual(.fire, basicFireEnergyCard.energies.first)
        XCTAssertEqual("基本炎エネルギー", basicFireEnergyCard.name)
        XCTAssertEqual(1, basicFireEnergyCard.capacity)
    }

    static var allTests = [
        ("testBasicEnergyCard", testBasicEnergyCard),
    ]
}
