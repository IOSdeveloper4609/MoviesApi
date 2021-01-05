//
//  MyTableViewCell.swift
//  apiAPI
//
//  Created by Азат Киракосян on 21.11.2020.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    var starImageView = UIImageView()
    var avatarImageView = UIImageView()
    let descriptionLabel = UILabel()
    let titleLabel = UILabel()
    let rateLabel = UILabel()
    let relisLabel = UILabel()
  
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupWithModel(model: MyTableViewCellModel) {
        if let url = model.avatarImageURL {
            getImageDataFrom(url: url)
            
        }
        
        starImageView.image = model.starImage
        descriptionLabel.text = model.descreptionMovie
        titleLabel.text =  model.titleMovie
        rateLabel.text = model.rateMovie
        relisLabel.text = model.relisMovie
    }
    
   
    private func getImageDataFrom(url: URL) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.avatarImageView.image = image
                }
            }
        }.resume()
    }
}


extension MyTableViewCell {
    
    func setupViews() {
        setupAutoresizingMask()
        addViews()
        setupImageView()
        setupLabels()
        setupLayout()
    }
    
    func setupAutoresizingMask() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        relisLabel.translatesAutoresizingMaskIntoConstraints = false
        starImageView.translatesAutoresizingMaskIntoConstraints = false
       
    }
    
    func addViews() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(starImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(rateLabel)
        contentView.addSubview(relisLabel)
        
    }
    
    func setupImageView() {
        starImageView.contentMode = .scaleAspectFit
       
    }
    
    func setupLabels() {
        relisLabel.font = relisLabel.font.withSize(15)
        relisLabel.shadowColor = .lightGray
        relisLabel.shadowOffset = CGSize(width: -1, height: -1)
        relisLabel.textColor = .black
        
        titleLabel.font = titleLabel.font.withSize(23)
        titleLabel.shadowColor = .lightGray
        titleLabel.shadowOffset = CGSize(width: -1.5, height: -1.5)
        titleLabel.textColor = .black
        
        descriptionLabel.font = descriptionLabel.font.withSize(15)
        descriptionLabel.numberOfLines = 5
    }
    
    
    func  setupLayout() {
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            relisLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 145),
            relisLabel.leftAnchor.constraint(equalTo: avatarImageView.leftAnchor, constant: 110),
            relisLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            starImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 142),
            starImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -40),
            starImageView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            rateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 145),
            rateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35 ),
            descriptionLabel.leftAnchor.constraint(equalTo: avatarImageView.leftAnchor, constant: 110),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: avatarImageView.leftAnchor, constant: 105),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50)
        ])
     
    }
}
    


