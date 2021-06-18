//
//  NewsDetailsView.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//


import Foundation
import UIKit
import moa
class NewsDetailsView: BaseView<NewsDetailsVM, NewsDetailsItem> {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    private var articleWeb : String?
    
    
    override func bindind() {
        viewModel = NewsDetailsVM(routingManeger: RouterManager(self), newsRepo: NewsRepoImpl(), item: item)
        viewModel.article.bindAndFire { article in
            self.titleLbl.text = "Title : \(article?.title ?? "")"
            self.descriptionLbl.text =  "Description : \(article?.articleDescription ?? "")"
            self.authorLbl.text =  "Author : \(article?.author ?? "")"
            self.sourceLbl.text = "Source : \(article?.source?.name ?? "")"
            self.contentLbl.text = "Content : \(article?.content ?? "")"
            self.dateLbl.text = "Date : \(article?.publishedAt ?? "")"
            self.img.moa.url = article?.urlToImage
            self.articleWeb = article?.url
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    @IBAction func navigateToSource(_ sender: Any) {
        guard let url = URL(string: articleWeb ?? "") else { return }
        UIApplication.shared.open(url)
    }
    
}
