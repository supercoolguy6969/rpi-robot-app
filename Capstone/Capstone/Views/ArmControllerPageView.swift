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
                Spacer()
                HStack {
                    RobotArmStateViewController(image: "square", mqttMessage: "base")
                            .overlay(TextOverlay(message: "base")) 
                        RobotArmStateViewController(image: "square", mqttMessage: "shoulder")
                            .overlay(TextOverlay(message: "shoulder"))
        
                        RobotArmStateViewController(image: "square", mqttMessage: "elbow")
                            .overlay(TextOverlay(message: "elbow"))
                        
    
                }
                Spacer()
                
                RobotArmDirectionViewController(image: "arrowtriangle.up", mqttMessage: "DOWN")
                    .overlay(Image(systemName: "minus")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .rotationEffect(Angle(degrees: 90))
                        )
                    
               
                HStack {
                    RobotArmSelectionViewController(image: "square", mqttMessage: "rightArm")
                        .overlay(TextOverlay(message: "right" ))
                    RobotArmStateViewController(image: "square", mqttMessage: "leftArm")
                        .overlay(TextOverlay(message: "left" ))
                    
                }
                
                RobotArmDirectionViewController(image: "arrowtriangle.down", mqttMessage: "UP")
                    .overlay(Image(systemName: "plus")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .rotationEffect(Angle(degrees: 90))
                    )
                Spacer()
                HStack {
                    VStack {
                       
                        RobotArmStateViewController(image: "square", mqttMessage: "wristRot")
                            .overlay(TextOverlay(message: "rotation"))
                        
                        
                    }
                    VStack{
                       
                        RobotArmStateViewController(image: "square", mqttMessage: "wristRaise")
                            .overlay(TextOverlay(message: "raise"))
                        
                    }
                    VStack {
                        
                        
                        RobotArmStateViewController(image: "square", mqttMessage: "grip")
                            .overlay(TextOverlay(message: "grip"))
                        
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
