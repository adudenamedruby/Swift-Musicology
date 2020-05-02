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
    
    /// Time signature of music.
    public var timeSignature: TimeSignature
    
    /// Beats per minute.
    public var bpm: Double

    /// Initilizes tempo with a time signature and a BPM.
    ///
    /// - Parameters:
    ///   - timeSignature: Time Signature.
    ///   - bpm: Beats per minute.
    public init(timeSignature: TimeSignature = TimeSignature(), bpm: Double = 120.0) {
      self.timeSignature = timeSignature
      self.bpm = bpm
    }

    /// Caluclates the duration of a note value in seconds.
    public func duration(of noteValue: NoteValue) -> TimeInterval {
      let secondsPerBeat = 60.0 / bpm
      return secondsPerBeat * (timeSignature.noteValue.rawValue / noteValue.type.rawValue) * noteValue.modifier.rawValue
    }

    /// Calculates the note length in samples. Useful for sequencing notes sample accurate in the DSP.
    ///
    /// - Parameters:
    ///   - noteValue: Rate of the note you want to calculate sample length.
    ///   - sampleRate: Number of samples in a second. Defaults to 44100.
    /// - Returns: Returns the sample length of a note value.
    public func sampleLength(of noteValue: NoteValue, sampleRate: Double = 44100.0) -> Double {
      let secondsPerBeat = 60.0 / bpm
      return secondsPerBeat * sampleRate * ((4 / noteValue.type.rawValue) * noteValue.modifier.rawValue)
    }

    /// Calculates the LFO speed of a note vaule in hertz.
    public func hertz(of noteValue: NoteValue) -> Double {
      return 1 / duration(of: noteValue)
    }
}

extension Tempo: CustomStringConvertible {

    public var description: String {
      return "\(bpm)"
    }
}
