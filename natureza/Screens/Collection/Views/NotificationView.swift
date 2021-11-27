//
//  NotificationView.swift
//  natureza
//
//  Created by André Schueda on 22/11/21.
//

import UIKit

class NotificationView: UIView {
    lazy var toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.onTintColor = .tintColor
        return toggle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupToggle()
    }
    
    private func setupToggle() {
        addSubview(toggle)
        toggle.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
