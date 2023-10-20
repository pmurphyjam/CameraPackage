
/
//  ThumbnailPlaceholder.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import SwiftUI

struct ThumbnailPlaceholder: View {

    var body: some View {
        Rectangle()
            .fill(.gray.opacity(0.3))
            .aspectRatio(1, contentMode: .fill)
    }
}
