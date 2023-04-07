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


struct ConnectToRobot: View {
    
    let text: String
    let image: String
    
    @State private var isTapped = false
    
    
    var body: some View {
        let tap = TapGesture(count: 1)
            .onEnded({ _ in
                self.isTapped = !self.isTapped
                mqttClient.connect()
                print("Stopped")
            })

        
        return
            Image(systemName: image)
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .foregroundColor(self.isTapped ? .blue : .white)
            .gesture(tap)
            .overlay(TextOverlay(message: text))
          
            
        }
    }


struct WheelSlider: View {
    @State private var sliderValue: Double = 0
    @State private var isEditing = false

    var body: some View {
        VStack {
            Text(
                String(format: "%.0f", sliderValue)
            )
            Slider(value: $sliderValue, in: 0...20000, step: 100,
                   onEditingChanged: { editing in
                isEditing = editing
                
                if sliderValue == 100
                {
                    mqttClient.publish("robot/move", withString: "100")
                    print("100 steps")
                }
                else if sliderValue == 1000
                {
                    mqttClient.publish("robot/move", withString: "1000")
                    print("1000 steps")
                }
                else if sliderValue == 5000
                {
                    mqttClient.publish("robot/move", withString: "5000")
                    print("5000 steps")
                }
                
                else if sliderValue == 10000
                {
                    mqttClient.publish("robot/move", withString: "100000")
                    print("10000 steps")
                }
                
                else if sliderValue == 20000
                {
                    mqttClient.publish("robot/move", withString: "200000")
                    print("20000 steps")
                }
                }
            )
        }
    }
    
}
