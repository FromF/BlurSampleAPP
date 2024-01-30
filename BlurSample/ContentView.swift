//
//  ContentView.swift
//  BlurSample
//
//  Created by 藤治仁 on 2024/01/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Image("background") // 背景画像
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Label("オリジナル", systemImage: "circle")
                }
            
            VisualEffectSampleView()
                .tabItem {
                    Label("VisualEffect", systemImage: "circle")
                }
            BokehBlurSampleView()
                .tabItem {
                    Label("ボケブラー効果", systemImage: "circle")
                }
            
            GaussianBlur2View()
                .tabItem {
                    Label("ガウシアンブラー効果 弱", systemImage: "circle")
                }
            
            GaussianBlurView()
                .tabItem {
                    Label("ガウスぼかし効果", systemImage: "circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
