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
        let r_hex3      = PColor(hex3:0xF00)
        let r_hex4      = PColor(hex4:0xF00F)
        let r_hex6      = PColor(hex6:0xFF0000)
        let r_hex8      = PColor(hex8:0xFF0000FF)
        let r_str3h     = PColor(hex:  "F00");      let r_str3p = PColor(hex:"0xF00")
        let r_str4h     = PColor(hex:  "F00F");     let r_str4p = PColor(hex:"0xF00F")
        let r_str6h     = PColor(hex:  "FF0000");   let r_str6p = PColor(hex:"0xFF0000")
        let r_str8h     = PColor(hex:  "FF0000FF"); let r_str8p = PColor(hex:"0xFF0000FF")
        XCTAssert(r_standard.isEqual(r_hex3), "r_hex3 failure")
        XCTAssert(r_standard.isEqual(r_hex4), "r_hex4 failure")
        XCTAssert(r_standard.isEqual(r_hex6), "r_hex6 failure")
        XCTAssert(r_standard.isEqual(r_hex8), "r_hex8 failure")
        XCTAssert(r_standard.isEqual(r_str3h),"r_str3h failure"); XCTAssert(r_standard.isEqual(r_str3p),"r_str3p failure")
        XCTAssert(r_standard.isEqual(r_str4h),"r_str4h failure"); XCTAssert(r_standard.isEqual(r_str4p),"r_str4p failure")
        XCTAssert(r_standard.isEqual(r_str6h),"r_str6h failure"); XCTAssert(r_standard.isEqual(r_str6p),"r_str6p failure")
        XCTAssert(r_standard.isEqual(r_str8h),"r_str8h failure"); XCTAssert(r_standard.isEqual(r_str8p),"r_str8p failure")
        
        let g_standard  = PColor.green
        let g_hex3      = PColor(hex3:0x0F0)
        let g_hex4      = PColor(hex4:0x0F0F)
        let g_hex6      = PColor(hex6:0x00FF00)
        let g_hex8      = PColor(hex8:0x00FF00FF)
        let g_str3h     = PColor(hex:  "0F0");      let g_str3p = PColor(hex:"0x0F0")
        let g_str4h     = PColor(hex:  "0F0F");     let g_str4p = PColor(hex:"0x0F0F")
        let g_str6h     = PColor(hex:  "00FF00");   let g_str6p = PColor(hex:"0x00FF00")
        let g_str8h     = PColor(hex:  "00FF00FF"); let g_str8p = PColor(hex:"0x00FF00FF")
        XCTAssert(g_standard.isEqual(g_hex3), "g_hex3 failure")
        XCTAssert(g_standard.isEqual(g_hex4), "g_hex4 failure")
        XCTAssert(g_standard.isEqual(g_hex6), "g_hex6 failure")
        XCTAssert(g_standard.isEqual(g_hex8), "g_hex8 failure")
        XCTAssert(g_standard.isEqual(g_str3h),"g_str3h failure"); XCTAssert(g_standard.isEqual(g_str3p),"g_str3p failure")
        XCTAssert(g_standard.isEqual(g_str4h),"g_str4h failure"); XCTAssert(g_standard.isEqual(g_str4p),"g_str4p failure")
        XCTAssert(g_standard.isEqual(g_str6h),"g_str6h failure"); XCTAssert(g_standard.isEqual(g_str6p),"g_str6p failure")
        XCTAssert(g_standard.isEqual(g_str8h),"g_str8h failure"); XCTAssert(g_standard.isEqual(g_str8p),"g_str8p failure")
        
        let b_standard  = PColor.blue
        let b_hex3      = PColor(hex3:0x00F)
        let b_hex4      = PColor(hex4:0x00FF)
        let b_hex6      = PColor(hex6:0x0000FF)
        let b_hex8      = PColor(hex8:0x0000FFFF)
        let b_str3h     = PColor(hex:  "00F");      let b_str3p = PColor(hex:"0x00F")
        let b_str4h     = PColor(hex:  "00FF");     let b_str4p = PColor(hex:"0x00FF")
        let b_str6h     = PColor(hex:  "0000FF");   let b_str6p = PColor(hex:"0x0000FF")
        let b_str8h     = PColor(hex:  "0000FFFF"); let b_str8p = PColor(hex:"0x0000FFFF")
        XCTAssert(b_standard.isEqual(b_hex3), "b_hex3 failure")
        XCTAssert(b_standard.isEqual(b_hex4), "b_hex4 failure")
        XCTAssert(b_standard.isEqual(b_hex6), "b_hex6 failure")
        XCTAssert(b_standard.isEqual(b_hex8), "b_hex8 failure")
        XCTAssert(b_standard.isEqual(b_str3h),"b_str3h failure"); XCTAssert(b_standard.isEqual(b_str3p),"b_str3p failure")
        XCTAssert(b_standard.isEqual(b_str4h),"b_str4h failure"); XCTAssert(b_standard.isEqual(b_str4p),"b_str4p failure")
        XCTAssert(b_standard.isEqual(b_str6h),"b_str6h failure"); XCTAssert(b_standard.isEqual(b_str6p),"b_str6p failure")
        XCTAssert(b_standard.isEqual(b_str8h),"b_str8h failure"); XCTAssert(b_standard.isEqual(b_str8p),"b_str8p failure")
    }
    
    func testBlend() {
        // .black is not in the RGB colorspace, so we use this for testing
        let black = PColor.init(red: 0, green: 0, blue: 0, alpha: 1)
            
        let reds = PColor.colorsInLinerarGradient(color1: .red, color2: .black, stops: [0.0, 0.5, 1.0])
        let greens = PColor.colorsInLinerarGradient(color1: .green, color2: .black, stops: [0.0, 0.5, 1.0])
        let blues = PColor.colorsInLinerarGradient(color1: .blue, color2: .black, stops: [0.0, 0.5, 1.0])
        XCTAssert(reds      == [.red    , PColor.init(red: 0.5, green: 0.0, blue: 0.0, alpha: 1), black], "reds failure")
        XCTAssert(greens    == [.green  , PColor.init(red: 0.0, green: 0.5, blue: 0.0, alpha: 1), black], "greens failure")
        XCTAssert(blues     == [.blue   , PColor.init(red: 0.0, green: 0.0, blue: 0.5, alpha: 1), black], "blues failure")
    }
}
