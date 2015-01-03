import Darwin

let angle1: Angle = M_PI * 2 + 1.0
println(angle1) // 1.0

let angle2: Angle = 1.0
angle1 == angle2 // true

let angle3 = angle1 + 2.0 // 3.0

let signed: Double = Angle(M_PI * 2 - 1.0).signed // -1.0: normalized into [-M_PI, M_PI)
