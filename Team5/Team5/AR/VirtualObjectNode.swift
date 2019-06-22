//
//  VirtualObjectNode.swift
//  ARKit-Sampler
//
//  Created by Shuichi Tsutsumi on 2017/09/20.
//  Copyright © 2017 Shuichi Tsutsumi. All rights reserved.
//

import SceneKit

class VirtualObjectNode: SCNNode {

    enum VirtualObjectType {
        case mosque
        case quran
    }
    
    init(type: VirtualObjectType = .quran) {
    
        super.init()
        
        var scale = 1.0
        switch type {
        case .mosque:
            loadObj(name: "Badshahi_Mosque")
            scale = 0.0002
        case .quran:
            loadObj(name: "Quran")
            scale = 0.1
        }
        self.scale = SCNVector3(scale, scale, scale)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func react() {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.3
        SCNTransaction.completionBlock = {
            SCNTransaction.animationDuration = 0.15
            self.opacity = 1.0
        }
        self.opacity = 0.5
        SCNTransaction.commit()
    }
}
