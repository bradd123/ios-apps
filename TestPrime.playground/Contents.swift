//: Playground - noun: a place where people can play

import UIKit

let q1 = DispatchQueue(label: "queue1")
let q2 = DispatchQueue(label: "queue2")
let q3 = DispatchQueue(label: "queue3")
q1.async { () -> Void
    in
    print(1)
}
q2.async { () -> Void
    in
    print(2)
}
q3.async { () -> Void
    in
    print(3)
}
print("end")