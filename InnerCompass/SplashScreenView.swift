//
//  SplashScreenView.swift
//  InnerCompass
//
//  Created by Raffaele Martone on 22/05/23.
//

import SwiftUI

struct SplashScreenView: View {
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder
    }
    
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    
    @State var scale  = 0.3
    @State var op = 1.0

    var body: some View {
        ZStack{
            Image("sfondo")
                .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
            Image("title")
                .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea(.all)
                    .scaleEffect(scale)
                    .opacity(op)
                    .animation(.easeInOut)
        }
        
        .onReceive(timer) { time in
            
            if scale > 0.5 {
                self.viewController?.present(style: .fullScreen, transitionStyle: .crossDissolve) {
                    ContentView()
                }}else{
                    scale = scale + 0.01
                    if scale > 0.4{
                        op = op - 0.1
                    }
                }
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
