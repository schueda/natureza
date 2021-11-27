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
    var collections: [PhotoCollection] = [PhotoCollection(name: "", photos: [], notification: Notification(), note: "")]

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
        let collection = indexPath.row == 0 ? PhotoCollection(name: "", photos: [], notification: Notification(), note: "") : collections[indexPath.row - 1]
        
        guard let photoId = photo.idFromDate else { return }
        viewModel.savePhotoToCollectionBuffer(photo: photo, collection: collection)
        
        navigationController?.pushViewController(CollectionViewController(collection: collection), animated: true)
    }
}

extension CollectionsModalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        collections.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "collection", for: indexPath) as! CollectionTableViewCell
            cell.setCell(image: UIImage(systemName: "plus.rectangle.on.rectangle")!, text: "Nova Coleção")
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "collection", for: indexPath) as! CollectionTableViewCell
        let image = viewModel.getPhoto(from: collections[indexPath.row - 1])?.image
        cell.setCell(image: image, text: collections[indexPath.row - 1].name)
        return cell
    }
}
