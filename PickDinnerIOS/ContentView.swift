//
//  ContentView.swift
//  PickDinnerIOS
//
//  Created by 小昊 on 2023/9/7.
//

import SwiftUI

struct ContentView: View {
  @State private  var res:String = "";
    let foodItems = ["披萨", "汉堡包", "寿司", "意大利面", "牛排", "炸鸡", "饺子", "炒饭", "沙拉", "牛奶酪"]
    func generateRandomFood() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(foodItems.count)))
        return foodItems[randomIndex]
    }

    var body: some View {
        VStack(alignment: .center,spacing: 30) {
            Image("food")
                .renderingMode(/*@START_MENU_TOKEN@*/.original/*@END_MENU_TOKEN@*/)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.blue)
                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .imageScale(.large)
                
            Text("今天吃什么？").bold().font(.largeTitle)
            if res != ""  {
                Text(res).bold().font(.largeTitle).foregroundColor(.green)
            }
            // 随机按钮
            Button(action: {res = generateRandomFood()},Label:{Text(res == .none?"1":"2")}) {
              
            }.font(.largeTitle).buttonStyle(.borderedProminent).foregroundColor(.white).shadow(radius: 12)
            
            // 重置按钮
            Button(action:{res = ""}) {
                Label("", systemImage: "arrow.clockwise.circle.fill")
            }.font(.largeTitle).foregroundColor(.blue).disabled(res=="")
        }
        .padding().animation(.easeInOut(duration: 1/5), value: res)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
