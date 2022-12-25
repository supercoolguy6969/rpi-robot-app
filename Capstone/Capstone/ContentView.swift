//
//  ContentView.swift
//  Capstone
//
//  Created by Ankar Keram on 2022-12-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            VStack{
                
                // First HStack
                HStack {
                    
                    WheelControl(up: "arrow.up.left.square",
                                 middle: "arrow.left.square",
                                 down: "arrow.down.left.square")
                    
                    WheelControl(up: "arrow.up.square",
                                 middle: "circle",
                                 down: "arrow.down.square")
                    
                    WheelControl(up: "arrow.up.right.square",
                                 middle: "arrow.right.square",
                                 down: "arrow.down.right.square")
                    
                }
                
                
                Spacer(minLength: 4)
                
                
                
                
                // Second HStack
                HStack (spacing: 10) {
                    
                    
                    MiddleButtons()
                    MiddleButtons()
                    MiddleButtons()
                    
                }
                
                
                // Third HStack
                HStack (spacing: 20) {

                    RobotControl(arrowOne: "arrowtriangle.left")
                    
                    VStack {
                        
                        Button {
                            print("action done")
                        } label: {
                            Image(systemName: "arrowtriangle.up")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            
                        }
                        
                        Button {
                            print("action done")
                        } label: {
                            Image(systemName: "circle.fill")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }
                        
                        
                        Button {
                            print("action done")
                        } label: {
                            Image(systemName: "arrowtriangle.down")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            
                        }
    
                        Spacer()
                        
                    }
                    
                  RobotControl(arrowOne: "arrowtriangle.right")
                }
                
                
                
            }
            
            
            
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct WheelControl: View {
    
    var up: String
    var middle: String
    var down: String

    var body: some View {
        VStack (spacing: 10) {
            
            Button {
                print("action done")
            } label: {
                Image(systemName: up)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            
            Button {
                print("action done")
            } label: {
                Image(systemName: middle)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            
            Button {
                print("action done")
            } label: {
                Image(systemName: down)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
        
            
            
            Spacer()
        }
    }
}




struct MiddleButtons: View {
    
    
    var body: some View {
        VStack {
            Button {
                print("action done")
            } label: {
                Image(systemName: "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }

            Spacer()
            
        }
    }
}






struct RobotControl: View {
    
    var arrowOne: String
    
    var body: some View {
        VStack {
            
            Button {
                print("action done")
            } label: {
                Image(systemName: arrowOne)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)

            }

        }
    }
}


