//
//  ContentView.swift
//  Capstone
//
//  Created by Ankar Keram on 2022-12-21.
//

import SwiftUI
import CocoaMQTT

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
                        Function(image: "circle", mqttMessage: "honk", text: "honk")
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
                HStack {
                    Function(image: "circle", mqttMessage: "CW", text: "CWise")
                    ConnectToRobot(text: "connect")
                    Function(image: "circle", mqttMessage: "CCW", text: "CCW")
                    
                }
                
                
                HStack {
                    RobotArmController(image: "arrowtriangle.left",
                                       mqttMessage: "rightLeft")
                    VStack {
                        RobotArmController(image: "arrowtriangle.up", mqttMessage: "rightUp")
                        Function(image: "circle", mqttMessage: "CW", text: "Squeeze")
                        RobotArmController(image: "arrowtriangle.down", mqttMessage: "rightDown")
                    }
                    RobotArmController(image: "arrowtriangle.right", mqttMessage: "right")
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}









