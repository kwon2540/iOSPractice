//
//  UIImageView+Extension.swift
//  
//
//  Created by Maharjan Binish on 2022/04/08.
//

import UIKit
import Nuke

extension UIImageView {
    
    func loadImage(at url: URL?) {
        guard let url = url else {
            clearImage()
            return
        }
        
        let imageRequest = ImageRequest(url: url)
        let options = ImageLoadingOptions(
            placeholder: nil,
            transition: .fadeIn(duration: 0.1),
            failureImage: nil,
            failureImageTransition: .fadeIn(duration: 0.1)
        )
        
        Nuke.loadImage(
            with: imageRequest,
            options: options,
            into: self
        )
    }
    
    func clearImage() {
        cancelRequest(for: self)
        image = nil
    }
}
