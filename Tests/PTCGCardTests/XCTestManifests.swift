import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(PTCGEnergyCardTests.allTests),
        testCase(PTCGTrainerCardTests.allTests),
    ]
}
#endif
