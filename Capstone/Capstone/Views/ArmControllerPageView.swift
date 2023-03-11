//
//  ArmControllerPageView.swift
//  Capstone
//
//  Created by Ankar Keram on 2023-03-10.
//

import SwiftUI

struct ArmControllerPageView: View {
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    VStack {
                        RobotArmPageViewViewController(image: "arrowtriangle.up", mqttMessage: "up")
                        RobotArmStateViewController(image: "square", mqttMessage: "up")
                        RobotArmPageViewViewController(image: "arrowtriangle.down", mqttMessage: "down")
                        
                    }
                    VStack{
                        RobotArmPageViewViewController(image: "arrowtriangle.up", mqttMessage: "up")
                        RobotArmStateViewController(image: "square", mqttMessage: "up")
                        RobotArmPageViewViewController(image: "arrowtriangle.down", mqttMessage: "down")
                    }
                    VStack {
                        RobotArmPageViewViewController(image: "arrowtriangle.up", mqttMessage: "up")
                        RobotArmStateViewController(image: "square", mqttMessage: "up")
                        RobotArmPageViewViewController(image: "arrowtriangle.down", mqttMessage: "down")
                    }
                }
                Spacer()
                HStack {
                    RobotArmPageViewViewController(image: "square", mqttMessage: "up")
                    RobotArmStateViewController(image: "square", mqttMessage: "up")
                    RobotArmPageViewViewController(image: "square", mqttMessage: "up")
                    
                }
                
                
                HStack {
                    VStack {
                        RobotArmPageViewViewController(image: "arrowtriangle.up", mqttMessage: "up")
                        RobotArmStateViewController(image: "square", mqttMessage: "up")
                        RobotArmPageViewViewController(image: "arrowtriangle.down", mqttMessage: "down")
                        
                    }
                    VStack{
                        RobotArmPageViewViewController(image: "arrowtriangle.up", mqttMessage: "up")
                        RobotArmStateViewController(image: "square", mqttMessage: "up")
                        RobotArmPageViewViewController(image: "arrowtriangle.down", mqttMessage: "down")
                    }
                    VStack {
                        RobotArmPageViewViewController(image: "arrowtriangle.up", mqttMessage: "up")
                        RobotArmStateViewController(image: "square", mqttMessage: "up")
                        RobotArmPageViewViewController(image: "arrowtriangle.down", mqttMessage: "down")
                    }
                }
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
