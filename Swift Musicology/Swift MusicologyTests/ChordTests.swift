//
//  ChordTests.swift
//  Swift MusicologyTests
//
//  Created by roux g. buciu on 2020-05-02.
//  Copyright © 2020 roux g. buciu. All rights reserved.
//

import XCTest
@testable import Swift_Musicology

class ChordTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testChords() {
      let cmajNotes: [Key] = [Key(type: .c), Key(type: .e), Key(type: .g)]
      let cmaj = Chord(type: ChordType(third: .major), key: Key(type: .c))
      XCTAssert(cmajNotes == cmaj.keys)

      let cminNotes: [Key] = [
        Key(type: .c),
        Key(type: .e, accidental: .flat),
        Key(type: .g),
      ]
      let cmin = Chord(type: ChordType(third: .minor), key: Key(type: .c))
      XCTAssert(cminNotes == cmin.keys)

      let c13Notes: [Pitch] = [
        Pitch(key: Key(type: .c), octave: 1),
        Pitch(key: Key(type: .e), octave: 1),
        Pitch(key: Key(type: .g), octave: 1),
        Pitch(key: Key(type: .b, accidental: .flat), octave: 1),
        Pitch(key: Key(type: .d), octave: 2),
        Pitch(key: Key(type: .f), octave: 2),
        Pitch(key: Key(type: .a), octave: 2),
      ]
      let c13 = Chord(
        type: ChordType(
          third: .major,
          seventh: .dominant,
          extensions: [
            ChordExtensionType(type: .thirteenth),
          ]
        ),
        key: Key(type: .c)
      )
      XCTAssert(c13.pitches(octave: 1) === c13Notes)

      let cm13Notes: [Pitch] = [
        Pitch(key: Key(type: .c), octave: 1),
        Pitch(key: Key(type: .e, accidental: .flat), octave: 1),
        Pitch(key: Key(type: .g), octave: 1),
        Pitch(key: Key(type: .b, accidental: .flat), octave: 1),
        Pitch(key: Key(type: .d), octave: 2),
        Pitch(key: Key(type: .f), octave: 2),
        Pitch(key: Key(type: .a), octave: 2),
      ]
      let cm13 = Chord(
        type: ChordType(
          third: .minor,
          seventh: .dominant,
          extensions: [
            ChordExtensionType(type: .thirteenth),
          ]
        ),
        key: Key(type: .c)
      )
      XCTAssert(cm13.pitches(octave: 1) === cm13Notes)

      let minorIntervals: [Interval] = [.P1, .m3, .P5]
      guard let minorChord = ChordType(intervals: minorIntervals.map({ $0 })) else { return XCTFail() }
      XCTAssert(minorChord == ChordType(third: .minor))

      let majorIntervals: [Interval] = [.P1, .M3, .P5]
      guard let majorChord = ChordType(intervals: majorIntervals.map({ $0 })) else { return XCTFail() }
      XCTAssert(majorChord == ChordType(third: .major))

      let cmadd13Notes: [Pitch] = [
        Pitch(key: Key(type: .c), octave: 1),
        Pitch(key: Key(type: .e, accidental: .flat), octave: 1),
        Pitch(key: Key(type: .g), octave: 1),
        Pitch(key: Key(type: .a), octave: 2),
      ]
      let cmadd13 = Chord(
        type: ChordType(
          third: .minor,
          extensions: [ChordExtensionType(type: .thirteenth)]
        ),
        key: Key(type: .c)
      )
      XCTAssert(cmadd13.pitches(octave: 1) === cmadd13Notes)
    }

    func testRomanNumerics() {
      let cmaj = Scale(type: .major, key: Key(type: .c))
      let cmin = Scale(type: .minor, key: Key(type: .c))
      let cmajNumerics = ["I", "ii", "iii", "IV", "V", "vi", "vii°"]
      let cminNumerics = ["i", "ii°", "III", "iv", "v", "VI", "VII"]
      let cmajChords = cmaj.harmonicField(for: .triad)
      let cminChords = cmin.harmonicField(for: .triad)
      XCTAssertEqual(cmajNumerics, cmajChords.compactMap({ $0?.romanNumeric(for: cmaj) }))
      XCTAssertEqual(cminNumerics, cminChords.compactMap({ $0?.romanNumeric(for: cmin) }))
    }

    func testInversions() {
      let c7 = Chord(
        type: ChordType(third: .major, seventh: .dominant),
        key: Key(type: .c)
      )
      let c7Inversions = [
        [
          Pitch(key: Key(type: .c), octave: 1),
          Pitch(key: Key(type: .e), octave: 1),
          Pitch(key: Key(type: .g), octave: 1),
          Pitch(key: Key(type: .b, accidental: .flat), octave: 1),
        ],
        [
          Pitch(key: Key(type: .e), octave: 1),
          Pitch(key: Key(type: .g), octave: 1),
          Pitch(key: Key(type: .b, accidental: .flat), octave: 1),
          Pitch(key: Key(type: .c), octave: 2),
        ],
        [
          Pitch(key: Key(type: .g), octave: 1),
          Pitch(key: Key(type: .b, accidental: .flat), octave: 1),
          Pitch(key: Key(type: .c), octave: 2),
          Pitch(key: Key(type: .e), octave: 2),
        ],
        [
          Pitch(key: Key(type: .b, accidental: .flat), octave: 1),
          Pitch(key: Key(type: .c), octave: 2),
          Pitch(key: Key(type: .e), octave: 2),
          Pitch(key: Key(type: .g), octave: 2),
        ],
      ]
      for (index, chord) in c7.inversions.enumerated() {
        XCTAssert(chord.pitches(octave: 1) === c7Inversions[index])
      }
    }
}
