//
//  Constants.swift
//  NYTimesMostPopularArticles
//
//  Created by Syed Faraz Haider Zaidi on 05/09/2022.
//

import Foundation

// MARK: - API Constants
struct APIConstants {
    static let baseUrl = "https://api.nytimes.com"
    static let most_popular_url = "/svc/mostpopular/v2/viewed/"
    static let api_key = "LQQqpwGGdHNPmE5w8baniSfeI90NUSO8"
}

struct APPConstants{
    static let kArticleCellIdentifier = "ArticleTableViewCell"
}

struct Strings {
    static let kArticleTitleString = "Articles"
    static let kOkButtonTitle = "OK"
}
