import MMIO
import MMIOExtensions
public struct ROSC {

    public static var `default`: Self { .init(unsafeAddress: 0x40060000) }

    /// Ring Oscillator control
    public var CTRL: Register<CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CTRL_Descriptor {
        @available(*, unavailable)
        /// On power-up this field is initialised to ENABLE
        /// The system clock must be switched to another source before setting this field to DISABLE otherwise the chip will lock up
        /// The 12-bit code is intended to give some protection against accidental writes. An invalid setting will enable the oscillator.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }

        public enum ENABLE_Values: UInt, BitFieldProjectable {
            case ENABLE_DISABLE = 3358
            case ENABLE_ENABLE = 4011

            public static var bitWidth: Int { 12 }
        }
        @available(*, unavailable)

        /// Controls the number of delay stages in the ROSC ring
        /// LOW uses stages 0 to 7
        /// MEDIUM uses stages 0 to 5
        /// HIGH uses stages 0 to 3
        /// TOOHIGH uses stages 0 to 1 and should not be used because its frequency exceeds design specifications
        /// The clock output will not glitch when changing the range up one step at a time
        /// The clock output will glitch when changing the range down
        /// Note: the values here are gray coded which is why HIGH comes before TOOHIGH
        public var FREQ_RANGE: FREQ_RANGE_Field {
            get {
                fatalError()
            }
        }

        public enum FREQ_RANGE_Values: UInt, BitFieldProjectable {
            case FREQ_RANGE_LOW = 4004
            case FREQ_RANGE_MEDIUM = 4005
            case FREQ_RANGE_HIGH = 4007
            case FREQ_RANGE_TOOHIGH = 4006

            public static var bitWidth: Int { 12 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 24
        }

        public enum FREQ_RANGE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 12
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var ENABLE: UInt32 {
                @inlinable @inline(__always) get {
                    ENABLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ENABLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FREQ_RANGE: UInt32 {
                @inlinable @inline(__always) get {
                  FREQ_RANGE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FREQ_RANGE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var ENABLE: ENABLE_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ENABLE_Field.self, ENABLE_Values.self)
                    return ENABLE_Values(storage: self.raw.ENABLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ENABLE_Field.self, ENABLE_Values.self)
                    self.raw.ENABLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FREQ_RANGE: FREQ_RANGE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FREQ_RANGE_Field.self, FREQ_RANGE_Values.self)
                  return FREQ_RANGE_Values(storage: self.raw.FREQ_RANGE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FREQ_RANGE_Field.self, FREQ_RANGE_Values.self)
                  self.raw.FREQ_RANGE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// The FREQA & FREQB registers control the frequency by controlling the drive strength of each stage
    /// The drive strength has 4 levels determined by the number of bits set
    /// Increasing the number of bits set increases the drive strength and increases the oscillation frequency
    /// 0 bits set is the default drive strength
    /// 1 bit set doubles the drive strength
    /// 2 bits set triples drive strength
    /// 3 bits set quadruples drive strength
    public var FREQA: Register<FREQA_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct FREQA_Descriptor {
        @available(*, unavailable)
        /// Set to 0x9696 to apply the settings
        /// Any other value in this field will set all drive strengths to 0
        public var PASSWD: PASSWD_Field {
            get {
                fatalError()
            }
        }

        public enum PASSWD_Values: UInt, BitFieldProjectable {
            case PASSWD_PASS = 38550

            public static var bitWidth: Int { 16 }
        }
        @available(*, unavailable)

        /// Stage 3 drive strength
        public var DS3: DS3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Stage 2 drive strength
        public var DS2: DS2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Stage 1 drive strength
        public var DS1: DS1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Stage 0 drive strength
        public var DS0: DS0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PASSWD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum DS3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 15
        }

        public enum DS2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 11
        }

        public enum DS1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 7
        }

        public enum DS0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 3
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FREQA_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PASSWD: UInt32 {
                @inlinable @inline(__always) get {
                    PASSWD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PASSWD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var DS3: UInt32 {
                @inlinable @inline(__always) get {
                  DS3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DS3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DS2: UInt32 {
                @inlinable @inline(__always) get {
                  DS2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DS2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DS1: UInt32 {
                @inlinable @inline(__always) get {
                  DS1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DS1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DS0: UInt32 {
                @inlinable @inline(__always) get {
                  DS0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DS0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FREQA_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PASSWD: PASSWD_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PASSWD_Field.self, PASSWD_Values.self)
                    return PASSWD_Values(storage: self.raw.PASSWD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PASSWD_Field.self, PASSWD_Values.self)
                    self.raw.PASSWD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var DS3: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DS3_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.DS3)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DS3_Field.self, BitField3.self)
                  self.raw.DS3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DS2: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DS2_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.DS2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DS2_Field.self, BitField3.self)
                  self.raw.DS2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DS1: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DS1_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.DS1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DS1_Field.self, BitField3.self)
                  self.raw.DS1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DS0: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DS0_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.DS0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DS0_Field.self, BitField3.self)
                  self.raw.DS0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// For a detailed description see freqa register
    public var FREQB: Register<FREQB_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct FREQB_Descriptor {
        @available(*, unavailable)
        /// Set to 0x9696 to apply the settings
        /// Any other value in this field will set all drive strengths to 0
        public var PASSWD: PASSWD_Field {
            get {
                fatalError()
            }
        }

        public enum PASSWD_Values: UInt, BitFieldProjectable {
            case PASSWD_PASS = 38550

            public static var bitWidth: Int { 16 }
        }
        @available(*, unavailable)

        /// Stage 7 drive strength
        public var DS7: DS7_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Stage 6 drive strength
        public var DS6: DS6_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Stage 5 drive strength
        public var DS5: DS5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Stage 4 drive strength
        public var DS4: DS4_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PASSWD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum DS7_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 15
        }

        public enum DS6_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 11
        }

        public enum DS5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 7
        }

        public enum DS4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 3
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FREQB_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PASSWD: UInt32 {
                @inlinable @inline(__always) get {
                    PASSWD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PASSWD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var DS7: UInt32 {
                @inlinable @inline(__always) get {
                  DS7_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DS7_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DS6: UInt32 {
                @inlinable @inline(__always) get {
                  DS6_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DS6_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DS5: UInt32 {
                @inlinable @inline(__always) get {
                  DS5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DS5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DS4: UInt32 {
                @inlinable @inline(__always) get {
                  DS4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DS4_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FREQB_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PASSWD: PASSWD_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PASSWD_Field.self, PASSWD_Values.self)
                    return PASSWD_Values(storage: self.raw.PASSWD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PASSWD_Field.self, PASSWD_Values.self)
                    self.raw.PASSWD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var DS7: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DS7_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.DS7)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DS7_Field.self, BitField3.self)
                  self.raw.DS7 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DS6: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DS6_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.DS6)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DS6_Field.self, BitField3.self)
                  self.raw.DS6 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DS5: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DS5_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.DS5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DS5_Field.self, BitField3.self)
                  self.raw.DS5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DS4: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DS4_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.DS4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DS4_Field.self, BitField3.self)
                  self.raw.DS4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Ring Oscillator pause control
    /// This is used to save power by pausing the ROSC
    /// On power-up this field is initialised to WAKE
    /// An invalid write will also select WAKE
    /// Warning: setup the irq before selecting dormant mode
    public var DORMANT: Register<DORMANT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct DORMANT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DORMANT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DORMANT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Controls the output divider
    public var DIV: Register<DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct DIV_Descriptor {
        @available(*, unavailable)
        /// set to 0xaa0 + div where
        /// div = 0 divides by 32
        /// div = 1-31 divides by div
        /// any other value sets div=31
        /// this register resets to div=16
        public var DIV: DIV_Field {
            get {
                fatalError()
            }
        }

        public enum DIV_Values: UInt, BitFieldProjectable {
            case DIV_PASS = 2720

            public static var bitWidth: Int { 12 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DIV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 12
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DIV: UInt32 {
                @inlinable @inline(__always) get {
                    DIV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DIV_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DIV: DIV_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DIV_Field.self, DIV_Values.self)
                    return DIV_Values(storage: self.raw.DIV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DIV_Field.self, DIV_Values.self)
                    self.raw.DIV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Controls the phase shifted output
    public var PHASE: Register<PHASE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct PHASE_Descriptor {
        @available(*, unavailable)
        /// set to 0xaa
        /// any other value enables the output with shift=0
        public var PASSWD: PASSWD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// enable the phase-shifted output
        /// this can be changed on-the-fly
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// invert the phase-shifted output
        /// this is ignored when div=1
        public var FLIP: FLIP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// phase shift the phase-shifted output by SHIFT input clocks
        /// this can be changed on-the-fly
        /// must be set to 0 before setting div=1
        public var SHIFT: SHIFT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PASSWD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 12
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum FLIP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SHIFT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 2
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PHASE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PASSWD: UInt32 {
                @inlinable @inline(__always) get {
                    PASSWD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PASSWD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ENABLE: UInt32 {
                @inlinable @inline(__always) get {
                  ENABLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENABLE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FLIP: UInt32 {
                @inlinable @inline(__always) get {
                  FLIP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FLIP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SHIFT: UInt32 {
                @inlinable @inline(__always) get {
                  SHIFT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SHIFT_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PHASE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PASSWD: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PASSWD_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.PASSWD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PASSWD_Field.self, BitField8.self)
                    self.raw.PASSWD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ENABLE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENABLE_Field.self, Bool.self)
                  return Bool(storage: self.raw.ENABLE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENABLE_Field.self, Bool.self)
                  self.raw.ENABLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FLIP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FLIP_Field.self, Bool.self)
                  return Bool(storage: self.raw.FLIP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FLIP_Field.self, Bool.self)
                  self.raw.FLIP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SHIFT: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.SHIFT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField2.self)
                  self.raw.SHIFT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Ring Oscillator Status
    public var STATUS: Register<STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct STATUS_Descriptor {
        @available(*, unavailable)
        /// Oscillator is running and stable
        public var STABLE: STABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// An invalid value has been written to CTRL_ENABLE or CTRL_FREQ_RANGE or FREQA or FREQB or DIV or PHASE or DORMANT
        public var BADWRITE: BADWRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// post-divider is running
        /// this resets to 0 but transitions to 1 during chip startup
        public var DIV_RUNNING: DIV_RUNNING_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Oscillator is enabled but not necessarily running and stable
        /// this resets to 0 but transitions to 1 during chip startup
        public var ENABLED: ENABLED_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum STABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum BADWRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum DIV_RUNNING_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum ENABLED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = STATUS_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var STABLE: UInt32 {
                @inlinable @inline(__always) get {
                    STABLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    STABLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var BADWRITE: UInt32 {
                @inlinable @inline(__always) get {
                  BADWRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BADWRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIV_RUNNING: UInt32 {
                @inlinable @inline(__always) get {
                  DIV_RUNNING_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIV_RUNNING_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENABLED: UInt32 {
                @inlinable @inline(__always) get {
                  ENABLED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENABLED_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var STABLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(STABLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.STABLE)
                }
                }
              public var BADWRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BADWRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.BADWRITE)
                }
              }
              public var DIV_RUNNING: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIV_RUNNING_Field.self, Bool.self)
                  return Bool(storage: self.raw.DIV_RUNNING)
                }
              }
              public var ENABLED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENABLED_Field.self, Bool.self)
                  return Bool(storage: self.raw.ENABLED)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var BADWRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(BADWRITE_Field.self, Bool.self)
                    return Bool(storage: self.raw.BADWRITE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(BADWRITE_Field.self, Bool.self)
                    self.raw.BADWRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// This just reads the state of the oscillator output so randomness is compromised if the ring oscillator is stopped or run at a harmonic of the bus frequency
    public var RANDOMBIT: Register<RANDOMBIT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct RANDOMBIT_Descriptor {
        @available(*, unavailable)
        public var RANDOMBIT: RANDOMBIT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RANDOMBIT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RANDOMBIT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var RANDOMBIT: UInt32 {
                @inlinable @inline(__always) get {
                    RANDOMBIT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RANDOMBIT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = RANDOMBIT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RANDOMBIT: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RANDOMBIT_Field.self, Bool.self)
                    return Bool(storage: self.raw.RANDOMBIT)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = RANDOMBIT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// A down counter running at the ROSC frequency which counts to zero and stops.
    /// To start the counter write a non-zero value.
    /// Can be used for short software pauses when setting up time sensitive hardware.
    public var COUNT: Register<COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct COUNT_Descriptor {
        @available(*, unavailable)
        public var COUNT: COUNT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = COUNT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var COUNT: UInt32 {
                @inlinable @inline(__always) get {
                    COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    COUNT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var COUNT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(COUNT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.COUNT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(COUNT_Field.self, BitField8.self)
                    self.raw.COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    public  let unsafeAddress: UInt

    #if FEATURE_INTERPOSABLE
    var interposer: (any MMIOInterposer)?
    #endif

    #if FEATURE_INTERPOSABLE
    @inlinable @inline(__always)
    public init(unsafeAddress: UInt, interposer: (any MMIOInterposer)?) {
      self.unsafeAddress = unsafeAddress
      self.interposer = interposer
    }
    #else
    @inlinable @inline(__always)
    public init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress
    }
    #endif
}

extension ROSC.CTRL_Descriptor: RegisterValue {
}

extension ROSC.FREQA_Descriptor: RegisterValue {
}

extension ROSC.FREQB_Descriptor: RegisterValue {
}

extension ROSC.DORMANT_Descriptor: RegisterValue {
}

extension ROSC.DIV_Descriptor: RegisterValue {
}

extension ROSC.PHASE_Descriptor: RegisterValue {
}

extension ROSC.STATUS_Descriptor: RegisterValue {
}

extension ROSC.RANDOMBIT_Descriptor: RegisterValue {
}

extension ROSC.COUNT_Descriptor: RegisterValue {
}
