//
//  ArticleListViewController.swift
//  NYTimesMostPopularArticles
//
//  Created by Syed Faraz Haider Zaidi on 05/09/2022.
//

import Foundation
import UIKit

class ArticleListViewController:UIViewController{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // data source
    var viewModel = ArticlesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.title = Strings.kArticleTitleString
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.activityIndicator.startAnimating();
        viewModel.loadData {
            self.tableView.reloadData();
            self.activityIndicator.stopAnimating()
        };
    }
    
}



extension ArticleListViewController : UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articleList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: APPConstants.kArticleCellIdentifier, for: indexPath) as! ArticleTableViewCell
        cell.configCellUI()
        cell.viewModel = ArticlesDetailViewModel(article: viewModel.articleList[indexPath.row])
        return cell
    }
    
  
    
}

extension ArticleListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AppStoryboard.Main.viewController(vc: ArticleDetailViewController.self)
        vc.viewModel = ArticlesDetailViewModel(article: viewModel.articleList[indexPath.row])
        self.show(vc, sender:  self)
    }
}


