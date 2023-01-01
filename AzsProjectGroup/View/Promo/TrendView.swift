//
//  TrendView.swift
//  AzsTabBar
//
//  Created by geka231 on 26.12.2022.
//

import SwiftUI
import ScalingHeaderScrollView

struct TrendView: View {
    @State var data = promoCards
    @State private var showSheet = false
    @State var progress: CGFloat = 0
    var body: some View{
        NavigationView{
            ScrollView{
                VStack(spacing: 10) {
                    HStack {
                        Text("Акции")
                            .multilineTextAlignment(.leading)
                            .font(.system(.title,design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer( )
                    }
                    .padding(.leading,25)
                    
                    VStack(spacing: 20) {
                        ForEach(data){
                            item in
                            Button{
                                showSheet.toggle()
                            }label: {
                                PromoView(trendingPromo: item)
                            }.sheet(isPresented: $showSheet, content: {
                                PromoOpen(promo: item)
                            })
                        }
                    }.padding()
                    
                }
                Spacer(minLength: 70)
            }
        }
    }
    
}


struct TrendView_Previews: PreviewProvider {
    static var previews: some View {
        TrendView()
    }
}

