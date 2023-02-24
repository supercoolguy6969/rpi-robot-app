//
//  ContentView.swift
//  Capstone
//
//  Created by Ankar Keram on 2022-12-21.
//

import SwiftUI
import CocoaMQTT



struct direction {
    static var left = "l"
}


let mqttClient = CocoaMQTT(clientID: "App", host: "raspberrypi.local", port: 1883)


struct Main: View {
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    VStack {
                        RobotWheelViewController(image: "arrow.up.left.square",
                                                 mqttMessage: "backwardleft")
                        RobotWheelViewController(image: "arrow.left.square",
                                                 mqttMessage: "backward")
                        RobotWheelViewController(image: "arrow.down.left.square",
                                                 mqttMessage: "backwardright")
                    }
                    VStack{
                        RobotWheelViewController(image: "arrow.up.square",
                                                 mqttMessage: "left")
                        ConnectToRobot()
                        RobotWheelViewController(image: "arrow.down.square",
                                                 mqttMessage: "right")
                    }
                    VStack {
                        RobotWheelViewController(image: "arrow.up.right.square",
                                                 mqttMessage: "forwardleft")
                        RobotWheelViewController(image: "arrow.right.square",
                                                 mqttMessage: "forward")
                        RobotWheelViewController(image: "arrow.down.right.square",
                                                 mqttMessage: "forwardright")
                    }
                }
                Spacer()
            }
        }
    }
}


struct ButtonPress: View {
    @State private var isDragging = false
    
    var body: some View {
        let g = DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged({ _ in
                
                mqttClient.publish("robot/move", withString: "left")
                print("Move left")
            })
            .onEnded({ _ in
                
                mqttClient.publish("robot/move", withString: "stop")
                print("Stopped")
            })
        
        return
            Image(systemName: "arrow.up.square")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
            .gesture(g)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Main()
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

