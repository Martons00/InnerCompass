//
//  BallonView.swift
//  WWDC_Flavio
//
//  Created by Raffaele Martone on 18/04/23.
//

import SwiftUI

struct BallonView: View {
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder
    }
    
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    
    @State var op = 0.0
    @State var indexT = 0
    @State var indexMas = 0
    
    
    let index : Int
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            ZStack{
                HStack{
                    
                    VStack{
                        Spacer()
                    }
                    .frame(width: 30 * CGFloat(fontSizerForDevice()),height: 200 * CGFloat(fontSizerForDevice()))
                    VStack{
                        VStack{
                            Spacer()
                        }
                        .frame(width: 30 * CGFloat(fontSizerForDevice()),height: 50 * CGFloat(fontSizerForDevice()))
                        switch index {
                        case 0:
                            Image("Nord")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .opacity(op)
                                .animation(.easeInOut)
                                .frame(width: 250 * CGFloat(fontSizerForDevice()),height: 160 * CGFloat(fontSizerForDevice()))
                                .padding()
                        case 45:
                            Image("NordE")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .opacity(op)
                                .animation(.easeInOut)
                                .frame(width: 250 * CGFloat(fontSizerForDevice()),height: 160 * CGFloat(fontSizerForDevice()))
                                .padding()
                        case 90:
                            Image("Est")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .opacity(op)
                                .animation(.easeInOut)
                                .frame(width: 250 * CGFloat(fontSizerForDevice()),height: 160 * CGFloat(fontSizerForDevice()))
                                .padding()
                        case 135:
                            Image("SudE")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .opacity(op)
                                .animation(.easeInOut)
                                .frame(width: 250 * CGFloat(fontSizerForDevice()),height: 160 * CGFloat(fontSizerForDevice()))
                                .padding()
                        case 180:
                            Image("Sud")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .opacity(op)
                                .animation(.easeInOut)
                                .frame(width: 250 * CGFloat(fontSizerForDevice()),height: 160 * CGFloat(fontSizerForDevice()))
                                .padding()
                        case 225:
                            Image("SudW")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .opacity(op)
                                .animation(.easeInOut)
                                .frame(width: 250 * CGFloat(fontSizerForDevice()),height: 160 * CGFloat(fontSizerForDevice()))
                                .padding()
                        case 270:
                            Image("West")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .opacity(op)
                                .animation(.easeInOut)
                                .frame(width: 250 * CGFloat(fontSizerForDevice()),height: 160 * CGFloat(fontSizerForDevice()))
                                .padding()
                        case 315:
                            Image("NordW")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .opacity(op)
                                .animation(.easeInOut)
                                .frame(width: 250 * CGFloat(fontSizerForDevice()),height: 160 * CGFloat(fontSizerForDevice()))
                                .padding()
                        default:
                            Text("Error")
                        }
                        
                        Image("M\(indexMas)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .animation(.easeInOut(duration: 0.3))
                            .frame(width: 70 * CGFloat(fontSizerForDevice()),height: 70 * CGFloat(fontSizerForDevice()))
                    }
                    VStack{
                        Button(action: {
                            self.viewController?.present(style: .fullScreen, transitionStyle: .crossDissolve) {
                                ContentView()
                            }}) {
                                Image("co")
                                    .resizable()
                                    .opacity(op)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30 * CGFloat(fontSizerForDevice()),height: 30 * CGFloat(fontSizerForDevice()))
                            }
                        Spacer()
                    }
                    .frame(width: 10 * CGFloat(fontSizerForDevice()),height: 250 * CGFloat(fontSizerForDevice()))
                }
            }
        }
        .onReceive(timer) { time in
            indexT = indexT + 1
            
            if indexT > 5 {
                indexMas = 1
                if indexT > 10 {
                    op = op + 0.08
                }
            }
        }
        
    }
}

struct BallonView_Previews: PreviewProvider {
    static var previews: some View {
        BallonView(index: 0)
    }
}
