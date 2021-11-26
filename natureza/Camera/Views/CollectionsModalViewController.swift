//
//  CollectionsModalViewController.swift
//  natureza
//
//  Created by André Schueda on 25/11/21.
//

import UIKit

class CollectionsModalViewController: UIViewController {
    let viewModel: CollectionsModalViewModel
    let photo: Photo
    var collections: [PhotoCollection] = []

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: "collection")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupView()
        
        setupTableView()
    }
    
    init(viewModel: CollectionsModalViewModel, photo: Photo) {
        self.viewModel = viewModel
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func clickedCancel() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func loadData() {
        collections = viewModel.getAllCollections()
    }
    
    func setupView() {
        view.backgroundColor = .secondarySystemBackground
        navigationItem.title = "Salvar em..."
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(clickedCancel))
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }
    
}

extension CollectionsModalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let photoId = photo.idFromDate else { return }
        viewModel.savePhoto(photo)
        collections[indexPath.row].photos.append(photoId)
        navigationController?.pushViewController(CollectionViewController(collection: collections[indexPath.row]), animated: true)
    }
}

extension CollectionsModalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collection", for: indexPath) as! CollectionTableViewCell
        guard let image = viewModel.getPhoto(from: collections[indexPath.row])?.image else { return cell}
        cell.setCell(image: image, text: collections[indexPath.row].name)
        return cell
    }
}
