//
//  Test.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/9/9.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import Foundation

func ==(lhs: MyType, rhs: MyType) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
class MyType :Hashable{
    internal var x: Int  = 0
    var hashValue : Int {
        get {
            return x.hashValue
        }
    }

}
func test(){
    

    var mySet = Set<MyType>()
    mySet.insert(MyType())
    
}