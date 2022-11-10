//
//  NewsData.swift
//  MVVMDemo2
//
//  Created by Capgemini-DA073 on 11/8/22.
//

import Foundation

class NewsDatas: NSObject{
    
    //var datastopass: News?
    
    //override init() {
        //print(datastopass?.articles as Any)
       // }
    
    
    func getDataFromAPI(userCompletionHandler: @escaping (News?, Error?) -> Void) {
        let api = APIService()
        api.fetch { news, error in
            //print(news?.articles as Any)
            //self.datastopass = news
            userCompletionHandler(news, nil)
    }
        //return datastopass!
    }
}
    

