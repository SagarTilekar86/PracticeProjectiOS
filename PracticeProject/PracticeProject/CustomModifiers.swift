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
    func applyCardFieldModifier() -> some View {
          // This allows returning a different 'custom' modifier created by customer (for now it returns `CardFieldModifier`)
        return modifier(CardFieldModifier())
      }
    
}

struct CardFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(.vertical,10.0)
            .padding(.horizontal,5.0)
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
                    .stroke(Color(UIColor.gray), lineWidth:0.5)
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
            .background(Color.gray)
    }
}

/*End**/

/*Below is for UImage Modifier**/
//extension UIImageView {
//    func applyViewImageModifier() -> some View {
//      return modifier
//
//    }
//}
//
//struct UIImageModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .padding(.all)
//    }
//}
/*End**/
