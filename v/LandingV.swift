//
//  LandingV.swift
//  nws
//
//  Created by macproo on 2020/03/18.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct LandingV: View {
    
    let title = "최신 뉴스를 제공합니다.\r뉴스의 키워드를 알아보세요"

    var body: some View {
        ZStack {

            //  BG
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Spacer()
                newsIconImgs()
                Spacer()
                Text(title)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                Spacer()
                VersionView()
                
            }   /// vstack end
        }
    }
}

struct newsIconImgs: View {
    
    let circleImgWidth: CGFloat = 200
    let circleImgHeight: CGFloat = 200
    let ratioCirclePerSubIcon: CGFloat = 3
    let ratioCirclePerNewsIcon: CGFloat = 2
    let radiusCircleShadow: CGFloat = 10
    let angleNewsIconRotation: Double = 20
    let angleRSSIconRotation: Double = 45
    let thickCircleStroke: CGFloat = 3
    
    var body: some View {
        
        HStack (alignment: .bottom) {
            
            //  rss img
            Image(systemName: "wifi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                    width: circleImgWidth / ratioCirclePerSubIcon
                    , height: circleImgHeight / ratioCirclePerSubIcon )
                .rotationEffect(.degrees(angleRSSIconRotation))
            
            //  news icon img
            ZStack {
                
                Color.gray.opacity(0.1)
                    .frame(width: circleImgWidth, height: circleImgHeight)
                    .clipShape(Circle())
                    .shadow(radius: radiusCircleShadow)
                    .overlay(Circle().stroke( Color.gray, lineWidth: thickCircleStroke))
                
                Image(systemName: "text.bubble")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: circleImgWidth / ratioCirclePerNewsIcon, height: circleImgHeight / ratioCirclePerNewsIcon)
                    .rotation3DEffect(.degrees(angleNewsIconRotation), axis: (x: 1, y: 0, z: 0))
                
            }   //  zstack end
            
            //  globe img
            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                    width: circleImgWidth / ratioCirclePerSubIcon
                    , height: circleImgHeight / ratioCirclePerSubIcon )
            
        }
    }
}

struct VersionView: View {
    
    let strVersion = "v: \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "")"
    var body: some View {
        Text(strVersion)
            .font(.headline)
            .foregroundColor(.gray)
            .opacity(0.5)
            .padding(.bottom)
    }
}


struct LandingV_Previews: PreviewProvider {
    static var previews: some View {
        LandingV()
    }
}
