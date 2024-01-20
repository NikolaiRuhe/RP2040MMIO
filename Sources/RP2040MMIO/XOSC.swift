import MMIO
import MMIOExtensions

/// Controls the crystal oscillator
public struct XOSC {

    public static var `default`: Self { .init(unsafeAddress: 0x40024000) }

    /// Crystal Oscillator Control
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
        /// On power-up this field is initialised to DISABLE and the chip runs from the ROSC.
        /// If the chip has subsequently been programmed to run from the XOSC then setting this field to DISABLE may lock-up the chip. If this is a concern then run the clk_ref from the ROSC and enable the clk_sys RESUS feature.
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

        /// Frequency range. This resets to 0xAA0 and cannot be changed.
        public var FREQ_RANGE: FREQ_RANGE_Field {
            get {
                fatalError()
            }
        }

        public enum FREQ_RANGE_Values: UInt, BitFieldProjectable {
            case FREQ_RANGE_1_15MHZ = 2720
            case FREQ_RANGE_RESERVED_1 = 2721
            case FREQ_RANGE_RESERVED_2 = 2722
            case FREQ_RANGE_RESERVED_3 = 2723

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

    /// Crystal Oscillator Status
    public var STATUS: Register<STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
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

        /// An invalid value has been written to CTRL_ENABLE or CTRL_FREQ_RANGE or DORMANT
        public var BADWRITE: BADWRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Oscillator is enabled but not necessarily running and stable, resets to 0
        public var ENABLED: ENABLED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The current frequency range setting, always reads 0
        public var FREQ_RANGE: FREQ_RANGE_Field {
            get {
                fatalError()
            }
        }

        public enum FREQ_RANGE_Values: UInt, BitFieldProjectable {
            case FREQ_RANGE_1_15MHZ = 0
            case FREQ_RANGE_RESERVED_1 = 1
            case FREQ_RANGE_RESERVED_2 = 2
            case FREQ_RANGE_RESERVED_3 = 3

            public static var bitWidth: Int { 2 }
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

        public enum ENABLED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum FREQ_RANGE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 2
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
              public var ENABLED: UInt32 {
                @inlinable @inline(__always) get {
                  ENABLED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENABLED_Field.insert(newValue, into: &self.storage)
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
              public var ENABLED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENABLED_Field.self, Bool.self)
                  return Bool(storage: self.raw.ENABLED)
                }
              }
              public var FREQ_RANGE: FREQ_RANGE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FREQ_RANGE_Field.self, FREQ_RANGE_Values.self)
                  return FREQ_RANGE_Values(storage: self.raw.FREQ_RANGE)
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

    /// Crystal Oscillator pause control
    /// This is used to save power by pausing the XOSC
    /// On power-up this field is initialised to WAKE
    /// An invalid write will also select WAKE
    /// WARNING: stop the PLLs before selecting dormant mode
    /// WARNING: setup the irq before selecting dormant mode
    public var DORMANT: Register<DORMANT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
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

    /// Controls the startup delay
    public var STARTUP: Register<STARTUP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct STARTUP_Descriptor {
        @available(*, unavailable)
        /// Multiplies the startup_delay by 4. This is of little value to the user given that the delay can be programmed directly.
        public var X4: X4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// in multiples of 256*xtal_period. The reset value of 0xc4 corresponds to approx 50 000 cycles.
        public var DELAY: DELAY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum X4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum DELAY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 14
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = STARTUP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var X4: UInt32 {
                @inlinable @inline(__always) get {
                    X4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    X4_Field.insert(newValue, into: &self.storage)
                }
                }
              public var DELAY: UInt32 {
                @inlinable @inline(__always) get {
                  DELAY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DELAY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = STARTUP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var X4: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(X4_Field.self, Bool.self)
                    return Bool(storage: self.raw.X4)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(X4_Field.self, Bool.self)
                    self.raw.X4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var DELAY: BitField14 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DELAY_Field.self, BitField14.self)
                  return BitField14(storage: self.raw.DELAY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DELAY_Field.self, BitField14.self)
                  self.raw.DELAY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// A down counter running at the xosc frequency which counts to zero and stops.
    /// To start the counter write a non-zero value.
    /// Can be used for short software pauses when setting up time sensitive hardware.
    public var COUNT: Register<COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
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

extension XOSC.CTRL_Descriptor: RegisterValue {
}

extension XOSC.STATUS_Descriptor: RegisterValue {
}

extension XOSC.DORMANT_Descriptor: RegisterValue {
}

extension XOSC.STARTUP_Descriptor: RegisterValue {
}

extension XOSC.COUNT_Descriptor: RegisterValue {
}
