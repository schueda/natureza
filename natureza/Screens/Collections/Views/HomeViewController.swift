//
//  ViewController.swift
//  natureza
//
//  Created by André Schueda on 08/11/21.
//
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
    var collections: [PhotoCollection]
    
    lazy var homeCollectionView: HomeCollectionView = {
        let collectionView = HomeCollectionView(navigationController: navigationController, viewModel: viewModel, collections: collections)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var placeHolderView: PlaceHolderView = {
        let view = PlaceHolderView(title: "Essa não!\nParece que ainda não tem nada por aqui...", text: "Tire algumas fotos e comece uma nova coleção a partir da opção 'Criar': programe sua rotina para essa coleção e observe atentamente as mudanças naturais e climáticas à sua volta, na sua casa, na sua rotina ou no seu passeio.")
        return view
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.collections = viewModel.getAllCollections()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Coleções"
        view.backgroundColor = .systemBackground
        
        setupHomeCollectionView()
        setupPlaceHolderView()
        if collections.isEmpty {
            placeHolderView.alpha = 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collections = viewModel.getAllCollections()
        if !(collections.isEmpty) {
            placeHolderView.alpha = 0
            homeCollectionView.collections = collections
            homeCollectionView.reloadCollection()
        }
        
    }
    
    private func setupHomeCollectionView() {
        view.addSubview(homeCollectionView)
        homeCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupPlaceHolderView() {
        view.addSubview(placeHolderView)
        placeHolderView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(32)
        }
    }
    
}
