
import UIKit

class NewsDetailViewController: UIViewController {
    
    //MARK: - Propertice
    
    var news: News?
    
    private lazy var newsDetailView: NewsDetailView = {
        let view = NewsDetailView()
        return view
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .black
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension NewsDetailViewController {
    
    //MARK: - Setup
    
    private func setUp() {
        
        self.view.backgroundColor = Global.whiteColor()
        self.view.addSubview(newsDetailView)
        self.title = "Новости"
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: self, action: #selector(sharePressed))
        self.newsDetailView.setUpUnNewsDetails(news: self.news)
    }
    
    @objc private func sharePressed() {
        let shareText = "Hello, world!"
        
        let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
        present(vc, animated: true)
    }
    
}
