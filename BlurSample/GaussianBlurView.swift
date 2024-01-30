//
//  GaussianBlurView.swift
//  BlurSample
//
//  Created by 藤治仁 on 2024/01/30.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct GaussianBlurView: View {
    // オリジナルのUIImage
    let originalImage = UIImage(named: "background")!
    
    var body: some View {
        ZStack {
            // ガウスぼかし効果を適用したImageを表示
            Image(uiImage: gaussianBlur(image: originalImage))
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("ガウスぼかし効果\nテキスト")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width:200)
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    // ガウスぼかし効果を適用する関数
    func gaussianBlur(image: UIImage) -> UIImage {
        let context = CIContext(options: nil)
        let ciImage = CIImage(image: image)!
        
        // ガウスぼかし（Gaussian blur）フィルタの適用
        let blurFilter = CIFilter.gaussianBlur()
        blurFilter.inputImage = ciImage
        blurFilter.radius = 10 // ブラーの強度を調整
        
        // フィルタ処理後の画像を取得
        let outputCIImage = blurFilter.outputImage!
        let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent)!
        
        return UIImage(cgImage: cgImage)
    }
}

#Preview {
    GaussianBlurView()
}
