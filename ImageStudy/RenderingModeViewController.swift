//
//  RenderingModeViewController.swift
//  ImageStudy
//
//  Created by 김정민 on 2020/03/01.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class RenderingModeViewController: UIViewController {

    /*
        Image Rendering Mode
     1. assets에서 Rendering mode를 세개 선택 할 수 있음
     --> Default는 말그대로 기본, Original은 원본이미지 그대로
     --> Template은 색있는 부분은 tint색으로 채움
     2. Image View에서 템플릿 이미지를 보여주기 위해 별도의 처리가 필요함
     
     */
    
    @IBOutlet weak var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image View 에서 템플릿 이미지 보여주기 (2)
        let img = #imageLiteral(resourceName: "clover").withRenderingMode(.alwaysTemplate)
        ImageView.image = img
    }
}
