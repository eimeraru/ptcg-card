import XCTest
@testable import PTCGCard

final class PTCGCardTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PTCGCard().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
