//
//  ArticleDetailViewModel.swift
//  NYTimesMostPopularArticles
//
//  Created by Syed Faraz Haider Zaidi on 05/09/2022.
//

import Foundation

class ArticlesDetailViewModel: NSObject {
     var heading:String
     var name:String
     var date:String
     var image:String?
     var detailImage:String?
     var details:String?

    
    init(article: Article) {
        heading = article.title ?? ""
        name = article.byline  ?? ""
        date = article.published_date ?? ""
       details = article.abstract ?? ""
       image = article.media?.count ?? 0 > 0 ? article.media?.first?.media_metadata?.count ?? 0 > 0 ? article.media?.first?.media_metadata?.first?.url:"":""
       detailImage = article.media?.count ?? 0 > 0 ? article.media?.first?.media_metadata?.count ?? 0 > 0 ? article.media?.first?.media_metadata?.last?.url:"":""
    }
}
