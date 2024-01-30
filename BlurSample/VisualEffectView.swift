//
//  VisualEffectView.swift
//  BlurSample
//
//  Created by 藤治仁 on 2024/01/28.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: effect)
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
        uiView.alpha = 0.8
    }
}
