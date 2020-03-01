//
//  ResizableImageViewController.swift
//  ImageStudy
//
//  Created by 김정민 on 2020/03/01.
//  Copyright © 2020 kjm. All rights reserved.
//

import UIKit

class ResizableImageViewController: UIViewController {
    
    /*
        Resiziable Image
     1. Assets에서 Show Slicing 을 통해 리사이징을 할수도 있음(이건 강의를 다시 보거나 구글갓한테 검색해서 천천히 해보기)
     2. 코드를 통해 Resizing 구현
     
     */

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // resizing 코드로 구현 (2)
        let capInset = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
        // resizing mode 가지 해줘야 정상적으로 화면에 출력됨
        let img = #imageLiteral(resourceName: "btn").resizableImage(withCapInsets: capInset, resizingMode: .stretch)
        btn.setBackgroundImage(img, for: .normal)
        
    }
    

}
