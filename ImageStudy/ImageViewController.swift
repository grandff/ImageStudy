//
//  ImageViewController.swift
//  ImageStudy
//
//  Created by 김정민 on 2020/03/01.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    /*
        Image View 기초
     1. 코드로 이미지를 설정하려면 UIImage를 불러오거나 Image Literal로 설정할 수 있음
     2. 이미지의 픽셀을 계산하려면 size와 scale을 곱해주면 됨
     3. 이미지를 비교하려면 isEqual 사용
     4. 네트워크나 파일로 이미지 저장을 할 수 있음
     */
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 코드로 이미지 불러옴(1)
        let img1 = UIImage(named: "plant")
        let img2 = #imageLiteral(resourceName: "plant")
        
        // 이미지의 픽셀을 계산하기 위해 size와 scale확인 (2)
        let ptSize = img1?.size
        let ptScale = img1?.scale
        
        // 같은 이미지인지 비교 (3)
        if img1!.isEqual(img2){
            print("equal")
        }
        
        // 네트워크나 파일로 이미지 저장을 하기 위한 메서드들 (4)
        let pngData = UIImage.pngData(img1!)
        let jpgData = UIImage.jpegData(img1!)
    }

}
