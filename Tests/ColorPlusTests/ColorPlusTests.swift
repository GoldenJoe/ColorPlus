import XCTest
@testable import ColorPlus

final class ColorPlusTests: XCTestCase {
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        XCTAssertEqual(ColorPlus().text, "Hello, World!")
//    }
    
    func testHex() throws {
        let r_standard  = PColor.red
        let r_hex3      = PColor(hex:0xF00)
        let r_hex4      = PColor(hex:0xF00F)
        let r_hex6      = PColor(hex:0xFF0000)
        let r_hex8      = PColor(hex:0xFF0000FF)
        XCTAssert(r_standard.isEqual(r_hex3), "r_hex3 failure")
        XCTAssert(r_standard.isEqual(r_hex4), "r_hex4 failure")
        XCTAssert(r_standard.isEqual(r_hex6), "r_hex6 failure")
        XCTAssert(r_standard.isEqual(r_hex8), "r_hex8 failure")
    }
    
    func testBlend() {
        // TODO: Add some more tests
    }
}
