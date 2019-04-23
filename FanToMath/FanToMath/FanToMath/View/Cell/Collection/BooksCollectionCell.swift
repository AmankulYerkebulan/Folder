import Foundation
import UIKit

class BooksCollectionCell: UICollectionViewCell {
    
    //MARK: - Variable
    
    static let cellIdentifire = "BooksCollectionCell"
    
    private lazy var bookView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "city")
        view.contentMode = .scaleToFill
//        view.clipsToBounds = true
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius = 3.0
        view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    
    private lazy var titleLbl: UILabel = {
        let view = UILabel()
        view.text = "Алгебра 8 класс (А.Г. Мерзляк, Д.А. Номировский, В.М. Поляков) «Графа»"
        view.numberOfLines = 0
        view.font = Global.comicSansFont(size: StaticSize.s11)
        view.textColor = Global.newsBorderColor()
        return view
    }()
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        setUpViews()
    }
    
    //MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BooksCollectionCell {
    
    private func setUpViews(){
        
        self.addSubViews(views: [bookView,titleLbl])
        self.bookView.snp.makeConstraints { (handImageView) in
            handImageView.top.equalTo(self.snp.top)
            handImageView.left.equalTo(self.snp.left)
            handImageView.right.equalTo(self.snp.right)
            handImageView.width.equalTo(StaticSize.s100 + 2)
            handImageView.height.equalTo(StaticSize.s160)
        }
        self.titleLbl.snp.makeConstraints { (handImageView) in
            handImageView.top.equalTo(self.bookView.snp.bottom).offset(StaticSize.s8)
            handImageView.left.equalTo(self.bookView.snp.left)
            handImageView.right.equalTo(self.bookView.snp.right)
            handImageView.height.equalTo(StaticSize.s80)
            handImageView.bottom.equalTo(self.snp.bottom)
        }
    }
}


class CustomSearchBar: UISearchBar {
    
    func setUp() {
        let view = self
        view.isTranslucent = false
        view.backgroundImage = UIImage()
        view.tintColor = Global.newsBorderColor()
        view.backgroundColor = .clear
        let textFieldInsideSearchBar = view.value(forKey: "searchField") as! UITextField
        textFieldInsideSearchBar.font = Global.asinastraFont(size: StaticSize.s17)
        textFieldInsideSearchBar.layer.borderColor = Global.newsBorderColor().cgColor
        textFieldInsideSearchBar.layer.borderWidth = 1
        textFieldInsideSearchBar.layer.cornerRadius = 10
        let attributeDict = [NSAttributedString.Key.foregroundColor: Global.newsCellColor()]
        textFieldInsideSearchBar.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: attributeDict)
        view.translatesAutoresizingMaskIntoConstraints = false
        if let glassIconView = textFieldInsideSearchBar.leftView as? UIImageView {
            glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
            glassIconView.tintColor = Global.newsBorderColor()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setShowsCancelButton(false, animated: false)
    }
}

class CollectionFooterView: UICollectionReusableView {
    
    static let collectionViewHeaderFooterReuseIdentifier = "MyHeaderFooterClass"
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        let yourAttributes : [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font : Global.asinastraFont(size: StaticSize.s17)!,
            NSAttributedString.Key.foregroundColor : Global.newsBorderColor(),
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "Не нашли свою книгу?\nСообщите нам, мы добавим.",
                                                        attributes: yourAttributes)
        label.textAlignment = .center
        label.attributedText = attributeString
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        let gesure = UITapGestureRecognizer(target: self, action: #selector(buttonPressed))
        label.addGestureRecognizer(gesure)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        self.addSubview(titleLbl)
        self.titleLbl.snp.makeConstraints { (label) in
            label.centerY.equalTo(self.snp.centerY)
            label.centerX.equalTo(self.snp.centerX)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    @objc private func buttonPressed() {
        NotificationCenter.default.post(name: .notFound, object: nil)
    }
    
}
