//
//  DetailViewController.swift
//  apiAPI
//
//  Created by Азат Киракосян on 14.12.2020.
//

import UIKit

class DetailViewController: UIViewController {

    private let nameLabel = UILabel()
    private let avatarImage = UIImageView()
    private let descriptionLabel = UILabel()
    private let rateLabel = UILabel()
    private let starImageView = UIImageView()
    private let relisLabel = UILabel()
    let myTableViewCellModel: MyTableViewCellModel
    
    init(myTableViewCellModel: MyTableViewCellModel) {
        self.myTableViewCellModel = myTableViewCellModel
        
        super.init(nibName: nil, bundle: nil)
        
        nameLabel.text = myTableViewCellModel.titleMovie
        descriptionLabel.text = myTableViewCellModel.descreptionMovie
        relisLabel.text = myTableViewCellModel.relisMovie
        rateLabel.text = myTableViewCellModel.rateMovie
       
        guard let avatarImageURL = myTableViewCellModel.avatarImageURL  else  { return }
        avatarImage.downloaded(from: avatarImageURL)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .white
        setupViews()
        setupNav()
        
    }
    
    func setupNav() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Movie description"
    }
}


extension DetailViewController {
    
    func setupViews() {
        addViews()
        setupAutoresizingMask()
        setupImageView()
        setupLabels()
        setupLayout()
    }
    
    func addViews() {
        self.view.addSubview(relisLabel)
        self.view.addSubview(starImageView)
        self.view.addSubview(rateLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(nameLabel)
        self.view.addSubview(avatarImage)
        
    }
    
    func setupAutoresizingMask() {
        relisLabel.translatesAutoresizingMaskIntoConstraints = false
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupImageView() {
        starImageView.image = UIImage(named: "star")
        starImageView.contentMode = .scaleAspectFill
        avatarImage.contentMode = .scaleToFill
       
    }
    
    func setupLabels() {
        relisLabel.font = relisLabel.font.withSize(22)
        relisLabel.contentMode = .scaleAspectFill
        relisLabel.textColor = .red
        
        rateLabel.font = rateLabel.font.withSize(25)
        rateLabel.numberOfLines = 0
        
        descriptionLabel.font = descriptionLabel.font.withSize(17)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .systemBlue
        
        nameLabel.font = nameLabel.font.withSize(30)
        nameLabel.numberOfLines = 0
        nameLabel.shadowColor = .lightGray
        nameLabel.shadowOffset = CGSize(width: -1.5, height: -1.5)
        nameLabel.textColor = .black
        
    }
    
    func setupLayout() {
              
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor , constant: 25),
            avatarImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            avatarImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            avatarImage.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 25),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            rateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            rateLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            starImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            starImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            starImageView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            relisLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            relisLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            relisLabel.heightAnchor.constraint(equalToConstant: 25)
            
        ])
    }
}
