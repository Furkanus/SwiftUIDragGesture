//
//  ContentView.swift
//  Deneme
//
//  Created by Fureloper on 1/26/21.
//

import SwiftUI

extension Color {
    static let background = Color(red : 08 / 255, green : 51 / 255 , blue : 100 / 255)
}


struct ContentView: View {
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var color : Color = .red
    @State private var isDragging : Bool = false
    @State private var isDraggingText = ""
   // @State private var isVisible : Bool = false
    
    var body: some View {
        ZStack {
            Color.background
            .edgesIgnoringSafeArea(.all)
            .scaleEffect(1.2)
            Text("Not dragging")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .position(x: 200, y: 90)
                .zIndex(2)
                .opacity(isDragging ? 0 : 1)
            
            Text("Now Dragging")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .position(x: 200, y: 90)
                .zIndex(2)
                .opacity(isDragging ? 1 : 0)
            
        Circle()
               .frame(width: 100, height: 100)
            .foregroundColor(self.color)
               .offset(x: self.currentPosition.width, y: self.currentPosition.height)
            
               .gesture(DragGesture()
                   .onChanged { value in
                    self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                        
                    self.isDragging = true
                        
               }
                   .onEnded { value in
                       self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                    self.color = .green
                    self.isDragging = false
                       print(self.newPosition.width)
                       self.newPosition = self.currentPosition
                   }
           )
           
           
       }
        
    }
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
