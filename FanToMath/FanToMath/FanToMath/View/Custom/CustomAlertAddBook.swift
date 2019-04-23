
import Foundation
import UIKit
import SnapKit

class CustomAlertAddBook: UIView {
    
    //MARK: - Properties
    
    private lazy var placeholder: UILabel = {
        let label = UILabel()
        label.font = Global.asinastraFont(size: StaticSize.s20)
        label.textAlignment = .center
        label.textColor = Global.greyColor()
        label.numberOfLines = 0
        label.text = "Введите название, класс,автора и год издания книги".localized
        return label
    }()
    
    private lazy var descriptionTxtView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = Global.asinastraFont(size: StaticSize.s20)
        view.textColor = Global.blackColor()
        view.backgroundColor = .clear
        view.textAlignment = .justified
        view.delegate = self
        view.layer.borderColor = Global.blueColor().cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        return view
    }()
    

    private lazy var saveButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Предложить".localized, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Init
    
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

extension CustomAlertAddBook: UITextViewDelegate {
    
    //MARK: - Setup
    
    func setUpTitle(title: String,placeholder: String) {
        self.saveButton.setTitle(title.localized, for: .normal)
        self.placeholder.text = placeholder
    }
    
    private func setUpConstrains() {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        self.backgroundColor = Global.whiteColor()
        self.addSubViews(views: [descriptionTxtView,saveButton])
        self.descriptionTxtView.addSubview(placeholder)
        descriptionTxtView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(StaticSize.s19)
            make.left.equalTo(self.snp.left).offset(StaticSize.s19)
            make.right.equalTo(self.snp.right).offset(-StaticSize.s19)
            make.height.equalTo(StaticSize.s140 + 7)
        }
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(self.descriptionTxtView.snp.bottom).offset(StaticSize.s19)
            make.bottom.equalTo(self.snp.bottom).offset(-StaticSize.s19)
            make.left.equalTo(self.snp.left).offset(StaticSize.s19)
            make.right.equalTo(self.snp.right).offset(-StaticSize.s19)
            make.height.equalTo(StaticSize.s46)
        }
        placeholder.snp.makeConstraints { make in
            make.top.equalTo(self.descriptionTxtView.snp.top).offset(StaticSize.s12 + 1)
            make.left.equalTo(self.descriptionTxtView.snp.left).offset(StaticSize.s12)
            make.right.equalTo(self.snp.right).offset(-(StaticSize.s18 + StaticSize.s12))
        }
    }
    
    //MARK: - Action
    
    @objc private func buttonPressed() {
        NotificationCenter.default.post(name: .savePressedBook, object: nil)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.placeholder.isHidden = !textView.text.isEmpty
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.placeholder.isHidden = textView.text.isEmpty
    }
    
}

