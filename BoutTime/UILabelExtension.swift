//
//  UILabelExtensions.swift
//  BoutTime
//
//  Created by Nuno Trindade on 25/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//
import UIKit

extension UILabel
{
    open override func draw(_ rect: CGRect)
    {
        self.drawText(in: UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)))
    }
}
