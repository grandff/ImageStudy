//
//  ImageResizingViewController.swift
//  ImageStudy
//
//  Created by 김정민 on 2020/03/01.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class ImageResizingViewController: UIViewController {

    /*
     Image Resizing
     1. 이미지가 너무 큰 경우 사이즈를 조절할 수 있는데 Context와 Bitmap 두가지가 있음
    2. 방법을 선택한 후 viewdidload에서 호출해야함
     */
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // resize 호출 (2)
        let targetImage = #imageLiteral(resourceName: "photo")
        let size = CGSize(width: targetImage.size.width / 5, height: targetImage.size.height / 5)   // 1/5 로 축소
        
        // 이미지 컨텍스트 사용
        imageView.image = resizingWithImageContext(image: targetImage, to: size)
        // 이미지 비트맵 사용
        imageView.image = resizingWithBitmapContext(image: targetImage, to: size)
    }

}

// context resizing (1)
extension ImageResizingViewController{
    // resize할 이미지와 크기를 파라미터로 받아서 처리
    func resizingWithImageContext(image : UIImage, to size : CGSize) -> UIImage?{
        // 임시 그림판을 생성하는 메서드임
        // 이미지에 투명한 부분이 있다면 opaque에 false를 전달해야함
        // scale은 0.0을 전달하면 디바이스 스케일 그대로 사용함
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        
        // 이미지를 프레임 내부에 그려줘야함
        let frame = CGRect(origin: CGPoint.zero, size: size)
        image.draw(in: frame)
        
        // resize image
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext() // context 가져온 후 꼭 해줘야함
        return resultImage
    }
}

// bitmap resizing (2)
extension ImageResizingViewController{
    func resizingWithBitmapContext(image : UIImage, to size : CGSize) -> UIImage?{
        guard let cgImage = image.cgImage else{return nil}
        
        // 비트맵까지 알아가기엔 너무 어려우므로 이렇게 쓴다는 것만 알긔
        let bpc = cgImage.bitsPerComponent
        let bpr = cgImage.bytesPerRow
        let colorSpace = cgImage.colorSpace!
        let bitmapInfo = cgImage.bitmapInfo
        
        // 첫번째 파라미터는 nil을 전달하면 자동으로 처리
        guard let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: bpc, bytesPerRow: bpr, space: colorSpace, bitmapInfo: bitmapInfo.rawValue) else {return nil}
        
        // 이미지 품질저하를 최소화
        context.interpolationQuality = .high
        
        let frame = CGRect(origin: CGPoint.zero, size: size)
        context.draw(cgImage, in: frame)
        
        guard let resultImage = context.makeImage() else{
            return nil
        }
        
        return UIImage(cgImage: resultImage)
        
    }
}
