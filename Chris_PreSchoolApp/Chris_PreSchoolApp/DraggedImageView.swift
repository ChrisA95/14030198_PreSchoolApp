//
//  DraggedImageView.swift
//  Chris_PreSchoolApp
//
//  Created by Chris on 19/02/2017.
//  Copyright © 2017 Chris. All rights reserved.
//

import UIKit

class DraggedImageView: UIImageView {
    
    var startLocation: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        startLocation = touches.first?.location(in: self)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        
        self.center = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        
    }
    
}
