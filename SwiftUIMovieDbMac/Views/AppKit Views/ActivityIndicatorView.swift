//
//  ActivityIndicatorView.swift
//  MovieAppIMDb
//
//  Created by Honeymarketing on 11/04/21.
//  Copyright © 2021 Honeymarketing. All rights reserved.
//

import Foundation
import SwiftUI

struct ActivityIndicatorView: NSViewRepresentable {
    
    func makeNSView(context: Context) -> NSProgressIndicator {
        let indicator = NSProgressIndicator()
        indicator.style = .spinning
        indicator.startAnimation(nil)
        return indicator
    }
    
    func updateNSView(_ nsView: NSProgressIndicator, context: Context) {
        
    }
}
