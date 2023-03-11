//
//  RobotWheelControllerView.swift
//  Capstone
//
//  Created by Ankar Keram on 2023-02-24.
//

import SwiftUI

struct RobotWheelViewController: View {
    @State private var isDragging = false
    
    let image: String
    let mqttMessage: String
    
    
    var body: some View {
        let g = DragGesture(minimumDistance: -5, coordinateSpace: .local)
            .onChanged({ _ in
                self.isDragging = true
                mqttClient.publish("robot/move", withString: mqttMessage)
                print("Move \(mqttMessage)")
            })
            .onEnded({ _ in
                self.isDragging = false
                mqttClient.publish("robot/move", withString: "stop")
                print("Stopped")
            })

        return
            Image(systemName: image)
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .foregroundColor(self.isDragging ? .blue : .white)
            .gesture(g)
          
    }
}



struct Function: View {
    @State private var isDragging = false
    
    let image: String
    let mqttMessage: String
    let text: String
    
    
    var body: some View {
        let g = DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged({ _ in
                self.isDragging = true
                mqttClient.publish("robot/move", withString: mqttMessage)
                print("Move \(mqttMessage)")
            })
            .onEnded({ _ in
                self.isDragging = false
                mqttClient.publish("robot/move", withString: "stop")
                print("Stopped")
            })

        return
            Image(systemName: image)
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .foregroundColor(self.isDragging ? .blue : .white)
            .gesture(g)
            .overlay(TextOverlay(message: text))
    }
}


struct TextOverlay:View {
    
    let message: String
    
    var body: some View {
        
        Text(message)
            .rotationEffect(Angle(degrees: 90))
            .bold()
            .font(.body)
    }
}




//MQTT Connection
struct ConnectToRobot: View {
    
    let text: String
    @State private var isTapped = false
    
    
    var body: some View {
        Button {
            print("Connect to robot")
            mqttClient.connect()
            
        } label:  {
            Image(systemName: "circle")
                .renderingMode(.template)
                .resizable()
                .onTapGesture {
                    self.isTapped = true
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(self.isTapped ? .blue : .white)
                .overlay(TextOverlay(message: text))
                
            
            
        }
    }
}

/*
struct RobotWheelViewController: View {
    @GestureState var isLongPress = false
    
    let image: String
    let mqttMessage: String
    
    
    var body: some View {
        let longPress = LongPressGesture()
            .updating($isLongPress) { newValue, state, transaction in
                state = newValue
                mqttClient.publish("robot/move", withString: mqttMessage)
                print("Move \(mqttMessage)")
            }
            .onEnded{ _ in
                mqttClient.publish("robot/move", withString: "stop")
                print("Stopped")
            }

        return
            Image(systemName: image)
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .foregroundColor(self.isLongPress ? .blue: .white)
            .gesture(longPress)
          
    }
}
*/
