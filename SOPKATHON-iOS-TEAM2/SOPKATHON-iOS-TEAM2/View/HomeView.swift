//
//  HomeView.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/18/24.
//

import SwiftUI

struct MainCard: Identifiable {
    let id: Int
    let color: Color
    var isOpened: Bool
}

@available(iOS 17.0, *)
struct HomeView: View {

    @State var mainCards: [MainCard] = [
        MainCard(id: 0, color: .green, isOpened: true),
        MainCard(id: 1, color: .blue, isOpened: false),
        MainCard(id: 2, color: .yellow, isOpened: false)
    ]


    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                card(open: $mainCards[2].isOpened, index: mainCards[2].id, color: mainCards[2].color)
                card(open: $mainCards[1].isOpened, index: mainCards[1].id, color: mainCards[1].color)
                card(open: $mainCards[0].isOpened, index: mainCards[0].id, color: mainCards[0].color)
            }
            .padding(.top, 120)
        }
    }

    func card(open: Binding<Bool>, index: Int, color: Color) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(height: open.wrappedValue ? 360 : 80)
            .padding(.horizontal, 20)
            .foregroundStyle(color)
            .offset(y: CGFloat(open.wrappedValue ? 0 : 20 * index))
            .onTapGesture {
                if index != 0 {
                    withAnimation {
                        open.wrappedValue.toggle()
                    }
                }
            }
    }
}



@available(iOS 17.0, *)
#Preview {
    HomeView()
}
