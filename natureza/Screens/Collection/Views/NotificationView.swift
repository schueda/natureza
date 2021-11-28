//
//  NotificationView.swift
//  natureza
//
//  Created by André Schueda on 22/11/21.
//

import UIKit

class NotificationView: UIView {
    lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.onTintColor = .tintColor
        return toggle
    }()
    
    lazy var timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle = .compact
        return picker
    }()
    
    lazy var repetitionButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle(" Repetir, frequência ", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStack()
        
        [
            timePicker,
            repetitionButton,
            toggle
        ].forEach { contentStack.addArrangedSubview($0) }
    }
    
    private func setupStack() {
        addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
