//
//  ArmControllerPageView.swift
//  Capstone
//
//  Created by Ankar Keram on 2023-03-10.
//

import SwiftUI

struct ArmControllerPageView: View {
    
    @State var armSelection: Bool = false
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                HStack {
                    
                    VStack {
                        RobotArmDirectionViewController(image: "arrowtriangle.up", mqttMessage: "baseincrease")
                        RobotArmStateViewController(image: "square", mqttMessage: "base")
                            .overlay(TextOverlay(message: "base"))
                        RobotArmDirectionViewController(image: "arrowtriangle.down", mqttMessage: "basedecrease")
                        
                    }
                    VStack {
                        RobotArmDirectionViewController(image: "arrowtriangle.up", mqttMessage: "shoulderincrease")
                        RobotArmStateViewController(image: "square", mqttMessage: "shoulder")
                            .overlay(TextOverlay(message: "shoulder"))
                        RobotArmDirectionViewController(image: "arrowtriangle.down", mqttMessage: "shoulderdecrease")
                    }
                    VStack {
                        RobotArmDirectionViewController(image: "arrowtriangle.up", mqttMessage: "elbowincrease")
                        RobotArmStateViewController(image: "square", mqttMessage: "elbow")
                            .overlay(TextOverlay(message: "elbow"))
                        RobotArmDirectionViewController(image: "arrowtriangle.down", mqttMessage: "elbowdecrease")
                    }
                }
                Spacer()
                HStack {
                    RobotArmStateViewController(image: "square", mqttMessage: "right")
                        .overlay(TextOverlay(message: "right" ))
                    RobotArmStateViewController(image: "square", mqttMessage: "left")
                        .overlay(TextOverlay(message: "left" ))
                    RobotArmStateViewController(image: "square", mqttMessage: "both")
                        .overlay(TextOverlay(message: "both"))
                    
                }
                Spacer()
                HStack {
                    VStack {
                        RobotArmDirectionViewController(image: "arrowtriangle.up", mqttMessage: "wrist2increase")
                        RobotArmStateViewController(image: "square", mqttMessage: "wrist2")
                            .overlay(TextOverlay(message: "wrist2"))
                        RobotArmDirectionViewController(image: "arrowtriangle.down", mqttMessage: "wrist2decrease")
                        
                    }
                    VStack{
                        RobotArmDirectionViewController(image: "arrowtriangle.up", mqttMessage: "wrist1increase")
                        RobotArmStateViewController(image: "square", mqttMessage: "wrist1")
                            .overlay(TextOverlay(message: "wrist1"))
                        RobotArmDirectionViewController(image: "arrowtriangle.down", mqttMessage: "wrist1decrease")
                    }
                    VStack {
                        RobotArmDirectionViewController(image: "arrowtriangle.up",   mqttMessage: "closeincrease")
                        
                        RobotArmStateViewController(image: "square", mqttMessage: "grip")
                            .overlay(TextOverlay(message: "close"))
                        
                        RobotArmDirectionViewController(image: "arrowtriangle.down", mqttMessage: "closedecrease")
                    }
                    
                }
                Spacer()
                ArmSlider()
                Spacer()
            }
        }
    }
}

struct ArmControllerPageView_Previews: PreviewProvider {
    static var previews: some View {
        ArmControllerPageView()
    }
}
