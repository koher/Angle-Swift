# Angle

`Angle` is a type which represents angles normalized into \[0, 2 * .pi).

## Usage

```swift
import Angle

let angle1: Angle = .pi * 2 + 1.0
print(angle1) // 1.0

let angle2: Angle = 1.0
angle1 == angle2 // true

let angle3 = angle1 + 2.0 // 3.0

let signed: Double = Angle(.pi * 2 - 1.0).signed // -1.0: normalized into [-.pi, .pi)
```

## License

[The MIT License](LICENSE)
