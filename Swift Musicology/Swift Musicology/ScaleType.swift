//
//  ScaleType.swift
//  Swift Musicology
//
//  Created by roux g. buciu on 2018-11-25.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation

/// Represents scale by the intervals between note sequences.
public enum ScaleType: Equatable {
    case major
    case minor
    case harmonicMinor
    case melodicMinor
    case pentatonicMajor
    case pentatonicMinor
    case pentatonicBlues
    case pentatonicNeutral
    case ionian
    case aeolian
    case dorian
    case mixolydian
    case phrygian
    case lydian
    case locrian
    case dimHalf
    case dimWhole
    case whole
    case augmented
    case chromatic
    case roumanianMinor
    case spanishGypsy
    case blues
    case diatonic
    case doubleHarmonic
    case eightToneSpanish
    case enigmatic
    case leadingWholeTone
    case lydianAugmented
    case neopolitanMajor
    case neopolitanMinor
    case pelog
    case prometheus
    case prometheusNeopolitan
    case sixToneSymmetrical
    case superLocrian
    case lydianMinor
    case lydianDiminished
    case nineToneScale
    case auxiliaryDiminished
    case auxiliaryAugmented
    case auxiliaryDimBlues
    case majorLocrian
    case overtone
    case diminishedWholeTone
    case pureMinor
    case dominant7th
    
    /// Custom scale with given interval set.
    case custom(intervals: [Interval], description: String)
    
    /// Tries to initilize scale with a matching interval series. If no scale matched
    /// with intervals, than initlizes custom scale.
    ///
    /// - Parameters:
    ///   - intervals: Intervals of the chord.
    ///   - description: In case of .custom type scale, you probably need description.
    public init(intervals: [Interval], description: String = "") {
        if let scale = ScaleType.all.filter({ $0.intervals == intervals }).first {
            self = scale
        } else {
            self = .custom(intervals: intervals, description: description)
        }
    }
    
    /// Intervals of the different scales.
    public var intervals: [Interval] {
        switch self {
        case .major: return [.P1, .M2, .M3, .P4, .P5, .M6, .M7]
        case .minor: return [.P1, .M2, .m3, .P4, .P5, .m6, .m7]
        case .harmonicMinor: return [.P1, .M2, .m3, .P4, .P5, .m6, .M7]
        case .dorian: return [.P1, .M2, .m3, .P4, .P5, .M6, .m7]
        case .phrygian: return [.P1, .m2, .m3, .P4, .P5, .m6, .m7]
        case .lydian: return [.P1, .M2, .M3, .d5, .P5, .M6, .M7]
        case .mixolydian: return [.P1, .M2, .M3, .P4, .P5, .M6, .m7]
        case .locrian: return [.P1, .m2, .m3, .P4, .d5, .m6, .m7]
        case .melodicMinor: return [.P1, .M2, .m3, .P4, .P5, .M6, .M7]
        case .pentatonicMajor: return [.P1, .M2, .M3, .P5, .M6]
        case .pentatonicMinor: return [.P1, .m3, .P4, .P5, .m7]
        case .pentatonicBlues: return [.P1, .m3, .P4, .d5, .P5, .m7]
        case .pentatonicNeutral: return [.P1, .M2, .P4, .P5, .m7]
        case .ionian: return [.P1, .M2, .M3, .P4, .P5, .M6, .M7]
        case .aeolian: return [.P1, .M2, .m3, .P4, .P5, .m6, .m7]
        case .dimHalf: return [.P1, .m2, .m3, .M3, .d5, .P5, .M6, .m7]
        case .dimWhole: return [.P1, .M2, .m3, .P4, .d5, .m6, .M6, .M7]
        case .whole: return [.P1, .M2, .M3, .d5, .m6, .m7]
        case .augmented: return [.m3, .M3, .P5, .m6, .M7]
        case .chromatic: return [.P1, .m2, .M2, .m3, .M3, .P4, .d5, .P5, .m6, .M6, .m7, .M7]
        case .roumanianMinor: return [.P1, .M2, .m3, .d5, .P5, .M6, .m7]
        case .spanishGypsy: return [.P1, .m2, .M3, .P4, .P5, .m6, .m7]
        case .blues: return [.P1, .m3, .P4, .d5, .P5, .m7]
        case .diatonic: return [.P1, .M2, .M3, .P5, .M6]
        case .doubleHarmonic: return [.P1, .m2, .M3, .P4, .P5, .m6, .M7]
        case .eightToneSpanish: return [.P1, .m2, .m3, .M3, .P4, .d5, .m6, .m7]
        case .enigmatic: return [.P1, .m2, .M3, .d5, .m6, .m7, .M7]
        case .leadingWholeTone: return [.P1, .M2, .M3, .d5, .m6, .M6, .m7]
        case .lydianAugmented: return [.P1, .M2, .M3, .d5, .m6, .M6, .M7]
        case .neopolitanMajor: return [.P1, .m2, .m3, .P4, .P5, .M6, .M7]
        case .neopolitanMinor: return [.P1, .m2, .m3, .P4, .P5, .m6, .m7]
        case .pelog: return [.P1, .m2, .m3, .d5, .m7, .M7]
        case .prometheus: return [.P1, .M2, .M3, .d5, .M6, .m7]
        case .prometheusNeopolitan: return [.P1, .m2, .M3, .d5, .M6, .m7]
        case .sixToneSymmetrical: return [.P1, .m2, .M3, .P4, .m6, .M6]
        case .superLocrian: return [.P1, .m2, .m3, .M3, .d5, .m6, .m7]
        case .lydianMinor: return [.P1, .M2, .M3, .d5, .P5, .m6, .m7]
        case .lydianDiminished: return [.P1, .M2, .m3, .d5, .P5, .m6, .m7]
        case .nineToneScale: return [.P1, .M2, .m3, .M3, .d5, .P5, .m6, .M6, .M7]
        case .auxiliaryDiminished: return [.P1, .M2, .m3, .P4, .d5, .m6, .M6, .M7]
        case .auxiliaryAugmented: return [.P1, .M2, .M3, .d5, .m6, .m7]
        case .auxiliaryDimBlues: return [.P1, .m2, .m3, .M3, .d5, .P5, .M6, .m7]
        case .majorLocrian: return [.P1, .M2, .M3, .P4, .d5, .m6, .m7]
        case .overtone: return [.P1, .M2, .M3, .d5, .P5, .M6, .m7]
        case .diminishedWholeTone: return [.P1, .m2, .m3, .M3, .d5, .m6, .m7]
        case .pureMinor: return [.P1, .M2, .m3, .P4, .P5, .m6, .m7]
        case .dominant7th: return [.P1, .M2, .M3, .P4, .P5, .M6, .m7]
        case .custom(let intervals, _): return intervals
        }
    }
    
    /// An array of all `ScaleType` values.
    public static var all: [ScaleType] {
        return [
            .major,
            .minor,
            .harmonicMinor,
            .melodicMinor,
            .pentatonicMajor,
            .pentatonicMinor,
            .pentatonicBlues,
            .pentatonicNeutral,
            .ionian,
            .aeolian,
            .dorian,
            .mixolydian,
            .phrygian,
            .lydian,
            .locrian,
            .dimHalf,
            .dimWhole,
            .whole,
            .augmented,
            .chromatic,
            .roumanianMinor,
            .spanishGypsy,
            .blues,
            .diatonic,
            .doubleHarmonic,
            .eightToneSpanish,
            .enigmatic,
            .leadingWholeTone,
            .lydianAugmented,
            .neopolitanMajor,
            .neopolitanMinor,
            .pelog,
            .prometheus,
            .prometheusNeopolitan,
            .sixToneSymmetrical,
            .superLocrian,
            .lydianMinor,
            .lydianDiminished,
            .nineToneScale,
            .auxiliaryDiminished,
            .auxiliaryAugmented,
            .auxiliaryDimBlues,
            .majorLocrian,
            .overtone,
            .diminishedWholeTone,
            .pureMinor,
            .dominant7th,
        ]
    }
}

extension ScaleType: Codable {
    /// Keys that conforms CodingKeys protocol to map properties.
    private enum CodingKeys: String, CodingKey {
        /// semitone property of `Interval`.
        case intervals
    }
    
    /// Decodes struct with a decoder.
    ///
    /// - Parameter decoder: Decodes encoded struct.
    /// - Throws: Tries to initlize struct with a decoder.
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let intervals = try values.decode([Interval].self, forKey: .intervals)
        self = ScaleType(intervals: intervals)
    }
    
    /// Encodes struct with an ecoder.
    ///
    /// - Parameter encoder: Encodes struct.
    /// - Throws: Tries to encode struct.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(intervals, forKey: .intervals)
    }
}

extension ScaleType: CustomStringConvertible {
    /// Converts `ScaleType` to string with its name.
    public var description: String {
        switch self {
        case .major: return "Major"
        case .minor: return "Minor"
        case .harmonicMinor: return "Harmonic Minor"
        case .melodicMinor: return "Melodic Minor"
        case .pentatonicMajor: return "Pentatonic Major"
        case .pentatonicMinor: return "Pentatonic Minor"
        case .pentatonicBlues: return "Pentatonic Blues"
        case .pentatonicNeutral: return "Pentatonic Neutral"
        case .ionian: return "Ionian"
        case .aeolian: return "Aeolian"
        case .dorian: return "Dorian"
        case .mixolydian: return "Mixolydian"
        case .phrygian: return "Phrygian"
        case .lydian: return "Lydian"
        case .locrian: return "Locrian"
        case .dimHalf: return "Half Diminished"
        case .dimWhole: return "Whole Diminished"
        case .whole: return "Whole"
        case .augmented: return "Augmented"
        case .chromatic: return "Chromatic"
        case .roumanianMinor: return "Roumanian Minor"
        case .spanishGypsy: return "Spanish Gypsy"
        case .blues: return "Blues"
        case .diatonic: return "Diatonic"
        case .doubleHarmonic: return "Double Harmonic"
        case .eightToneSpanish: return "Eight Tone Spanish"
        case .enigmatic: return "Enigmatic"
        case .leadingWholeTone: return "Leading Whole Tone"
        case .lydianAugmented: return "Lydian Augmented"
        case .neopolitanMajor: return "Neopolitan Major"
        case .neopolitanMinor: return "Neopolitan Minor"
        case .pelog: return "Pelog"
        case .prometheus: return "Prometheus"
        case .prometheusNeopolitan: return "Prometheus Neopolitan"
        case .sixToneSymmetrical: return "Six Tone Symmetrical"
        case .superLocrian: return "Super Locrian"
        case .lydianMinor: return "Lydian Minor"
        case .lydianDiminished: return "Lydian Diminished"
        case .nineToneScale: return "Nine Tone Scale"
        case .auxiliaryDiminished: return "Auxiliary Diminished"
        case .auxiliaryAugmented: return "Auxiliary Augmented"
        case .auxiliaryDimBlues: return "Auxiliary Diminished Blues"
        case .majorLocrian: return "Major Locrian"
        case .overtone: return "Overtone"
        case .diminishedWholeTone: return "Diminished Whole Tone"
        case .pureMinor: return "Pure Minor"
        case .dominant7th: return "Dominant 7th"
        case let .custom(_, description): return description
        }
    }
}


// MARK: - ScaleType Operations

/// Checks the equability between two `ScaleType`s by their intervals.
///
/// - Parameters:
///   - left: Left handside of the equation.
///   - right: Right handside of the equation.
/// - Returns: Returns Bool value of equation of two given scale types.
public func == (left: ScaleType, right: ScaleType) -> Bool {
    return left.intervals == right.intervals
}
