//
//  BokehBlurSampleView.swift
//  BlurSample
//
//  Created by 藤治仁 on 2024/01/28.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct BokehBlurSampleView: View {
    // オリジナルのUIImage
    let originalImage = UIImage(named: "background")!
    
    var body: some View {
        ZStack {
            // ボケブラー効果を適用したImageを表示
            Image(uiImage: bokehBlur(image: originalImage))
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("ボケブラー効果\nテキスト")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
    
    // ボケブラー効果を適用する関数
    //https://developer.apple.com/documentation/coreimage/cifilter/3228277-bokehblurfilter
    func bokehBlur(image: UIImage) -> UIImage {
        let context = CIContext()
        let ciImage = CIImage(image: image)!
        
        // ボケブラー（bokeh blur）フィルタの適用
        let filter = CIFilter.bokehBlur()
        filter.inputImage = ciImage
        filter.radius = 10 // ブラーの強度を調整
        filter.ringAmount = 0.2 // リングの量を調整
        filter.ringSize = 0.2 // リングのサイズを調整
        filter.softness = 1 // ソフトネスを調整
        
        // フィルタ処理後の画像を取得
        let outputCIImage = filter.outputImage!
        let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent)!
        
        return UIImage(cgImage: cgImage)
    }}

#Preview {
    BokehBlurSampleView()
}
