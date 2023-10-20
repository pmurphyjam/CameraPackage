//
//  MediaViewModel.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
#if os(iOS)
import UIKit.UIImage
#endif
import Photos

class MediaViewModel: ObservableObject {
    let assetMediaModel: AssetMediaModel
    
    private var requestID: PHImageRequestID?
    
    init(assetMediaModel: AssetMediaModel) {
        self.assetMediaModel = assetMediaModel
    }
    
#if os(iOS)
    @Published var preview: UIImage? = nil
#else
    // FIXME: Create preview for image/video for other platforms
#endif
    
    func onStart(size: CGSize) {
        requestID = assetMediaModel.asset
            .image(size: size) {
                self.preview = $0
            }
    }
    
    func onStop() {
        if let requestID = requestID {
            PHCachingImageManager.default().cancelImageRequest(requestID)
        }
    }
}
