//
//  AlbumCell.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import SwiftUI

struct AlbumCell: View {

    @StateObject var viewModel: AlbumCellViewModel

    @Environment(\.mediaPickerTheme) private var theme
    
    var body: some View {
        VStack {
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    GeometryReader { geometry in
                        ThumbnailView(preview: viewModel.preview)
                            .onAppear {
                                viewModel.fetchPreview(size: geometry.size)
                            }
                    }
                }
                .clipped()
                .foregroundColor(theme.main.albumSelectionBackground)
            
            if let title = viewModel.album.title {
                Text(title)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(theme.main.text)
            }
        }
        .onDisappear {
            viewModel.onStop()
        }
    }
}
