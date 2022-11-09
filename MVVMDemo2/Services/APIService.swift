//
//  APIService.swift
//  MVVMDemo2
//
//  Created by Capgemini-DA073 on 11/8/22.
//

import Foundation

class APIService: NSObject{
    
    func fetch(userCompletionHandler: @escaping (News?, Error?) -> Void){
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2022-10-09&sortBy=publishedAt&apiKey=96d07665758445f69971ce2b3b29d2a7"
        let url = URL(string: urlString)
        
        //var newtoreturn: News = News()
        
        guard url != nil else{
            return
        }
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                do{
                    let newsfeeds = try decoder.decode(News.self, from: data!)
                    print(type(of: newsfeeds))
                    //newtoreturn = newsfeeds
                    userCompletionHandler(newsfeeds, nil)
                }
                catch let parseErr{
                    print("Error in Json Parsing")
                    userCompletionHandler(nil, parseErr)
                }
            }
            else{
                print("error in data task")
            }
        }
        
        dataTask.resume()
        //dataTask.resume()
        //return newtoreturn
    }
    
}
