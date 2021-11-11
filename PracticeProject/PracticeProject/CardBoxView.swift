//
//  CardBoxView.swift
//  PracticeProject
//
//  Created by Sagar Tilekar on 11/11/21.
//

import SwiftUI

struct CardBoxView: View {
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var securityCode: String = ""
    
    var body: some View {

        print(cardNumber)
        print(expiryDate)
        print(securityCode)
        //Card Box View
        return VStack(alignment: .leading, spacing:0) {
            CardNumberTextField(cardNumber: $cardNumber)
            Divider().background(Color.gray)
            HStack(spacing: 0) {
                ExpiryDateTextField(expiryDate: $expiryDate)
                Divider().background(Color.gray)
                SecurityCodeTextField(securityCode: $securityCode)
            }
            .fixedSize(horizontal: false, vertical: true)
        }
        .overlay(
            RoundedRectangle(cornerRadius:5.0)
                .stroke(Color(UIColor.gray), lineWidth:0.5)
        )
        .padding(.horizontal)
    }
}

//CardNumber TextField
struct CardNumberTextField: View {
    @Binding var cardNumber:String
    var body: some View{
        TextField("Card number", text: $cardNumber)
            .padding(.vertical,10.0)
            .padding(.horizontal,5.0)
    }
}

//ExpiryDate TextField
struct ExpiryDateTextField: View {
    @Binding var expiryDate:String
    var body: some View{
        TextField("Exp.date(mm/yy)", text: $expiryDate)
            .padding(.vertical,10.0)
            .padding(.horizontal,5.0)
    }
}

//Security Code TextField
struct SecurityCodeTextField: View {
    @Binding var securityCode:String
    var body: some View{
        TextField("Security Code", text: $securityCode)
            .padding(.vertical,10.0)
            .padding(.horizontal,5.0)
    }
}

struct CardBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CardBoxView()
    }
}