import XCTest
@testable import PTCGCard

final class PTCGEnergyCardTests: XCTestCase {

    func testBasicEnergyCard() {
        let basicFireEnergyCard = PTCGBasicEnergyCard(at: .fire)
        XCTAssertEqual(.fire, basicFireEnergyCard.energies.first)
        XCTAssertEqual("基本炎エネルギー", basicFireEnergyCard.name)
        XCTAssertEqual(1, basicFireEnergyCard.capacity)
    }

    static var allTests = [
        ("testBasicEnergyCard", testBasicEnergyCard),
    ]
}
