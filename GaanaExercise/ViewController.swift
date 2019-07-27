//
//  ViewController.swift
//  GaanaExercise
//
//  Created by Manisha Sharma on 27/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
    
    var sectionItems = [SectionItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        activityIndicator.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
        activityIndicator.color = UIColor(red: 115/255, green: 115/255, blue: 115/255, alpha: 1)
        fetchData(completionHandler: { [weak self] jsonObject in
            
            let sectionsArray = jsonObject["sections"] as? [[String: Any]]
            print("jsonarray got")

            if let items = sectionsArray {
                for sectionData in items {
                    if let headerTitle = sectionData["name"] as? String, let items = sectionData["tracks"] as? [[String: String]] {
                        let item = SectionItem(headerTitle: headerTitle, itemArray: items)
                        print("item")
                        self?.sectionItems.append(item)
                    }
                }
                
                DispatchQueue.main.async { [weak self] in
                    self?.setupview()
                }
            }
        })
    }
    
    func setupview() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 400
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
    func fetchData(completionHandler: @escaping ([String : Any?]) -> Void) {
        let session = URLSession.shared
        if let url = URL(string: "https://demo3033278.mockable.io/gaanaDriveTest") {
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                do{
                    if let data = data {
                        let jsonResponse = try JSONSerialization.jsonObject(with:
                            data, options: [])
                        guard let jsonArray = jsonResponse as? [String: Any] else {
                            return
                        }
                        completionHandler(jsonArray)
                    }
                } catch let parsingError {
                    print("Error", parsingError)
                }
            })
            task.resume()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("section iteeeeemsss \(sectionItems)")
        if indexPath.row == 0 , let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AlbumTableViewCell {
            return cell
        }
        //        if indexPath.row == 0 {
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! OutfitHeaderCell
        //            cell.backgroundColor = UIColor.cyan
        //            return cell
        //        } else if indexPath.row == 1 {
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! OutfitClothesCell
        //            cell.layoutIfNeeded()
        //            cell.productCollectionViewHeight?.constant = cell.collectionview.collectionViewLayout.collectionViewContentSize.height
        //            cellheight = cell.collectionview.collectionViewLayout.collectionViewContentSize.height
        //            cell.collectionview.reloadData()
        //            cell.collectionview.isScrollEnabled = false
        //
        //            return cell
        //        } else {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "default")
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        if indexPath.row == 0 {
            height = self.view.frame.height
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = CGFloat()
        height = 200
        return height
    }
}
