//
//  ViewController.swift
//  MVVMDemo2
//
//  Created by Capgemini-DA073 on 11/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrArticles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getdata { [self] arr, error in
            arrArticles = arr!
            
            DispatchQueue.main.async {
                self.collectionView.delegate = self
                self.collectionView.dataSource = self
                self.collectionView.reloadData()
            }
            //print(arrArticles)
        }
        
//        var viewmodelobj = NewsDatas()
//
//        viewmodelobj.getDataFromAPI { [self] news, error in
//            var num = news?.articles?.count
//            for i in 0...num!-1{
//                let d = news?.articles![i].description
//                //print(d)
//                //userCompletionHandler(arr.append(d!), error)
//                //print(arrArticles[i])
//                if d != nil{
//                    arrArticles.append(d!)}
//
//            }
//            print(arrArticles)
//        }
        //view -> viewModel
        
        //print(arrArticles)
        //arrArticles = [ "Amreen Khan", "Safwan Modak", "Amreen Khan", "Safwan Modak", "Amreen Khan", "Safwan Modak", "Amreen Khan", "Safwan Modak", "Amreen Khan", "Safwan Modak"]
        
    }
    func getdata(userCompletionHandler: @escaping (Array<String>?, Error?) -> Void) {
        let viewmodelobj = NewsDatas()
        var arr = [String]()
        //viewModel->view
        viewmodelobj.getDataFromAPI { news, error in
            print(news?.articles?.count as Any)
            let num = news?.articles?.count
            for i in 0...num!-1{
                let d = news?.articles![i].description
                //print(d)
                //userCompletionHandler(arr.append(d!), error)
                //print(arrArticles[i])
                if(d != nil){
                    arr.append(d!)
                }
            }
            
            userCompletionHandler(arr, nil)
        }
        print(arr)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return arrArticles.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.articleslbl.text = arrArticles[indexPath.row]
        return cell
    }
    
    
}

