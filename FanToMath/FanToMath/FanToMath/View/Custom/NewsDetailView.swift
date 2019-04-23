
import Foundation
import UIKit
import SnapKit

class NewsDetailView: UIView {

    //MARK: - Properties
    
    private var link:URL?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.image = UIImage(named: "city")
        imageView.backgroundColor = .clear
        return imageView
    }()

    private lazy var titleLbl:UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.text = "Заголовок"
        view.font = Global.comicSansFont(size: StaticSize.s28)
        view.clearBack()
        return view
    }()

    private lazy var descriptionTxtView: UITextView = {
        let view = UITextView()
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = Global.comicSansFont(size: StaticSize.s15)
        view.textColor = Global.blackColor()
        view.backgroundColor = .clear
        view.textAlignment = .justified
        view.isEditable = false
        view.text = "Текст новости очень интересная новость. Которая публикуется как на сайте, так и в мобильном приложении. Текст новости очень интересная  новость. Которая публикуется как на сайте, так и  в мобильном приложении. Текст новости очень интересная новость. Которая публикуется как на сайте, так и в мобильном приложении. Текст новости очень интересная новость. Которая публикуется как на сайте, так и в мобильном приложении. "
        view.clearBack()
        view.dataDetectorTypes = .all
        return view
    }()

//    private lazy var sourceLbl: UITextView = {
//        let view = UITextView()
//        view.text = "Источник: ".localized
//        view.font = Global.comicSansFont(size: StaticSize.s15)
//        view.clearBack()
//        view.isEditable = false
////        view.numberOfLines = 0
//        return view
//    }()

//    private lazy var linkButton: UILabel = {
//        let view = UILabel()
//        view.isUserInteractionEnabled = true
//        view.textAlignment = .left
//        let gesur = UITapGestureRecognizer(target: self, action: #selector(linkPressed))
//        view.addGestureRecognizer(gesur)
//        view.clearBack()
//        view.numberOfLines = 0
//        view.font = Global.comicSansFont(size: StaticSize.s15)
//        return view
//    }()

    //MARK: - Init

    convenience init() {

        self.init(frame: CGRect(x:0,y: 0,width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height - 45))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    private func commonInit() {
        clipsToBounds = true

        setUpConstrains()
    }
}

extension NewsDetailView {

    //MARK: - Setup
    
    func setUpUnNewsDetails(news: News?) {
        if let _new = news,
            let source = _new.source,
            let title  = _new.title,
            let image  = _new.image,
            let description = _new.description {
            self.titleLbl.text = title
            self.descriptionTxtView.text = description
            self.imageView.kf.setImage(with: image)
            self.link = source
            self.descriptionTxtView.text.append("\n\nИсточник: \(source)")
        }
    }

    private func setUpConstrains() {
        self.backgroundColor = Global.whiteColor()
        let scrollView = UIScrollView()

        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.alwaysBounceVertical = true
        scrollView.logoBack()
        addSubview(scrollView)

        scrollView.frame = self.bounds

        let contentView = UIView()
        scrollView.addSubview(contentView)

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(self)
        }

        contentView.addSubViews(views: [imageView,descriptionTxtView,titleLbl])

        imageView.snp.makeConstraints { (imageView) in
            imageView.top.equalTo(contentView.snp.top).offset(StaticSize.s20)
            imageView.width.equalTo(ScreenSize.SCREEN_WIDTH - 2 * StaticSize.s20)
            imageView.centerX.equalTo(contentView.snp.centerX)
            imageView.height.equalTo(StaticSize.s227)
        }

        titleLbl.snp.makeConstraints { (titleLbl) in
            titleLbl.top.equalTo(self.imageView.snp.bottom).offset(StaticSize.s20)
            titleLbl.left.equalTo(contentView.snp.left).offset(StaticSize.s20)
            titleLbl.right.equalTo(contentView.snp.right).offset(-StaticSize.s20)
        }

        descriptionTxtView.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).inset(-StaticSize.s20)
            make.left.equalTo(titleLbl.snp.left)
            make.right.equalTo(titleLbl.snp.right)
            make.bottom.equalTo(contentView.snp.bottom).offset(-StaticSize.s70)
        }
    }
}

