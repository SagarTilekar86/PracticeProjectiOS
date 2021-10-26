//
//  NameTextFieldView.swift
//  PracticeProject
//
//  Created by Sagar Tilekar on 25/10/21.
//

import SwiftUI

struct NameTextFieldView: View {
    @State var originalName: String = ""
    @Binding var displayName: String?
    @State var enterPressed: Bool = false
    
    var body: some View {
        TextField("Full Name",
                  text: $originalName,
                  onEditingChanged: { isEditing in
                    if isEditing {
                        enterPressed = false
                    }
                  },
                  onCommit: {
                    enterPressed = true
                  })
            .onChange(of: originalName) { newValue in
                displayName = getModifiedString(newValue, enterPressed: enterPressed)
            }
            .onChange(of: enterPressed) { newValue in
                displayName = getModifiedString(originalName, enterPressed: newValue)
            }
    }
    
    private func getModifiedString(_ text: String, enterPressed: Bool = false) -> String {
        guard !text.isEmpty else { return "" }
        let capitalizedString = text.capitalized
        let strings = capitalizedString.split(separator: " ")
        let wordCount = strings.count
        //This is for when user press enter
        if wordCount == 2, enterPressed {
            let firstName = getMiddleUppercasedString(String(strings[0]))
            let lastName = getMiddleUppercasedString(String(strings[1]))
            return firstName + lastName
            
        } else if wordCount == 2 { //For first letter should be capital
            
            let firstName = getMiddleUppercasedString(String(strings[0]))
            let lastName = String(strings[1])
            return firstName + lastName
            
        } else if wordCount == 1, capitalizedString.last == " " { //For first name
            
            return getMiddleUppercasedString(String(strings[0]))
            
        } else {
            return capitalizedString // default first word
        }
    }
    
    private func getMiddleUppercasedString(_ text: String) -> String {
        guard !text.isEmpty else { return "" }
        let middleIndex = text.count / 2
        if text.count.isMultiple(of: 2) { // This is for even word
            let middleIndices = (middleIndex - 1, middleIndex)
            let newValue = text.enumerated().map { index, value -> Character in
                if index == middleIndices.0 || index == middleIndices.1 {
                    return Character(value.uppercased())
                } else {
                    return value
                }
            }
            return String(newValue)
        } else { // This is for odd word
            let newValue = text.enumerated().map { index, value -> Character in
                if index == middleIndex {
                    return Character(value.uppercased())
                } else {
                    return value
                }
            }
            return String(newValue)
        }
    }
}
