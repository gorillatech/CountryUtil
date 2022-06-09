import XCTest
@testable import CountryUtil

final class CountryUtilTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CountryUtil.find(alpha3: "USA")?.alpha2, "US")
    }
}
