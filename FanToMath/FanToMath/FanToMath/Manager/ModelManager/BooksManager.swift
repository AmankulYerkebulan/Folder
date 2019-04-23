import Foundation
import UIKit

final class BooksManager: NSObject {
    
    override init() {
        super.init()
        
    }
}

extension BooksManager:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksCollectionCell.cellIdentifire, for: indexPath as IndexPath) as! BooksCollectionCell
        return cell
    }
}

extension BooksManager: UICollectionViewDelegate {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        
//        return CGSize(width: ScreenSize.SCREEN_WIDTH - 32, height: 60)
//    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionFooterView.collectionViewHeaderFooterReuseIdentifier, for: indexPath) as! CollectionFooterView
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        NotificationCenter.default.post(name: .bookPressed, object: nil)
    }
}


extension BooksManager: UISearchBarDelegate {
    
    //MARK: - SearchViewController Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        BooksViewController.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchText(text:)), object: nil)
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        self.perform(#selector(searchText(text:)), with: searchText, afterDelay: 0.5)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    //MARK: - Helper
    
    @objc
    private func searchText(text: String) {
        
        self.searchFuntion(text: text)
    }
    
    private func searchFuntion(text: String) {
        
    }
}
