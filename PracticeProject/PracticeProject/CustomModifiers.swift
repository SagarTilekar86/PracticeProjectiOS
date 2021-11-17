//
//  CustomModifiers.swift
//  PracticeProject
//
//  Created by Sagar Tilekar on 14/11/21.
//

import Foundation
import SwiftUI

/* Below logic implementation is for TexField*/
extension TextField {
    func applyCardFieldModifier(verticalPadding: CGFloat = 10.0, horizontalPadding: CGFloat = 5.0) -> some View {
          // This allows returning a different 'custom' modifier created by customer (for now it returns `CardFieldModifier`)
        let cardModifier = CardFieldModifier(verticalPadding: verticalPadding, horizontalPadding: horizontalPadding)
        return modifier(cardModifier)
      }
    
}

extension Text {
    func applyCardFieldModifier(verticalPadding: CGFloat = 10.0, horizontalPadding: CGFloat = 5.0) -> some View {
          // This allows returning a different 'custom' modifier created by customer (for now it returns `CardFieldModifier`)
        let cardModifier = CardFieldModifier(verticalPadding: verticalPadding, horizontalPadding: horizontalPadding)
        return modifier(cardModifier)
      }
    
}

struct CardFieldModifier: ViewModifier {
    
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat

    init(verticalPadding: CGFloat, horizontalPadding: CGFloat) {
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
    
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
    }
}

/*End **/

/* Below logic implementation is for VStack*/
extension VStack {
    func applyVerticalContainerModifier() -> some View {
        return modifier(VerticalContainerModifier())
    }
}

struct VerticalContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius:5.0)
                    .stroke(Color.secondary, lineWidth:0.5)
                //here we can also put Color(UIColor.systemGray)
            )
            .padding(.horizontal)
    }
}
/*End **/
  
/* Below logic implementation is for HStack*/
extension HStack {
    func applyHorizontalContainerModifier() -> some View {
        return modifier(HorizontalContainerModifier())
    }
}

struct HorizontalContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fixedSize(horizontal: false, vertical: true)
    }
}
/*End **/

/*Below is for Divider line**/
extension Divider {
    func applyViewDividerModifier() -> some View {
        return modifier(DividerModifier())
    }
}

struct DividerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.primary)
        //here we can also put Color(UIColor.systemGray)
    }
}
/*End**/

/*Below is for UImage Modifier**/
extension Image {
    func applyViewImageModifier() -> some View {
      return modifier(ImageModifier())

    }
}

struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.trailing, 10.0)
    }
}
/*End*/


//TextField with custom placeholder color
struct CustomTextField: View {
    
    var placeholder: String
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color.secondary) //here we can also put Color(UIColor.systemGray)
                .applyCardFieldModifier()
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .applyCardFieldModifier()
        }
    }
    
}
