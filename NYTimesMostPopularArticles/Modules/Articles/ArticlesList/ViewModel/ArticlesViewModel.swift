//
//  ArticlesViewModel.swift
//  NYTimesMostPopularArticles
//
//  Created by Syed Faraz Haider Zaidi on 05/09/2022.
//

import Foundation
class ArticlesViewModel: NSObject {
    
     var articleList : [Article]
    
    let service: WebServiceProtocol
    init(service: WebServiceProtocol = WebService()) {
        self.articleList = []
        self.service = service
    }
    
    func loadData(finished: @escaping () -> Void) {
        service.fetchArticleList(completion: {  articles in
            guard let articles = articles else {
                return
            }
            self.articleList = articles
            finished()
        })
    }
}

