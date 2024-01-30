//
//  VisualEffectSampleView.swift
//  BlurSample
//
//  Created by 藤治仁 on 2024/01/28.
//

import SwiftUI

struct VisualEffectSampleView: View {
    var body: some View {
        ZStack {
            Image("background") // 背景画像
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VisualEffectView(effect: UIBlurEffect(style: .regular))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("すりガラス効果のある\nテキスト")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    VisualEffectSampleView()
}
