//
//  Scale Tests.swift
//  Swift MusicologyTests
//
//  Created by roux g. buciu on 2020-05-02.
//  Copyright © 2020 roux g. buciu. All rights reserved.
//

import XCTest
@testable import Swift_Musicology

class ScaleTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testScale() {
      let cMaj: [Key] = [
        Key(type: .c),
        Key(type: .d),
        Key(type: .e),
        Key(type: .f),
        Key(type: .g),
        Key(type: .a),
        Key(type: .b),
      ]

      let cMajScale = Scale(type: .major, key: Key(type: .c))
      XCTAssert(cMajScale.keys == cMaj)

      let cMin: [Key] = [
        Key(type: .c),
        Key(type: .d),
        Key(type: .e, accidental: .flat),
        Key(type: .f),
        Key(type: .g),
        Key(type: .a, accidental: .flat),
        Key(type: .b, accidental: .flat),
      ]

      let cMinScale = Scale(type: .minor, key: Key(type: .c))
      XCTAssert(cMinScale.keys == cMin)
    }

    func testHarmonicFields() {
      let cmaj = Scale(type: .major, key: Key(type: .c))
      let triads = cmaj.harmonicField(for: .triad)
      let triadsExpected = [
        Chord(type: ChordType(third: .major), key: Key(type: .c)),
        Chord(type: ChordType(third: .minor), key: Key(type: .d)),
        Chord(type: ChordType(third: .minor), key: Key(type: .e)),
        Chord(type: ChordType(third: .major), key: Key(type: .f)),
        Chord(type: ChordType(third: .major), key: Key(type: .g)),
        Chord(type: ChordType(third: .minor), key: Key(type: .a)),
        Chord(type: ChordType(third: .minor, fifth: .diminished), key: Key(type: .b)),
      ]
      XCTAssert(triads.enumerated().map({ $1 == triadsExpected[$0] }).filter({ $0 == false }).count == 0)
    }
}
