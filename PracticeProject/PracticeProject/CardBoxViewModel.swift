//
//  CardBoxViewModel.swift
//  PracticeProject
//
//  Created by Sagar Tilekar on 23/11/21.
//

import Foundation

struct CardBoxViewModel {
    func modifyCardNumber(_ text: String) -> String {
        var text = text
        if text.count > 19 {
            text.removeLast()
        } else {
            text = text.group(every: 4, with: " ")
        }
        return text
    }
    func modifyExpiryDate(_ text: String) -> String {
        var text = text
        if text.count > 5 {
            text.removeLast()
        } else {
            text = text.group(every: 2, with: "/")
        }
        return text
    }
    func modifySecurityCode(_ text: String) -> String {
        var text = text
        if text.count > 3 {
            text.removeLast()
        }
        return text
    }
}
