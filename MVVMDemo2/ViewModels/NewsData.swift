//
//  NewsData.swift
//  MVVMDemo2
//
//  Created by Capgemini-DA073 on 11/8/22.
//

import Foundation

class NewsDatas: NSObject{
    
    override init() {
        let api = APIService()
        api.fetch { news, error in
            print(news?.articles as Any)
        }
    }
    
}
