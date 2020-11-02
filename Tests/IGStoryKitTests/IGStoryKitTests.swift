import XCTest
@testable import IGStoryKit

final class IGStoryKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(IGStoryKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
