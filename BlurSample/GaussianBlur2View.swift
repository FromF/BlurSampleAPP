//
//  GaussianBlur2View.swift
//  BlurSample
//
//  Created by 藤治仁 on 2024/01/28.
//

import SwiftUI

struct GaussianBlur2View: View {
    // オリジナルのUIImage
    let originalImage = UIImage(named: "background")!
    
    var body: some View {
        ZStack {
            // フロストガラス効果を適用したImageを表示
            Image(uiImage: frostEffect(image: originalImage))
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("ガウシアンブラー効果 弱\nテキスト")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width:200)
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    // フロストガラス効果を適用する関数
    func frostEffect(image: UIImage) -> UIImage {
        let context = CIContext(options: nil)
        let ciImage = CIImage(image: image)!
        
        // ガウシアンブラー（Gaussian blur）フィルタの適用
        let blurFilter = CIFilter.gaussianBlur()
        blurFilter.inputImage = ciImage
        blurFilter.radius = 5 // ブラーの強度を調整
        
        // 色調の調整
        // let colorControlsFilter = CIFilter.colorControls()
        // colorControlsFilter.inputImage = blurFilter.outputImage
        // colorControlsFilter.saturation = 0.1 // 彩度を下げる
        // colorControlsFilter.brightness = 0.1 // 明るさを調整
        // colorControlsFilter.contrast = 1.1 // コントラストを調整
        
        // フィルタ処理後の画像を取得
        let outputCIImage = blurFilter.outputImage!
        let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent)!
        
        return UIImage(cgImage: cgImage)
    }
}

#Preview {
    GaussianBlur2View()
}
