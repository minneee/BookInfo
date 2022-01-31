//
//  BookListResponse.swift
//  BookInfo
//
//  Created by mini on 2022/02/01.
//

import Foundation
import UIKit

struct BookList: Decodable {
    var item: [BookInformationList]
}

struct BookInformationList: Decodable {
    var title: String
    var priceStandard: Int
    var description: String
    var cover: String
}
