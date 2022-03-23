//
//  MenuButton.swift
//  FloatingButtons
//
//  Created by 김정민 on 2022/03/22.
//

import UIKit
import SnapKit

class MenuButton: UIView {
    
    private var menuButton: UIButton!
    private var menuStack: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addMenuButton()
        addMenuStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MenuButton {
    private func addMenuButton() {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "tray", withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
        
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        
        addSubview(button)
        
        button.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).priority(.low)
            make.leading.equalTo(self.snp.leading)
            make.bottom.equalTo(self.snp.bottom)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        button.addTarget(self, action: #selector(tapMenuButton), for: .touchUpInside)
        menuButton = button
        
    }
    
    @objc private func tapMenuButton() {
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: [] ,
                       animations: { [weak self] in
            self?.menuStack.arrangedSubviews.forEach { button in
                button.isHidden = !button.isHidden
            }
            self?.menuStack.layoutIfNeeded()
        },completion: nil )
        
    }
    
    private func addMenuStack() {
        let stack = UIStackView()
        stack.axis = .vertical
        
        let buttonImageNames = ["pencil","person.fill","photo","bubble.left.and.bubble.right"]
        
        buttonImageNames.forEach { imageName in
            let button = UIButton(type: .system)
            let image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
            
            button.setImage(image, for: .normal)
            stack.addArrangedSubview(button)
            button.isHidden = true
            button.tintColor = .brown
        }
        
        addSubview(stack)
        
        stack.snp.makeConstraints { make in 
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(menuButton.snp.top).offset(-8)
            make.top.equalTo(self.snp.top).priority(.high)
        }
        menuStack = stack
        
    }
}
