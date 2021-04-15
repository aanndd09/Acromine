//
//  Acromine.swift
//  Acromine
//
//  Created by Anand Yadav on 14/04/21.
//

import Foundation

struct Acromines: Codable {
    var sf: String
    var lfs: [LF]
}

struct LF: Codable {
    var lf: String
    var freq, since: Int
    var vars: [LF]?
}
typealias Acromine = [Acromines]
