//
//  ViewController.swift
//  BookInfo
//
//  Created by mini on 2022/01/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BookTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.BookTableView.delegate = self
        self.BookTableView.dataSource = self
        self.BookTableView.register(UINib(nibName:"BookTableViewCell" , bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = BookTableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        
        return userCell
    }
    
    
}
