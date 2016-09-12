//
//  Array.swift
//  BoutTime
//
//  Created by Nuno Trindade on 12/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//  Credits to http://supereasyapps.com/blog/2015/9/22/how-to-remove-an-array-of-objects-from-a-swift-2-array-removeobjectsinarray

extension Array where Element: Equatable {
    mutating func removeObject(object: Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
    
    mutating func removeObjectsInArray(array: [Element]) {
        for object in array {
            self.removeObject(object)
        }
    }
}