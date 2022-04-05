//
//  ContentView.swift
//  Memorize
//
//  Created by Terry Koo on 2022/04/03.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🐶", "🐱", "🐯", "🐮","🐭", "🐼","🐻‍❄️","🐨","🦁","🐷","🐸","🐵","🐔","🐧","🐦","🦆","🐥", "🦅", "🦉", "🦇"   ]
    @State var emojiCount = 12
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .font(.largeTitle)
    }
       

    
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            VStack{
                Image(systemName: "minus.circle")
            }
        }
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            VStack{
                Image(systemName: "plus.circle")
            }
        })
    }
    
}




struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
         ZStack {
             let shape = RoundedRectangle(cornerRadius: 20)
             if isFaceUp {
                 shape.fill(.white)
                 shape.strokeBorder(lineWidth: 3)
                 Text(content).font(.title)
             } else {
                 RoundedRectangle(cornerRadius: 20)
                     .fill(.red)
                 
             }
             
        }
         .onTapGesture {
             isFaceUp = !isFaceUp
         }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
            
    }
}
