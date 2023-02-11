//
//  Article.swift
//  JustNews
//
//  Created by Назар Жиленко on 10.02.2023.
//

import Foundation

struct ArticlesList: Decodable {
    var articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}

extension ArticlesList {
    static var all: Resource<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=14bc717ebc964fdba3a3dc6902a7c4b7")!
        return Resource(url: url)
    }()
}
