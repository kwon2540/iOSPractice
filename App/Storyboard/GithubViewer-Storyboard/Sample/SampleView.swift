//
//  FirstView.swift
//  GithubViewer-Storyboard
//
//  Created by Maharjan Binish on 2022/02/19.
//

import UIKit

final class SampleView: UIView {

    @IBOutlet private weak var label: UILabel!

    init(model: SampleModel) {
        super.init(frame: .zero)
        loadOwnedXib()
        self.label.text = model.string
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
