import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(IGStoryKitTests.allTests),
    ]
}
#endif
