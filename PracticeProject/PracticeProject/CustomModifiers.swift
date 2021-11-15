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
    func applyVStackModifier() -> some View {
        return modifier(VStackModifier())
    }
}

struct VStackModifier: ViewModifier {
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
    func applyHStackModifier() -> some View {
        return modifier(HStackModifier())
    }
}

struct HStackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fixedSize(horizontal: false, vertical: true)
    }
}
/*End **/
