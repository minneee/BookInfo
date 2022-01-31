//
//  ViewController.swift
//  BookInfo
//
//  Created by mini on 2022/01/31.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var BookTableView: UITableView!
    
    var book: [BookInformationList] = []
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.BookTableView.delegate = self
        self.BookTableView.dataSource = self
        self.BookTableView.register(UINib(nibName:"BookTableViewCell" , bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        
        self.BookTableView.estimatedRowHeight = 50
        self.BookTableView.rowHeight = UITableView.automaticDimension
        
        self.getBookList();
    }
    
    ///API연동(GET)
    func getBookList() {
        AF.request("https://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbstarku22490125001&QueryType=ItemNewAll&MaxResults=25&start=1&SearchTarget=Book&output=js&Version=20131101", method: .get, headers: nil)
            .validate()
            .responseDecodable(of: BookList.self) { response in
                switch response.result{
                case .success(let response):
                    print(response.item)
                    self.book = response.item
                    self.BookTableView.reloadData()
                    
                case .failure(let error):
                    print("failure: \(error)")
                }
            }
    }
    /*
    func toImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }*/

}

///TableView 관련 extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.book.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BookTableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        
        let data = self.book[indexPath.row]
        
        ///url image 변환
        let url = URL(string: "\(data.cover)")!
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                self.image = image
            }
        }
        
        if data.description == "" {
            cell.cellDescriptionLabel.text = "요약 내용이 없습니다."
        }
        else{
            cell.cellDescriptionLabel.text = data.description
        }
        
        cell.cellTitleLabel.text = data.title
        cell.cellPriceLabel.text = "\(String(data.priceStandard))원"
        
        cell.cellBookImageView.image = self.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        //url image 변환
        let url = URL(string: "\(self.book[indexPath.row].cover)")!
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                self.image = image
            }
        }
        
        let image = self.image
        let title = self.book[indexPath.row].title
        let price = self.book[indexPath.row].priceStandard
        
        detailVC.receiveImage = image
        detailVC.receiveTitle = title
        detailVC.receivePrice = "\(String(price))원"
        if self.book[indexPath.row].description == "" {
            let description = "요약 내용이 없습니다."
            detailVC.receiveDescription = description
        }
        else{
            let description = self.book[indexPath.row].description
            detailVC.receiveDescription = description
        }
        
        

    }
}
