import Darwin

private let pi2: Double = Double.pi * 2

public struct Angle : Equatable, Hashable, CustomStringConvertible, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
	fileprivate var _value: Double
	
	public init(_ value: Double) {
		_value = value
	}
	
	public init(floatLiteral: FloatLiteralType) {
		self.init(floatLiteral)
	}
	
	public init(integerLiteral: IntegerLiteralType) {
		self.init(Double(integerLiteral))
	}
	
	public var hashValue: Int {
		return value.hashValue
	}
	
	public var value: Double {
		get {
			return Angle.normalize(_value)
		}
		set {
			_value = newValue
		}
	}
	
	public var description: String {
		return value.description
	}
	
	// -.pi <= signed < .pi
	public var signed: Double {
		return Angle.normalize(_value + Double.pi) - Double.pi
	}

	public static func normalize(_ value: Double) -> Double {
		return value < 0.0 ? (value.truncatingRemainder(dividingBy: pi2)) + pi2 : value.truncatingRemainder(dividingBy: pi2)
	}
}

public func ==(lhs: Angle, rhs: Angle) -> Bool {
	return lhs.value == rhs.value
}

public func +(lhs: Angle, rhs: Angle) -> Angle {
	return Angle(lhs._value + rhs._value)
}

public func +(lhs: Angle, rhs: Double) -> Angle {
	return Angle(lhs._value + rhs)
}

public func +(lhs: Double, rhs: Angle) -> Angle {
	return Angle(lhs + rhs._value)
}

public func -(lhs: Angle, rhs: Angle) -> Angle {
	return Angle(lhs._value - rhs._value)
}

public func -(lhs: Angle, rhs: Double) -> Angle {
	return Angle(lhs._value - rhs)
}

public func *(lhs: Angle, rhs: Double) -> Angle {
	return Angle(lhs._value * rhs)
}

public func *(lhs: Double, rhs: Angle) -> Angle {
	return Angle(lhs * rhs._value)
}

public func +=(lhs: inout Angle, rhs: Angle) {
	lhs = lhs + rhs
}

public func +=(lhs: inout Angle, rhs: Double) {
	lhs = lhs + rhs
}

public func -=(lhs: inout Angle, rhs: Angle) {
	lhs = lhs - rhs
}

public func -=(lhs: inout Angle, rhs: Double) {
	lhs = lhs - rhs
}

public func sin(_ angle: Angle) -> Double {
	return sin(angle._value)
}

public func cos(_ angle: Angle) -> Double {
	return cos(angle._value)
}

public func tan(_ angle: Angle) -> Double {
	return tan(angle._value)
}
