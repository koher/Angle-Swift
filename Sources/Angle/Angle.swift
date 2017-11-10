import Darwin

private let pi2: Double = Double.pi * 2

public struct Angle {
	fileprivate var _value: Double
	
	public init(_ value: Double) {
		_value = value
	}
	
	public var value: Double {
		get {
			return Angle.normalized(_value)
		}
		set {
			_value = newValue
		}
	}
	
	// -.pi <= signed < .pi
	public var signed: Double {
		return Angle.normalized(_value + Double.pi) - Double.pi
	}

	public static func normalized(_ value: Double) -> Double {
		return value < 0.0
            ? (value.truncatingRemainder(dividingBy: pi2)) + pi2
            : value.truncatingRemainder(dividingBy: pi2)
	}
}

extension Angle : Equatable {
    public static func ==(lhs: Angle, rhs: Angle) -> Bool {
        return lhs.value == rhs.value
    }
}

extension Angle : Hashable {
    public var hashValue: Int {
        return value.hashValue
    }
}

extension Angle : CustomStringConvertible {
    public var description: String {
        return value.description
    }
}

extension Angle : CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Angle(\(description)"
    }
}

extension Angle : ExpressibleByIntegerLiteral {
    public init(integerLiteral: IntegerLiteralType) {
        self.init(Double(integerLiteral))
    }
}

extension Angle : ExpressibleByFloatLiteral {
    public init(floatLiteral: FloatLiteralType) {
        self.init(floatLiteral)
    }
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
