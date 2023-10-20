//
//  SelectableView.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import SwiftUI

struct SelectableView<Content>: View where Content: View {

    var selected: Int?
    var paddings: CGFloat = 2
    var isFullscreen: Bool
    var canSelect: Bool
    var selectionParamsHolder: SelectionParamsHolder
    var onSelect: () -> Void
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        content().overlay {
            Button {
                onSelect()
            } label: {
                SelectIndicatorView(index: selected, isFullscreen: isFullscreen, canSelect: canSelect, selectionParamsHolder: selectionParamsHolder)
                    .padding([.bottom, .leading], 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(paddings)
        }
    }
}
