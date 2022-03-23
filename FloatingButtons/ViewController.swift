//
//  ViewController.swift
//  FloatingButtons
//
//  Created by 김정민 on 2022/03/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let menuButton = MenuButton()
        
        view.addSubview(menuButton)
        
        menuButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.bottom.equalTo(view.snp.bottom).inset(20)
            
        }
        
    }


}

