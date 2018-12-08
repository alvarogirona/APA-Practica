import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(riot_json_csvTests.allTests),
    ]
}
#endif