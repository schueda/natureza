//
//  UIViewController+.swift
//  natureza
//
//  Created by André Schueda on 28/11/21.
//

import Foundation
import UIKit

extension UIViewController {
    func dismissFirstVC(animated: Bool, thatMatches condition: (UIViewController) -> Bool) {
        guard let vc = self.findFirstVC(thatMatches: condition) else { return }
        vc.dismiss(animated: animated, completion: nil)
    }
    
    func findFirstVC(thatMatches condition: (UIViewController) -> Bool) -> UIViewController? {
        if condition(self) { return self }
        if parent != nil { return parent?.findFirstVC(thatMatches: condition) }
        if presentingViewController != nil { return presentingViewController?.findFirstVC(thatMatches: condition) }
        return nil
    }
}
