//
//  NewsListView.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//

import UIKit

class NewsListView: BaseView<NewsListVM, BaseItem> {
    @IBOutlet weak var SearchTab: UISearchBar!
    
    @IBOutlet weak var NewsCollectionView: UICollectionView!{
           didSet {
               self.NewsCollectionView.register(UINib(nibName: String(describing: NewsCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: NewsCell.self))

           }

       }
    var timer: Timer!

    override func bindind() {
        viewModel = NewsListVM(routingManeger: RouterManager(self), newsRepo: NewsRepoImpl())
        
        self.SearchTab.endEditing(true)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
      
    }
    
}
extension NewsListView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
       
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: NewsCell.self), for: indexPath))  as! NewsCell
           // cell.configure(result: presenter.photos.value[indexPath.row], index: indexPath.row)
            return cell
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // presenter.routeToDetails(albumeId: presenter.albumes.value[indexPath.row].id ?? 0, albumeTitle: presenter.albumes.value[indexPath.row].title ?? "")
      
    }

   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize( width: (collectionView.frame.width), height: (collectionView.frame.height)/2 )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
extension NewsListView : UISearchBarDelegate{
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()

    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }

    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        startTimer(searchQuery: searchText)
    }
    private func startTimer(searchQuery: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ApplySearch), userInfo: ["SearchQuery": searchQuery], repeats: false)
    }
    @objc private func ApplySearch() {
        if  let userInfo = timer.userInfo as? [String: String],
            let searchQuery = userInfo["SearchQuery"] {
            applySearchOnViews(searchQuery: searchQuery)
        }
    }
    
    
    
    
    func applySearchOnViews(searchQuery: String){
//        self.presenter.photos.value = searchQuery == "" ? self.presenter.fullPhotos.value : self.presenter.photos.value.filter{
//            (service) -> Bool in
//            return service.title?.localizedCaseInsensitiveContains(searchQuery) ?? true
//        }
//        photosCollectionView.reloadData()
    }
}
