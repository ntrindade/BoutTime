//
//  Moveable.swift
//  BoutTime
//
//  Created by Nuno Trindade on 05/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import Foundation

protocol Moveable {
    var movement: Int { get }
    func moveUp() throws
    func moveDown() throws
}
