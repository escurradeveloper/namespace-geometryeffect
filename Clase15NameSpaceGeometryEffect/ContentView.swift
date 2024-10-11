//
//  ContentView.swift
//  Clase15NameSpaceGeometryEffect
//
//  Created by Escurra Colquis on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var nameSpaceFigure
    @State private var isDraw = false
    
    var body: some View {
        VStack {
            Text(isDraw ? "Cuadrado" : "Círculo")
                .bold()
                .foregroundStyle(isDraw ? .indigo : .green)
                .font(.system(size: 40))
                .padding(.top, 20)
            Spacer()
            
            if isDraw {
                Rectangle()
                    .matchedGeometryEffect(id: "figure", in: nameSpaceFigure)
                    .frame(width: 200, height: 200)
                    .clipShape(.rect(cornerRadius: 10))
                    .foregroundStyle(.indigo)
                    .onTapGesture {
                        withAnimation(.bouncy(duration: 2.0)) {
                            isDraw.toggle()
                        }
                    }
            } else {
                Circle()
                    .matchedGeometryEffect(id: "figure", in: nameSpaceFigure)
                    .frame(width: 300, height: 400)
                    .foregroundStyle(.green)
                    .onTapGesture {
                        withAnimation(.bouncy(duration: 2.0)) {
                            isDraw.toggle()
                        }
                    }
            }
            
            Button(isDraw ? "Clik aquí para cambiar a Círculo" : "Clik aquí para cambiar a Cuadrado") {
                isDraw.toggle()
            }
            .font(.system(size: 30))
            .tint(.red)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
