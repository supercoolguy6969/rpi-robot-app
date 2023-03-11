//
//  RobotArmViewController.swift
//  Capstone
//
//  Created by Ankar Keram on 2023-02-24.
//

import SwiftUI



struct RobotArmController: View {
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

struct RobotArmPageViewViewController: View {
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


struct RobotArmStateViewController: View {
    @State private var isTapped = false
    
    let image: String
    let mqttMessage: String
    
    
    var body: some View {
        let tap = TapGesture(count: 1)
            .onEnded({ _ in
                self.isTapped = true
                mqttClient.publish("robot/move", withString: "stop")
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
          
    }
}
