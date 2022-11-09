//
//  NewsFeeds.swift
//  MVVMDemo2
//
//  Created by Capgemini-DA073 on 11/8/22.
//

import Foundation

struct News: Codable{
    
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Articles]?
}
