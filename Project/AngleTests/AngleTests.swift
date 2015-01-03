import XCTest
import Angle

class AngleTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testNormalize() {
		XCTAssertEqual(Double(1.0), Angle.normalize(1.0))
		XCTAssertEqual(Double(5.0), Angle.normalize(5.0 - M_PI * 2))
		XCTAssertEqual(Double(M_PI * 2 - 1.0), Angle.normalize(-1.0))
		
		XCTAssertEqual(Double(0.0), Angle.normalize(0.0))
		XCTAssertEqual(Double(M_PI * 2 - 1.0e-10), Angle.normalize(-1.0e-10))
		XCTAssertEqual(Double(0.0), Angle.normalize(M_PI * 2))
		XCTAssertEqual(Double(M_PI * 2 - 1.0e-10), Angle.normalize(M_PI * 2 - 1.0e-10))
		
		XCTAssertEqual(Double(100.0 % (M_PI * 2)), Angle.normalize(100.0))
	}
    
    func testLiteral() {
		let angle: Angle = 1.0
		XCTAssertEqual(Angle(1.0), angle)
		XCTAssertEqual(Double(1.0), angle.value)
	}
	
	func testValue() {
		XCTAssertEqual(Double(1.0), Angle(1.0).value)
		XCTAssertEqual(Double(5.0), Angle(5.0 - M_PI * 2).value)
		XCTAssertEqual(Double(M_PI * 2 - 1.0), Angle(-1.0).value)
		
		XCTAssertEqual(Double(0.0), Angle(0.0).value)
		XCTAssertEqual(Double(M_PI * 2 - 1.0e-10), Angle(-1.0e-10).value)
		XCTAssertEqual(Double(0.0), Angle(M_PI * 2).value)
		XCTAssertEqual(Double(M_PI * 2 - 1.0e-10), Angle(M_PI * 2 - 1.0e-10).value)
		
		XCTAssertEqual(Double(100.0 % (M_PI * 2)), Angle(100.0).value)
	}
	
	func testSigned() {
		XCTAssertEqual(Double(1.0), Angle(1.0).signed)
		XCTAssertEqual(Double(-1.0), Angle(-1.0).signed)
		XCTAssertEqual(Double(-1.0), Angle(M_PI * 2 - 1.0).signed)
		XCTAssertEqual(Double(-M_PI), Angle(M_PI).signed)
	}
	
	func testEqual() {
		XCTAssertTrue(Angle(1.0) == Angle(1.0))
		XCTAssertTrue(Angle(M_PI * 2 + 1.0) == Angle(1.0))
		XCTAssertTrue(Angle(-1.0) == Angle(M_PI * 2 - 1.0))
		XCTAssertFalse(Angle(1.0) == Angle(2.0))
		
		XCTAssertFalse(Angle(1.0) != Angle(1.0))
		XCTAssertTrue(Angle(1.0) != Angle(2.0))
	}
	
	func testHashValue() {
		XCTAssertEqual(Angle(1.0).hashValue, Angle(1.0).hashValue)
		XCTAssertEqual(Angle(M_PI * 2 + 1.0).hashValue, Angle(1.0).hashValue)
		
		XCTAssertNotEqual(Angle(1.0).hashValue, Angle(2.0).hashValue) // Although hash values of different values can be equal, it's natual to think that it's caused by some bugs when this test fails.
	}
	
	func testDescription() {
		XCTAssertEqual(Double(1.0).description, Angle(1.0).description)
		XCTAssertEqual(Double(M_PI * 2 - 1.0).description, Angle(-1.0).description)
	}
	
	func testAdd() {
		XCTAssertEqual(Double(5.0), (Angle(2.0) + Angle(3.0)).value)
		XCTAssertEqual(Double(5.0), (Angle(2.0) + 3.0).value)
		XCTAssertEqual(Double(5.0), (2.0 + Angle(3.0)).value)
		
		XCTAssertEqual(Double(8.0 - M_PI * 2), (Angle(3.0) + Angle(5.0)).value)
	}
	
	func testSubtract() {
		XCTAssertEqual(Double(2.0), (Angle(5.0) - Angle(3.0)).value)
		XCTAssertEqual(Double(2.0), (Angle(5.0) - 3.0).value)
		
		XCTAssertEqual(Double(M_PI * 2 - 1.0), (Angle(2.0) - Angle(3.0)).value)
	}
	
	func testMultiply() {
		XCTAssertEqual(Double(6.0), (Angle(2.0) * 3.0).value)
		XCTAssertEqual(Double(6.0), (2.0 * Angle(3.0)).value)
		
		XCTAssertEqual(Double(12.0 - M_PI * 2), (Angle(3.0) * 4.0).value)
	}
}
