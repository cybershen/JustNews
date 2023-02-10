//
//  NewsTableViewController.swift
//  JustNews
//
//  Created by Назар Жиленко on 10.02.2023.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    private var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        fetchNews()
    }
    
    private func fetchNews() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ua&apiKey=14bc717ebc964fdba3a3dc6902a7c4b7")!
        
        Observable.just(url)
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }
            .map { data -> [Article]? in
                return try? JSONDecoder().decode(ArticlesList.self, from: data).articles
            }
            .subscribe(onNext: { [weak self] articles in
                if let articles = articles {
                    self?.articles = articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            })
            .disposed(by: disposeBag)
    }
}
