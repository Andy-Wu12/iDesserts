//
//  StringUtil.swift
//  iDesserts
//
//  Created by Andy Wu on 2/15/23.
//

import Foundation

extension String {
    func isTrimmedEmpty() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
