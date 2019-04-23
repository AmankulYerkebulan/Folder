import Foundation
import UIKit

final class DetailBookCollectionManager: NSObject {
    
    override init() {
        super.init()
        
    }
}

extension DetailBookCollectionManager:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionNumberCollectionCell.cellIdentifire, for: indexPath as IndexPath) as! SectionNumberCollectionCell
        return cell
    }
}

extension DetailBookCollectionManager: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: .problemSelect, object: nil)
    }
}
