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
    var images: [Image] = [
        Image(systemName: "cloud.sun"),
        Image(systemName: "cloud"),
        Image(systemName: "cloud.bolt")
    ]
    let viewModel = CardBoxViewModel()

    var body: some View {
        
        print(cardNumber)
        print(expiryDate)
        print(securityCode)
        //Card Box View
        return VStack(alignment: .leading, spacing:0) {
            VStack(alignment: .leading, spacing:0) {
                HStack(spacing: 0) {
                    // TextField("Card number",text: $cardNumber)
                    CustomTextField(placeholder:Constant.cardFieldPlaceholderText, text:  $cardNumber)
                        .onChange(of: cardNumber) { newValue in
                            cardNumber = viewModel.modifyCardNumber(newValue)
                        }
                    //.applyCardFieldModifier(text: "Card number")
                    ForEach(0..<images.count) { index in
                        images[index]
                            .applyViewImageModifier()
                    }
                }
                .applyHorizontalContainerModifier()
                Divider()
                    .applyViewDividerModifier()
                HStack(spacing: 0) {
                    //  TextField("Exp.date(mm/yy)",text: $expiryDate)
                    CustomTextField(placeholder:Constant.expiryDatePlaceholderText, text:  $expiryDate)
                        .onChange(of: expiryDate) { newValue in
                            expiryDate = viewModel.modifyExpiryDate(newValue)
                        }
                   
                    // .applyCardFieldModifier()
                    Divider()
                        .applyViewDividerModifier()
                    // TextField("Security Code",text: $securityCode)
//                    CustomTextField(placeholder:"Security Code", text:  $securityCode)
                    CustomSecureField(placeholder:Constant.securityCodePlaceholderText, text: $securityCode)
                        .onChange(of: securityCode) { newValue in
                            securityCode = viewModel.modifySecurityCode(newValue)
                        }
                        //.applyCardFieldModifier()
                }
                .applyHorizontalContainerModifier()
            }
            .applyVerticalContainerModifier()
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

/*Code Commented for Future reference**/

////CardNumber TextField
//struct CardNumberTextField: View {
//    @Binding var cardNumber:String
//    var body: some View{
//        TextField("Card number", text: $cardNumber)
//            .padding(.vertical,10.0)
//            .padding(.horizontal,5.0)
//    }
//}
//
////ExpiryDate TextField
//struct ExpiryDateTextField: View {
//    @Binding var expiryDate:String
//    var body: some View{
//        TextField("Exp.date(mm/yy)", text: $expiryDate)
//            .padding(.vertical,10.0)
//            .padding(.horizontal,5.0)
//    }
//}
//
////Security Code TextField
//struct SecurityCodeTextField: View {
//    @Binding var securityCode:String
//    var body: some View{
//        TextField("Security Code", text: $securityCode)
//            .padding(.vertical,10.0)
//            .padding(.horizontal,5.0)
//    }
//}

struct CardBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CardBoxView()
    }
}

