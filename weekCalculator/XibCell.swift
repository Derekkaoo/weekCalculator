//
//  XibCell.swift
//  weekCalculator
//
//  Created by 高士傑 on 2019/12/23.
//  Copyright © 2019 高士傑. All rights reserved.
//

import UIKit

protocol XibCell {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension XibCell {
    static var identifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
