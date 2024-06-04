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
    var word: String
    var color: Color
    var date: String
}

struct HomeView: View {

    @StateObject var homeVM = HomeViewModel()
    @State var mainCards: [MainCard] = [
        MainCard(id: 0, isOpened: true, word: "모집인원 0명", color: Color(uiColor: .dGreen), date: "Today"),
        MainCard(id: 1, isOpened: false, word: "심심한 사과", color: Color(uiColor: .dRed), date: "Yesterday"),
        MainCard(id: 2, isOpened: false, word: "결재", color: Color(uiColor: .dGreen), date: "3 days ago")
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
            VStack {
                HStack {
                    Image(.logo)
                    Spacer()
                    VStack(spacing: 0) {
                        Button {

                        } label: {
                            Image(.record)
                            Text("기록보기")
                                .foregroundStyle(.white)
                                .font(.custom(.pretendardMedium, ofSize: 12))
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                Spacer()
            }
        }
    }

    func card(index: Int) -> some View {
        let isOpened = $mainCards[index].isOpened
        return RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(Color.black)
            .frame(height: isOpened.wrappedValue ? 360 : 80)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 1)
            )
            .padding(.horizontal, 20)
            .overlay {
                VStack(spacing: 0) {
                    HStack {
                        Text(mainCards[index].date)
                            .foregroundStyle(Color(uiColor: .p200))
                            .font(.custom(.pretendardSemiBold, ofSize: 16))
                        Spacer()
                    }
                    .padding(.top,  22)
                    .padding(.leading, 46)
                    .offset(y: CGFloat(mainCards[index].isOpened ? 0 : -20))
                    if isOpened.wrappedValue {
                        HStack {
                            Text("너")
                                .foregroundStyle(.white)
                                .font(.custom(.pretendardBold,
                                              ofSize: 64))
                                .padding(.trailing, 4)
                            Rectangle()
                                .foregroundStyle(mainCards[index].color)
                                .frame(width: 195, height: 78)
                                .overlay {
                                    Text(mainCards[index].word)
                                        .foregroundStyle(Color.white)
                                        .font(.custom(FontName.slowFonts.rawValue, size: 58))
                                }
                                .rotationEffect(.degrees(-9))
                                .offset(y: -15)
                        }
                        .padding(.top, 60)

                        Text("이거 알아?")
                            .foregroundStyle(.white)
                            .font(.custom(.pretendardBold,
                                          ofSize: 64))
                        Spacer()
                        Button {
                            /// 다음 화면으로 전환
                        } label: {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(Color(uiColor: .p500))
                                .frame(width: 220, height: 46)
                                .overlay {
                                    Text("퀴즈 풀러 가기")
                                        .font(.custom(.pretendardSemiBold, ofSize: 20))
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
