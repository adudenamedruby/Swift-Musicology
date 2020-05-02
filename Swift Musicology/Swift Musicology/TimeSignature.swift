//
//  TimeSignature.swift
//  Swift Musicology
//
//  Created by roux g. buciu on 2018-11-25.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation

// Defines how many beats in a measure with which note value.
public struct TimeSignature: Codable {
    
    /// Beats per measure.
    public var beats: Int
    
    /// Note value per beat.
    public var noteValue: NoteValueType
    
    /// Initilizes a TimeSignature object with beats per measure and the note value
    /// of each beat, with 4/4 as the default time signature.
    ///
    /// - Parameters:
    ///   - beats: Number of beats in a measure
    ///   - noteValue: Note value of the beats.
    public init(beats: Int = 4, noteValue: NoteValueType = .quarter) {
        self.beats = beats
        self.noteValue = noteValue
    }
    
    /// Initilizes a TimeSignature object with beats per measure and the note value of
    /// each beat. Returns nil if a division is not match a `NoteValue`.
    ///
    /// - Parameters:
    ///   - beats: Number of beats in a measure
    ///   - division: Number of the beats.
    public init?(beats: Int, division: Int) {
        guard let noteValue = NoteValueType(rawValue: Double(division)) else {
            return nil
        }
        
        self.beats = beats
        self.noteValue = noteValue
    }
}

extension TimeSignature: CustomStringConvertible {
    
    public var description: String {
      return "\(beats)/\(Int(noteValue.rawValue))"
    }
}
