//
//  Tempo.swift
//  Swift Musicology
//
//  Created by roux g. buciu on 2018-11-25.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation

/// Defines the tempo with beats per second and a time signature.
public struct Tempo: Codable {
    
    public var timeSignature: TimeSignature
    public var bpm: Double
    
    /// Initilizes tempo with time signature and BPM, with a default of 4/4 at 120 BPM.
    ///
    /// - Parameters:
    ///   - timeSignature: A TimeSignature object.
    ///   - bpm: Beats per minute.
    public init(timeSignature: TimeSignature = TimeSignature(), bpm: Double = 120.0) {
        self.timeSignature = timeSignature
        self.bpm = bpm
    }
}
