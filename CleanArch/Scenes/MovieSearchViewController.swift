//
//  MovieSearchViewController.swift
//  CleanArch
//
//  Created by Anjali Prasad on 19/04/2023.


import UIKit


class MovieSearchViewController: UIViewController, MovieSearchViewableInput
{
    //MARK: - Properties
    private lazy var genreLabel: UILabel = {
        createLabel("Genre")
    }()
    
    private lazy var languageLabel: UILabel = {
        createLabel("Language")
    }()
    
    private lazy var periodLabel: UILabel = {
        createLabel("Time Period")
    }()
    
    private lazy var genreMenu: UIButton = {
        createPulldownButton()
    }()
    
    private lazy var languageMenu: UIButton = {
        createPulldownButton()
    }()
    
    private lazy var periodMenu: UIButton = {
        createPulldownButton()
    }()
    
    private lazy var searchButton: UIButton = {
       createButton()
    }()
    
    private lazy var resultLabel: UILabel = {
        createLabel("")
    }()
    
    
    private lazy var menuClosure =  { (action: UIAction) in
        self.resultLabel.isHidden = true
    }
    
    var output: MovieSearchViewableOutput!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureNavigationAppearance()
        configureUI()
        loadMovieCategory()
    }
    
    
    private func loadMovieCategory()
    {
        Task {
            await output.load(category: MovieLogic.Category.Request())
        }
    }
    
    private func loadMovieList()
    {
       
        Task {
            let request = MovieLogic.Lists.Request(genre: genreMenu.titleLabel?.text ?? "",
                                                   language: languageMenu.titleLabel?.text ?? "",
                                                   period: periodMenu.titleLabel?.text ?? "")
            await  output.load(list: request)
        }
       
    }
    
    @objc func searchButtonAction(_ sender: UIButton) {
        loadMovieList()
    }
    
}

//MARK: - Update UI

extension MovieSearchViewController {
    private func getActionArray(for category:[String]) -> [UIAction] {
        var actionArray = [UIAction]()
        
        for item in category {
            let action = UIAction(title: item, state: .off, handler: menuClosure)
            actionArray.append(action)
        }
        
        return actionArray
    }
    
    @MainActor
    func show(category viewModel: MovieLogic.Category.ViewModel)
    {
        
        
        genreMenu.menu = UIMenu(title: "",
                                options: .displayInline,
                                children: getActionArray(for: viewModel.genre))
        
        
        languageMenu.menu = UIMenu(title: "",
                                   options: .displayInline,
                                   children: getActionArray(for: viewModel.language))
        
        periodMenu.menu = UIMenu(title: "",
                                 options: .displayInline,
                                 children: getActionArray(for: viewModel.period))
    }
    
    @MainActor
    func show(list viewModel: MovieLogic.Lists.ViewModel) {
        resultLabel.isHidden = false
        resultLabel.text = "Movie: \(viewModel.title) \nDirector: \(viewModel.director)"
    }
}

//MARK: - Configure UI

private extension MovieSearchViewController {
    
    
    private func createLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createPulldownButton() -> UIButton {
        let menuButton = UIButton()
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.changesSelectionAsPrimaryAction = true
        menuButton.titleLabel?.font  = UIFont.systemFont(ofSize: 15)
        menuButton.setTitleColor(.black, for: .normal)
        menuButton.contentHorizontalAlignment = .left
        return menuButton
    }
    
    private func createButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font  = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        return button
    }
    
    private func createSubStack(with views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }
    
    //MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
        let stackGenre = createSubStack(with: [genreLabel, genreMenu])
        
        let stackLanguage = createSubStack(with: [languageLabel, languageMenu])
        
        let stackPeriod = createSubStack(with: [periodLabel, periodMenu])
        
        
        let stack = UIStackView(arrangedSubviews: [stackGenre,stackLanguage, stackPeriod])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 5
        
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 100,
                     paddingLeft: 10, paddingRight: 10, height: 200)
        
        view.addSubview(searchButton)
        searchButton.anchor(top: stack.bottomAnchor,
                            left: view.leftAnchor,
                            right: view.rightAnchor,
                            paddingTop: 20,
                            paddingLeft: 50,
                            paddingRight: 50,
                            height: 30)
        
        view.addSubview(resultLabel)
        resultLabel.anchor(top: searchButton.bottomAnchor,
                           left: view.leftAnchor,
                           right: view.rightAnchor,
                           paddingTop: 50,
                           paddingLeft: 10,
                           paddingRight: 10,
                           height: 50)
        resultLabel.isHidden = true
        
    }
    

}
