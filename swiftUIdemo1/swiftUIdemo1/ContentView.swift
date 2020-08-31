//
//  ContentView.swift
//  swiftUIdemo1
//
//  Created by Admin on 2020/8/24.
//  Copyright © 2020 Admin. All rights reserved.
//

import SwiftUI

/**
 Text("你好, 中国!")
 .font(Font.system(size: 25))
 .foregroundColor(.white)
 .background(Color("greenC")) //在asset里面添加常用的颜色色值，跟图片类似
 
 */


struct ContentView: View {
    let pad : [[CalcultorUnitEnum]] = [
        [.common(.clear),.common(.flip),.common(.percent),.op(.minus)],
        [.digite(7),.digite(8),.digite(9),.op(.multiply)],
        [.digite(4),.digite(5),.digite(6),.op(.divide)],
        [.digite(1),.digite(2),.digite(3),.op(.add)],
        [.digite(0),.dot,.op(.equal)]
    ]
    
    @State private var brian : CalculatorBrain = .left("1")
    var body: some View {
        //modifier 修饰
//        HStack {
//            CustomBtn(
//            foregroundColor: .white,
//            bacgroundColor: .blue,
//            title: "1",
//            size: CGSize(width: 88, height: 88))
//            {
//                print("click one")
//            }
//
//            CustomBtn(
//            foregroundColor: .white,
//            bacgroundColor: .blue,
//            title: "2",
//            size: CGSize(width: 88, height: 88))
//            {
//                print("click two")
//            }
//
//            CustomBtn(
//            foregroundColor: .white,
//            bacgroundColor: .blue,
//            title: "3",
//            size: CGSize(width: 88, height: 88))
//            {
//                print("click three")
//            }
//        }
        
//        HStack {
//            ForEach(row,id: \.self) {
//                CustomBtn(
//                bacgroundColorName:$0.bacgroundColorName ,
//                title: $0.title,
//                size: $0.size)
//                {
//
//                }
//            }
//
//        }
        
        //计算栏
        VStack(spacing:12) {
            //允许在我们的body 中，可以加入一个Spacer 来把VStack 的上半部分全部填满
            Spacer()
            Text(brian.output)
                .font(Font.system(size: 60))
                .foregroundColor(.black)
                .frame(minWidth: 0,  maxWidth:.infinity, alignment: .trailing)
                .padding(.trailing,24)
                .lineLimit(1)
            //操作键盘
            Button("Click") {
                self.brian = .left("330")
            }
            
            CalcultorViewPad()
                .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView().previewDevice("iPhone SE")
    }
}



//MARK: -- 自定义按钮试图 --
struct CalcultorViewPad: View {
    
    let scale: CGFloat = UIScreen.main.bounds.width / 414

    let pad : [[CalcultorUnitEnum]] = [
           [.common(.clear),.common(.flip),.common(.percent),.op(.minus)],
           [.digite(7),.digite(8),.digite(9),.op(.multiply)],
           [.digite(4),.digite(5),.digite(6),.op(.divide)],
           [.digite(1),.digite(2),.digite(3),.op(.add)],
           [.digite(0),.dot,.op(.equal)]
       ]
    
    var body: some View {
        VStack(spacing: 8){
            ForEach(pad,id: \.self) {
                CalcultorViewRow(row: $0)
            }
        }
        .scaleEffect(scale) //View 提供了.scaleEffect modifier 来进行缩放
    }
}
//横向子view
struct CalcultorViewRow:View {
    let row : [CalcultorUnitEnum]
    var body: some View {
        HStack {
            ForEach(row,id: \.self) {
                CustomBtn(
                    bacgroundColorName:$0.bacgroundColorName ,
                    title: $0.title,
                    size: $0.size)
                {
                    
                }
            }
            
        }
    }
}

struct CustomBtn: View {
    let fontsize :CGFloat = 30
    let foregroundColorName: String = "whiteC"
    let bacgroundColorName : String
    let title: String
    let size: CGSize
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontsize))
                .foregroundColor(Color(foregroundColorName))
                .frame(width: size.width, height: size.height)
                .background(Color(bacgroundColorName))
                .cornerRadius(size.width / 2)
        }
    }
}


