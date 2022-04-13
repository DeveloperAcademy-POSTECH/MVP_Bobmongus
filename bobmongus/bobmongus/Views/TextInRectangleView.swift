//
//  TextInRectangleView.swift
//  bobmongus
//
//  Created by Hyeonsoo Kim on 2022/04/12.
//

import SwiftUI

struct TextInRectangleView: View {
    var body: some View {
        ScrollView {
            Text("""
I. 개인정보의 수집 및 이용 동의서
- 이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며,
하기 목적 이외의 용도로는 사용되지 않습니다.
① 개인정보 수집 항목 및 수집·이용 목적
가) 수집 항목 (필수항목)
    - 이메일, 사진, 주소
나) 수집 및 이용 목적
    - 위치 정보 확인
② 개인정보 보유 및 이용기간
 - 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성
""")
        }
        .frame(width: 300, height: 159)
        .padding()
        .background(RoundedRectangle(cornerRadius: 6)
            .stroke(.gray, lineWidth: 0.5))
        .padding(.bottom, 5)
        
//        ZStack {
//            RoundedRectangle(cornerRadius: 8)
//                .stroke()
//                .frame(width: 300, height: 159)
//                .overlay(
//                    ScrollView {
//                        Text("""
//                I. 개인정보의 수집 및 이용 동의서
//                - 이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며,
//                하기 목적 이외의 용도로는 사용되지 않습니다.
//                ① 개인정보 수집 항목 및 수집·이용 목적
//                가) 수집 항목 (필수항목)
//                - 이메일, 사진, 주소
//                나) 수집 및 이용 목적
//                - 위치 정보 확인
//                ② 개인정보 보유 및 이용기간
//                - 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성
//                """)
//                        .padding()
//                }
//            )
//        }
    }
    
    
}

struct TextRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        TextInRectangleView()
            .environmentObject(ModelData())
    }
}
