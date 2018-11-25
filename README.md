# Swift Musicology
A library for music theory, written in SWIFT.


Requirements
----
- Swift 4.0+
- iOS 8.0+


Installation
----
Create the framework and then drag and drop to your app. Make sure to add it to "Link Frameworks and Libraries" in your project's General settings

Usage
----

`SwiftMusicology` will give you access to several fairly simple enums and structs which can be used to define nearly any music related data that is based on Westen tonal relationships. For most people, the most commonly used of these data structures will be the  `Pitch`, `Key`, `Scale` and `Chord` structs.

It should be noted that all data types conform to `Codable`and `CustomStringConvertable` protocols.  Furthermore, `Pitch`, and `Accidental` structs are `RawPresentable` with `Int`, as well as `ExpressibleByIntegerLiteral`.

#### `Interval`

- Intervals are the semitones between pitches and thus the basic building blocks of Western music theory. They are `IntegerLiteral` so you can add or subsctract them between themselves, `Pitches` or `NoteType`s. You can define a custom interval with its quality, degree and semitone properties. Finally minor, major, perfect, augmented and diminished intervals, up to 2 octaves, are predefined for convenience.

#### `Pitch` and `Key`

- All keys can be defined with `Key` struct.  It has a `KeyType` where you can set the base key like C, D, A#, or Fb. All  keys must be initialised with an  `Accidental`  which can be `.natural`, `.flat`, `sharp` or something more custom such as`.sharps(amount: 3)`.
- `Pitch`es are created with with a `Key` and octave. You may also create `Pitch`es with MIDI note number. The `rawValue` of a pitch is its MIDI note number. In theory these are from 0-127; however, they are not limited and thus may go beyond this range in both directions.
- The `Pitch`, `Key`, `Accidental` structs have had custom operators defined for `==`, `+` and `-` in order to make calulations easier.
- Both of these structs can be defined with strings as well, though, for specificity's sake, it is advisable to not do so.

``` swift
// Standard method of definition
let gFlat = Key(type: g, accidental: .flat)
let a4 = Pitch(key: Key(type: .a), octave: 4)

// Definition with strings.
let dSharp: Key = "d#" // Is the equivalent of `Key(type: .a, accidental: .sharp)`
let aFlat3: Pitch = "ab3" // or "a♭3" or "Ab3" is Pitch(key: (type: .a, accidental: .flat), octave: 3)
```

#### `ScaleType` and `Scale`

- `ScaleType` enum exists as a covenient shortcut providing a substantial amount of predefined scales for the user such that you don't have to do the heavy lifting or defining each scale every time you want to use it. Various scales are available, from the standard major/minor to more exotic scales such as Promethean Neopolitan or Six Tone Symmetrical. You are also able to create a custom `ScaleType` in the following manner: `ScaleType.custom(intervals: [Interval], description: String)` 
- `Scale` defines a scale with a `ScaleType` and root `Key`. You are then able to generate notes of that scale in an octave range, as well as generate the scale's `HarmonicField` which are all the possible triad, tetrad or extended chords in a scale.

``` swift
let gLocrian = Scale(type: .locrian, key: Key(type: .g))
```

#### `ChordType` and `Chord`

- `ChordType` is a struct with `ChordPart`s which are the basic blocks of building chords. You can define any chord existing with `ChordType`. Thirds, fifths, sixths, sevenths and other extensions are parts of the `ChordType` as separate structs which also conform to the `ChordPart` protocol.
- `Chord` defines chords with type and a root key. This allows you to generate the notes of any chord in any octave range as well as in any inversion.


``` swift
let m13 = ChordType(third: .minor, seventh: .dominant, extensions: [ChordExtensionType(type: .thirteenth)])
let dm13 = Chord(type: m13, key: Key(type: .d))
```

#### `Tempo` and `TimeSignature`

- Tempo is a helper struct to define timings in your music app which consists of a `TimeSignature` and beats per minute. `TimeSignature` is the number of beats per measure and the  `NoteValue` of each beat. `NoteValue` defines the note's duration in a beat. It could be whole note, half note, quarter note, 8th, 16th, 32nd, or 64th note.



Unit Tests
----

Unit Tests are still being written. However, the library has currently been tested and is a fully operational battlesh... framework.
