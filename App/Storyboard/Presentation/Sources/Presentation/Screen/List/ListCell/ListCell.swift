//
//  ListCell.swift
//  
//
//  Created by Maharjan Binish on 2022/04/08.
//

import UIKit
import RxSwift

final class ListCell: UITableViewCell {
    
    private let disposeBag = DisposeBag()

    @IBOutlet private weak var avatarImageBorderView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ownerLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
}

extension ListCell {
    
    private func setup() {
        avatarImageBorderView.layer.borderWidth = 2
        avatarImageBorderView.layer.cornerRadius = 4
        avatarImageBorderView.layer.borderColor = UIColor.lightGray.cgColor
    }
}

extension ListCell {
    
    func bind(with viewModel: ListCellViewModelType) {
        
        viewModel.name
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.owner
            .bind(to: ownerLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.description
            .bind(to: infoLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.language
            .bind(to: languageLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.starCount
            .bind(to: starCountLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.avatarUrl
            .subscribe(onNext: { [weak self] url in
                guard let self = self else { return }
                
                self.avatarImageView.loadImage(at: url)
            })
            .disposed(by: disposeBag)
    }
}


