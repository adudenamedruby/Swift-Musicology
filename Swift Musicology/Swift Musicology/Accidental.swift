//
//  Accidental.swift
//  Swift Musicology
//
//  Created by roux g. buciu on 2018-11-25.
//  Copyright © 2018 roux g. buciu. All rights reserved.
//

import Foundation

// MARK: - Accidental Operations

/// Returns a new accidental by adding up two accidentals in the equation.
///
/// - Parameters:
///   - lhs: Left hand side of the equation.
///   - rhs: Right hand side of the equation.
/// - Returns: Returns the sum of two accidentals.
public func + (lhs: Accidental, rhs: Accidental) -> Accidental {
    return Accidental(integerLiteral: lhs.rawValue + rhs.rawValue)
}

/// Returns a new accidental by substracting two accidentals in the equation.
///
/// - Parameters:
///   - lhs: Left hand side of the equation.
///   - rhs: Right hand side of the equation.
/// - Returns: Returns the difference of two accidentals.
public func - (lhs: Accidental, rhs: Accidental) -> Accidental {
    return Accidental(integerLiteral: lhs.rawValue - rhs.rawValue)
}

/// Returns a new accidental by adding up an int to the accidental in the equation.
///
/// - Parameters:
///   - lhs: Left hand side of the equation.
///   - rhs: Right hand side of the equation.
/// - Returns: Returns the sum of two accidentals.
public func + (lhs: Accidental, rhs: Int) -> Accidental {
    return Accidental(integerLiteral: lhs.rawValue + rhs)
}

/// Returns a new accidental by substracting an int from the accidental in the equation.
///
/// - Parameters:
///   - lhs: Left hand side of the equation.
///   - rhs: Right hand side of the equation.
/// - Returns: Returns the difference of two accidentals.
public func - (lhs: Accidental, rhs: Int) -> Accidental {
    return Accidental(integerLiteral: lhs.rawValue - rhs)
}

/// Multiples an accidental with a multiplier.
///
/// - Parameters:
///   - lhs: Accidental you want to multiply.
///   - rhs: Multiplier.
/// - Returns: Returns a multiplied acceident.
public func * (lhs: Accidental, rhs: Int) -> Accidental {
    return Accidental(integerLiteral: lhs.rawValue * rhs)
}

/// Divides an accidental with a multiplier
///
/// - Parameters:
///   - lhs: Accidental you want to divide.
///   - rhs: Multiplier.
/// - Returns: Returns a divided accidental.
public func / (lhs: Accidental, rhs: Int) -> Accidental {
    return Accidental(integerLiteral: lhs.rawValue / rhs)
}

/// Checks if the two accidental is identical in terms of their semitone values.
///
/// - Parameters:
///   - lhs: Left hand side of the equation.
///   - rhs: Right hand side of the equation.
/// - Returns: Returns true if two accidentalals is identical.
public func == (lhs: Accidental, rhs: Accidental) -> Bool {
    return lhs.rawValue == rhs.rawValue
}

/// Checks if the two accidental is exactly identical.
///
/// - Parameters:
///   - lhs: Left hand side of the equation.
///   - rhs: Right hand side of the equation.
/// - Returns: Returns true if two accidentalals is identical.
public func === (lhs: Accidental, rhs: Accidental) -> Bool {
    switch (lhs, rhs) {
    case (.natural, .natural):
        return true
    case let (.sharps(a), .sharps(b)):
        return a == b
    case let (.flats(a), .flats(b)):
        return a == b
    default:
        return false
    }
}


// MARK: - Accidental Definitions

/// Used for calculating values of the `Key` and `Pitch` objects.
public enum Accidental: Codable, Equatable, Hashable {
    
    // Base definition of accidentals.
    /// No accidental.
    case natural
    /// Reduces the `Key` or `Pitch` value by the given amount of semitones.
    case flats(amount: Int)
    /// Increases the `Key` or `Pitch` value by the given amount of semitones.
    case sharps(amount: Int)
    
    
    /// Reduce the `Key` or `Pitch` value one semitone below
    public static let flat: Accidental = .flats(amount: 1)
    /// Increases the `Key` or `Pitch` value one semitone above.
    public static let sharp: Accidental = .sharps(amount: 1)
    /// Reduces the `Key` or `Pitch` value amount two semitones below.
    public static let doubleFlat: Accidental = .flats(amount: 2)
    /// Increases the `Key` or `Pitch` value two semitones above.
    public static let doubleSharp: Accidental = .sharps(amount: 2)
    
    /// A flag for the `description` function that determines if it should use double
    /// sharp and double flat symbols. This is mostly useful for instances where fonts
    /// do not support those types of symbols; in that case, set to `false`.
    /// Defaults to `true`.
    public static var shouldUseDoubleFlatAndDoubleSharpNotation = true
}


extension Accidental: RawRepresentable {
    
    public typealias RawValue = Int
    
    /// Value of the accidental in terms of semitones.
    public var rawValue: Int {
        switch self {
        case .natural:
            return 0
        case let .flats(amount):
            return -amount
        case let .sharps(amount):
            return amount
        }
    }
    
    /// Initilizes the accidental with an integer that represents the semitone amount.
    ///
    /// - Parameter rawValue: semitone value of the accidental. Zero if natural; above
    /// zero if sharp; below zero if flat.
    public init?(rawValue: Accidental.RawValue) {
        if rawValue == 0 {
            self = .natural
        } else if rawValue > 0 {
            self = .sharps(amount: rawValue)
        } else {
            self = .flats(amount: -rawValue)
        }
    }
}


extension Accidental: ExpressibleByIntegerLiteral {
    
    public typealias IntegerLiteralType = Int
    
    /// Initilizes the accidental with an integer literal value.
    ///
    /// - Parameter value: semitone value of the accidental. Zero if natural; above
    /// zero if sharp; below zero if flat.
    public init(integerLiteral value: Accidental.IntegerLiteralType) {
        self = Accidental(rawValue: value) ?? .natural
    }
}


extension Accidental: ExpressibleByStringLiteral {

    public typealias StringLiteralType = String
    
    public init(stringLiteral value: Accidental.StringLiteralType) {
        var sum = 0
        for i in 0 ..< value.count {
            switch value[value.index(value.startIndex, offsetBy: i)] {
            case "#", "♯":
                sum += 1
            case "b", "♭":
                sum -= 1
            default:
                break
            }
        }
        self = Accidental(rawValue: sum) ?? .natural
    }
}


extension Accidental: CustomStringConvertible {
    
    /// Returns the notation string of the accidental.
    public var notation: String {
        if case .natural = self {
            return "♮"
        }
        return description
    }
    
    /// Returns the notation string of the accidental. Returns empty string if the Accidental is natural.
    public var description: String {
        switch self {
        case .natural:
            return ""
        case let .flats(amount):
            switch amount {
            case 0: return Accidental.natural.description
            case 1: return "♭"
            case 2 where Accidental.shouldUseDoubleFlatAndDoubleSharpNotation: return "𝄫"
            default: return amount > 0 ? (0 ..< amount).map({ _ in Accidental.flats(amount: 1).description }).joined() : ""
            }
        case let .sharps(amount):
            switch amount {
            case 0: return Accidental.natural.description
            case 1: return "♯"
            case 2 where Accidental.shouldUseDoubleFlatAndDoubleSharpNotation: return "𝄪"
            default: return amount > 0 ? (0 ..< amount).map({ _ in Accidental.sharps(amount: 1).description }).joined() : ""
            }
        }
    }
}
