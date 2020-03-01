//
//  CustomImageDrawingViewController.swift
//  ImageStudy
//
//  Created by 김정민 on 2020/03/01.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit


/*
    Custom Image Drawing
 1. 일반 뷰에(이미지뷰가 아닌) 이미지를 그리는 것 처럼 표시할 수 있음
 */

class CustomDrawingView : UIView{
    // 출력할 이미지 설정 (1)
    let cloverImg = #imageLiteral(resourceName: "clover")
    let bellImg = #imageLiteral(resourceName: "bell")
    let plantImg = #imageLiteral(resourceName: "plant")
    
    // 이미지를 그리는 draw 메서드 (1)
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        cloverImg.draw(at: CGPoint(x: 0, y: 0)) // 원본크기로 그려짐
        bellImg.draw(in: CGRect(x: 0, y: 80, width: 100, height: 100))  // 지정된 프레임에 맞춰서 그려짐
        plantImg.drawAsPattern(in: rect)    // 지정된 프레임에서 출력하고, 프레임 크기보다 이미지가 작으면 패턴 형태로 출력해줌
    }
}

class CustomImageDrawingViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
