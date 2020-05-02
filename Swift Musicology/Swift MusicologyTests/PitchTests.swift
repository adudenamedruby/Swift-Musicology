//
//  PitchTests.swift
//  Swift MusicologyTests
//
//  Created by roux g. buciu on 2020-05-02.
//  Copyright © 2020 roux g. buciu. All rights reserved.
//

import XCTest
@testable import Swift_Musicology

class PitchTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIntervals() {
      let key = Key(type: .c)
      let pitch = Pitch(key: key, octave: 1)
      XCTAssert((pitch + 12).octave == pitch.octave + 1)
      XCTAssert((pitch + 1).key == Key(type: .c, accidental: .sharp))
      XCTAssert((pitch - 1) == Pitch(key: Key(type: .b), octave: 0))

      let c1 = Pitch(key: Key(type: .c), octave: 1)
      let d1 = Pitch(key: Key(type: .d), octave: 1)
      XCTAssert(d1 - c1 == .M2)
    }

    func testAccidentals() {
      XCTAssert(Accidental.flat * 2 == Accidental.doubleFlat)
      XCTAssert(Accidental.doubleFlat / 2 == Accidental.flat)
      XCTAssert(Accidental.sharps(amount: 2) - 2 == Accidental.natural)
      XCTAssert(Accidental.flats(amount: 2) + 2 == 0)
      XCTAssert(Accidental.sharps(amount: 2) + Accidental.sharps(amount: 1) == Accidental.sharps(amount: 3))
      XCTAssert(Accidental(integerLiteral: -3) + Accidental(rawValue: 3)! == 0)
    }

    func testKeys() {
      let d = Key.KeyType.d
      XCTAssert(d.key(at: -2) == .b)
      XCTAssert(d.key(at: -19) == .f)
      XCTAssert(d.key(at: 12) == .b)
      XCTAssert(d.key(at: 0) == .d)
      XCTAssert(d.key(at: 1) == .e)
      XCTAssert(d.key(at: 2) == .f)
      XCTAssert(d.key(at: -3) == .a)
      XCTAssert(d.key(at: -301) == .d)

      let f = Key.KeyType.f
      XCTAssert(f.key(at: -3) == .c)

      let k: Key = "a##b"
      XCTAssert(k.accidental == .sharp && k.type == .a)

      let b = Key(type: .b, accidental: .natural)
      XCTAssert(Key(type: .c, accidental: .flat) == b)
      XCTAssert(Key(type: .c, accidental: .sharps(amount: 23)) == b)
      XCTAssert(Key(type: .c, accidental: .flats(amount: 13)) == b)
      XCTAssert(Key(type: .c, accidental: .flats(amount: 25)) == b)
      XCTAssert(Key(type: .c, accidental: .flats(amount: 24)) != b)
    }

    func testPitches() {
      let c0: Pitch = 12
      XCTAssert(c0.octave == 0 && c0.key.accidental == .natural && c0.key.type == .c)
      XCTAssert(c0 - 12 == 0)

      var pitch = Pitch(midiNote: 127)
      XCTAssert(pitch.key == Key(type: .g))
      pitch = Pitch(midiNote: 0)
      XCTAssert(pitch.key == Key(type: .c))
      pitch = Pitch(midiNote: 66, isPreferredAccidentalSharps: false)
      XCTAssert(pitch.key == Key(type: .g, accidental: .flat))

      let c1 = Pitch(key: Key(type: .c), octave: 1)
      XCTAssert(c1 + .m2 == Pitch(key: Key(type: .d, accidental: .flat), octave: 1))
      XCTAssert(c1 + .M2 == Pitch(key: Key(type: .d, accidental: .natural), octave: 1))
      XCTAssert(c1 + .m3 == Pitch(key: Key(type: .e, accidental: .flat), octave: 1))
      XCTAssert(c1 + .M3 == Pitch(key: Key(type: .e, accidental: .natural), octave: 1))
      XCTAssert(c1 + .P8 == Pitch(key: Key(type: .c, accidental: .natural), octave: 2))

      let d1 = Pitch(key: Key(type: .d), octave: 1)
      XCTAssert(d1 - .m2 == Pitch(key: Key(type: .c, accidental: .sharp), octave: 1))
      XCTAssert(d1 - .M2 == Pitch(key: Key(type: .c, accidental: .natural), octave: 1))

      let p: Pitch = "f#-5"
      XCTAssert(p.key === Key(type: .f, accidental: .sharp))
      XCTAssert(p.octave == -5)
      
      let uppercasePitch: Pitch = "A#3"
      XCTAssert(uppercasePitch.key === Key(type: .a, accidental: .sharp))
      XCTAssert(uppercasePitch.octave == 3)
      
      let uppercasePitch2: Pitch = "F4"
      XCTAssert(uppercasePitch2.key === Key(type: .f, accidental: .natural))
      XCTAssert(uppercasePitch2.octave == 4)
    }

    func testFrequency() {
      let note = Pitch(key: Key(type: .a), octave: 4)
      XCTAssertEqual(note.frequency, 440.0)

      let a4 = Pitch.nearest(frequency: 440.0)
      XCTAssertEqual(note, a4)
    }
}

// MARK: - [Pitch] Extension

// A function for checking that pitch arrays are exactly equal in terms of their pitches, keys, and octaves.
func === (lhs: [Pitch], rhs: [Pitch]) -> Bool {
  guard lhs.count == rhs.count else { return false }
  for i in 0 ..< lhs.count {
    if lhs[i] === rhs[i] {
      continue
    } else {
      return false
    }
  }
  return true
}
