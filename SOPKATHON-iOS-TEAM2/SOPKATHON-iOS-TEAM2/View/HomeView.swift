//
//  HomeView.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/18/24.
//

import SwiftUI

struct MainCard: Identifiable {
    let id: Int
    var isOpened: Bool
}

struct HomeView: View {

    @State var mainCards: [MainCard] = [
        MainCard(id: 0, isOpened: true),
        MainCard(id: 1, isOpened: false),
        MainCard(id: 2, isOpened: false)
    ]

    var body: some View {
        ZStack {
            Color(uiColor: UIColor(hexCode: "222222")).ignoresSafeArea()
            VStack(spacing: 0) {
                ScrollView {
                    ForEach(mainCards.indices.reversed(), id: \.self) { index in
                        card(index: index)
                    }
                }
                .padding(.top, 120)
            }
        }
    }

    func card(index: Int) -> some View {
        let isOpened = $mainCards[index].isOpened

        return RoundedRectangle(cornerRadius: 12)
            .frame(height: isOpened.wrappedValue ? 360 : 80)
            .padding(.horizontal, 20)
            .shadow(radius: 4)
            .foregroundStyle(Color(UIColor(hexCode: "D9D9D9")))
            .overlay {
                if isOpened.wrappedValue {
                    VStack {
                        Text("너 모집인원 0명\n이거 알아?")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 40)
                        Spacer()
                        Button {
                            /// 다음 화면으로 전환
                        } label: {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(Color(uiColor: UIColor(hexCode: "535353")))
                                .frame(width: 220, height: 46)
                                .overlay {
                                    Text("퀴즈 풀러 가기 CTA")
                                        .font(.system(size: 20,
                                                      weight: .bold))
                                        .tint(.white)
                                }
                                .padding(.bottom, 40)
                        }
                    }
                }
            }
            .offset(y: CGFloat(isOpened.wrappedValue ? 0 : 20 * index))
            .onTapGesture {
                withAnimation {
                    for i in mainCards.indices {
                        mainCards[i].isOpened = false
                    }
                    mainCards[index].isOpened.toggle()
                }
            }
    }
}

#Preview {
    HomeView()
}
