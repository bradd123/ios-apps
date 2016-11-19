//: Playground - noun: a place where people can play

import UIKit

func foo(x: Int) -> Int {
    return x + 42
}
let bar = {(x: Int) -> Int
    in
    x + 42
}

func curly(n: Int) -> Int {
    return n * n
}
func larry(x: Int) -> Int {
    return x * (x + 1)
}
func moe(m: Int) -> Int {
    return m * (m-1) * (m-2)
}
var stooges = [curly, larry, moe]