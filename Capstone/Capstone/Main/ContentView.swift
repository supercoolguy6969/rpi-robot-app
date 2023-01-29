//
//  ContentView.swift
//  Capstone
//
//  Created by Ankar Keram on 2022-12-21.
//

import SwiftUI
import CocoaMQTT



let mqttClient = CocoaMQTT(clientID: "Robot", host: "raspberrypi.local", port: 1883)


struct ContentView: View {
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    VStack {
                        BackwardLeft()
                        Backward()
                        BackwardRight()
                    }
                    VStack{
                        Left()
                        ConnectToRobot()
                        Right()
                    }
                    VStack {
                        ForwardLeft()
                        Forward()
                        ForwardRight()
                    }

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


//First VStack
//Back left
struct BackwardLeft: View {
    var body: some View {
        Button {
            print("Move back left")
        } label:  {
            Image(systemName: "arrow.up.left.square")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
        }
    }
}


//Backward
struct Backward: View {
    var body: some View {
        Button (action: {
            mqttClient.publish("robot/move", withString: "backward")
            print("Move back")
        }, label:  {
            Image(systemName: "arrow.left.square")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
        })
    }
}


//Back Right
struct BackwardRight: View {
    var body: some View {
        Button {
            print("Back right")
            
        } label:  {
            Image(systemName: "arrow.down.left.square")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
        }
    }
}


//Second VStack
//Left
struct Left: View {
    var body: some View {
        Button {
            mqttClient.publish("robot/move", withString: "left")
            print("Move left")
        } label:  {
            Image(systemName: "arrow.up.square")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
        }
    }
}

//MQTT Connection
struct ConnectToRobot: View {
    var body: some View {
        Button {
            print("Connect to robot")
            mqttClient.connect()
            
        } label:  {
            Image(systemName: "circle")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
        }
    }
}

//Right
struct Right: View {
    var body: some View {
        Button {
            print("Move right")
            mqttClient.publish("robot/move", withString: "right")
        } label:  {
            Image(systemName: "arrow.down.square")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
        }
    }
}




//Third VStack
//Forward left
struct ForwardLeft: View {
    var body: some View {
        Button {
            print("Move foward left")
        } label:  {
            Image(systemName: "arrow.up.right.square")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
        }
    }
}

//Forward
struct Forward: View {
    var body: some View {
        Button {
            mqttClient.publish("robot/move", withString: "forward")
            print("Move forward")
        } label:  {
            Image(systemName: "arrow.right.square")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
        }
    }
}

//Forward right
struct ForwardRight: View {
    var body: some View {
        Button {
            print("Move top right")
        } label:  {
            Image(systemName: "arrow.down.right.square")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
        }
    }
}



