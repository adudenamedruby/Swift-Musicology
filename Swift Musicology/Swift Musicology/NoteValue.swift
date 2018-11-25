//
//  NoteValue.swift
//  Swift Musicology
//
//  Created by roux g. buciu on 2018-11-25.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation


// MARK: - NoteValueType

/// Defines the different types of note values that are generally available in music notation,
/// from whole notes to sixtyfourth notes.
public enum NoteValueType: Double, Codable {
    case whole = 1
    case half = 2
    case quarter = 4
    case eighth = 8
    case sixteenth = 16
    case thirtysecond = 32
    case sixtyfourth = 64
}


// MARK: - NoteModifier

/// Used to define the length a `NoteValue` will have.
public enum NoteModifier: Double, Codable {
    /// No additional length.
    case `default` = 1
    /// Adds half of its own value.
    case dotted = 1.5
    /// Three notes of the same value.
    case triplet = 0.6667
    /// Five of the indicated note value total the duration normally occupied by four.
    case quintuplet = 0.8
}


// MARK: - NoteValue

/// Used to denfine the duration of a note.
public struct NoteValue: Codable {
    
    /// The standard duration of the note.
    public var type: NoteValueType
    
    /// Modifier for `NoteType` that modifies the note's default duration.
    public var modifier: NoteModifier
    
    /// Initilize the NoteValue with its type and an optional modifier.
    ///
    /// - Parameters:
    ///   - type: NoteTypeValue that represents note duration.
    ///   - modifier: Modifier of note value. Defaults `default`.
    public init(type: NoteValueType, modifier: NoteModifier = .default) {
        self.type = type
        self.modifier = modifier
    }
}


// MARK: - NoteValue Operations

/// Calculates how many notes of a single `NoteValueType` is equivalent to a given `NoteValue`.
///
/// - Parameters:
///   - noteValue: The note value to be measured.
///   - noteValueType: The note value type to measure the length of the note value.
/// - Returns: Returns how many notes of a single `NoteValueType` is equivalent to a given `NoteValue`.
public func / (noteValue: NoteValue, noteValueType: NoteValueType) -> Double {
    return noteValue.modifier.rawValue * noteValueType.rawValue / noteValue.type.rawValue
}
