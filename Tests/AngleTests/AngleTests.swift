import XCTest
@testable import Angle

class AngleTests: XCTestCase {
    private let epsilon = 1.0e-10
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testNormalize() {
		XCTAssertEqual(Double(1.0), Angle.normalized(1.0))
		XCTAssertEqual(Double(5.0), Angle.normalized(5.0 - .pi * 2))
		XCTAssertEqual(Double(.pi * 2 - 1.0), Angle.normalized(-1.0))
		
		XCTAssertEqual(Double(0.0), Angle.normalized(0.0))
		XCTAssertEqual(Double(.pi * 2 - 1.0e-10), Angle.normalized(-1.0e-10))
		XCTAssertEqual(Double(0.0), Angle.normalized(.pi * 2))
		XCTAssertEqual(Double(.pi * 2 - 1.0e-10), Angle.normalized(.pi * 2 - 1.0e-10))
		
        XCTAssertEqual(Double(100.0.truncatingRemainder(dividingBy: (.pi * 2))), Angle.normalized(100.0), accuracy: epsilon)
	}
    
    func testLiteral() {
		let angle: Angle = 1.0
		XCTAssertEqual(Angle(1.0), angle)
		XCTAssertEqual(Double(1.0), angle.value)
	}
	
	func testValue() {
		XCTAssertEqual(Double(1.0), Angle(1.0).value)
		XCTAssertEqual(Double(5.0), Angle(5.0 - .pi * 2).value)
		XCTAssertEqual(Double(.pi * 2 - 1.0), Angle(-1.0).value)
		
		XCTAssertEqual(Double(0.0), Angle(0.0).value)
		XCTAssertEqual(Double(.pi * 2 - 1.0e-10), Angle(-1.0e-10).value)
		XCTAssertEqual(Double(0.0), Angle(.pi * 2).value)
		XCTAssertEqual(Double(.pi * 2 - 1.0e-10), Angle(.pi * 2 - 1.0e-10).value)
		
		XCTAssertEqual(Double(100.0.truncatingRemainder(dividingBy: (.pi * 2))), Angle(100.0).value, accuracy: epsilon)
	}
	
	func testSigned() {
		XCTAssertEqual(Double(1.0), Angle(1.0).signed)
		XCTAssertEqual(Double(-1.0), Angle(-1.0).signed)
		XCTAssertEqual(Double(-1.0), Angle(.pi * 2 - 1.0).signed)
		XCTAssertEqual(-Double.pi, Angle(.pi).signed)
	}
	
	func testEqual() {
		XCTAssertTrue(Angle(1.0) == Angle(1.0))
		XCTAssertTrue(Angle(.pi * 2 + 1.0) == Angle(1.0))
		XCTAssertTrue(Angle(-1.0) == Angle(.pi * 2 - 1.0))
		XCTAssertFalse(Angle(1.0) == Angle(2.0))
		
		XCTAssertFalse(Angle(1.0) != Angle(1.0))
		XCTAssertTrue(Angle(1.0) != Angle(2.0))
	}
	
	func testHashValue() {
		XCTAssertEqual(Angle(1.0).hashValue, Angle(1.0).hashValue)
		XCTAssertEqual(Angle(.pi * 2 + 1.0).hashValue, Angle(1.0).hashValue)
		
		XCTAssertNotEqual(Angle(1.0).hashValue, Angle(2.0).hashValue) // Although hash values of different values can be equal, it's natual to think that it's caused by some bugs when this test fails.
	}
	
	func testDescription() {
		XCTAssertEqual(Double(1.0).description, Angle(1.0).description)
		XCTAssertEqual(Double(.pi * 2 - 1.0).description, Angle(-1.0).description)
	}
	
	func testAdd() {
		XCTAssertEqual(Double(5.0), (Angle(2.0) + Angle(3.0)).value)
		XCTAssertEqual(Double(5.0), (Angle(2.0) + 3.0).value)
		XCTAssertEqual(Double(5.0), (2.0 + Angle(3.0)).value)
		
		XCTAssertEqual(Double(8.0 - .pi * 2), (Angle(3.0) + Angle(5.0)).value)
	}
	
	func testSubtract() {
		XCTAssertEqual(Double(2.0), (Angle(5.0) - Angle(3.0)).value)
		XCTAssertEqual(Double(2.0), (Angle(5.0) - 3.0).value)
		
		XCTAssertEqual(Double(.pi * 2 - 1.0), (Angle(2.0) - Angle(3.0)).value)
	}
	
	func testMultiply() {
		XCTAssertEqual(Double(6.0), (Angle(2.0) * 3.0).value)
		XCTAssertEqual(Double(6.0), (2.0 * Angle(3.0)).value)
		
		XCTAssertEqual(Double(12.0 - .pi * 2), (Angle(3.0) * 4.0).value)
	}
    
    func testSample() {
        let angle1: Angle = .pi * 2 + 1.0
        print(angle1) // 1.0
        
        let angle2: Angle = 1.0
        /**/ _ =
        angle1 == angle2 // true
        
        let angle3 = angle1 + 2.0 // 3.0
        
        let signed: Double = Angle(.pi * 2 - 1.0).signed // -1.0: normalized into [-.pi, .pi)
        
        /**/ XCTAssertEqual(angle2.value, 1.0, accuracy: epsilon)
        /**/ XCTAssertEqual(angle3.value, 3.0, accuracy: epsilon)
        /**/ XCTAssertEqual(signed, -1.0, accuracy: epsilon)
    }
}
