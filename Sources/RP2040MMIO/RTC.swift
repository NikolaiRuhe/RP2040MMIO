import MMIO
import MMIOExtensions

/// Register block to control RTC
public struct RTC {

    public static var `default`: Self { .init(unsafeAddress: 0x4005c000) }

    /// Divider minus 1 for the 1 second counter. Safe to change the value when RTC is not enabled.
    public var CLKDIV_M1: Register<CLKDIV_M1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CLKDIV_M1_Descriptor {
        @available(*, unavailable)
        public var CLKDIV_M1: CLKDIV_M1_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLKDIV_M1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLKDIV_M1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CLKDIV_M1: UInt32 {
                @inlinable @inline(__always) get {
                    CLKDIV_M1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLKDIV_M1_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLKDIV_M1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CLKDIV_M1: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLKDIV_M1_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CLKDIV_M1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CLKDIV_M1_Field.self, BitField16.self)
                    self.raw.CLKDIV_M1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// RTC setup register 0
    public var SETUP_0: Register<SETUP_0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct SETUP_0_Descriptor {
        @available(*, unavailable)
        /// Year
        public var YEAR: YEAR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Month (1..12)
        public var MONTH: MONTH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Day of the month (1..31)
        public var DAY: DAY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum YEAR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 24
        }

        public enum MONTH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 12
        }

        public enum DAY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SETUP_0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var YEAR: UInt32 {
                @inlinable @inline(__always) get {
                    YEAR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    YEAR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var MONTH: UInt32 {
                @inlinable @inline(__always) get {
                  MONTH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MONTH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DAY: UInt32 {
                @inlinable @inline(__always) get {
                  DAY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DAY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SETUP_0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var YEAR: BitField12 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(YEAR_Field.self, BitField12.self)
                    return BitField12(storage: self.raw.YEAR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(YEAR_Field.self, BitField12.self)
                    self.raw.YEAR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var MONTH: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MONTH_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.MONTH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MONTH_Field.self, BitField4.self)
                  self.raw.MONTH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DAY: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DAY_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.DAY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DAY_Field.self, BitField5.self)
                  self.raw.DAY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// RTC setup register 1
    public var SETUP_1: Register<SETUP_1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct SETUP_1_Descriptor {
        @available(*, unavailable)
        /// Day of the week: 1-Monday...0-Sunday ISO 8601 mod 7
        public var DOTW: DOTW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Hours
        public var HOUR: HOUR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Minutes
        public var MIN: MIN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Seconds
        public var SEC: SEC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DOTW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 27
        }

        public enum HOUR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 21
        }

        public enum MIN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 14
        }

        public enum SEC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SETUP_1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DOTW: UInt32 {
                @inlinable @inline(__always) get {
                    DOTW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DOTW_Field.insert(newValue, into: &self.storage)
                }
                }
              public var HOUR: UInt32 {
                @inlinable @inline(__always) get {
                  HOUR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOUR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MIN: UInt32 {
                @inlinable @inline(__always) get {
                  MIN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MIN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SEC: UInt32 {
                @inlinable @inline(__always) get {
                  SEC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SEC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SETUP_1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DOTW: BitField3 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DOTW_Field.self, BitField3.self)
                    return BitField3(storage: self.raw.DOTW)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DOTW_Field.self, BitField3.self)
                    self.raw.DOTW = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var HOUR: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOUR_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.HOUR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HOUR_Field.self, BitField5.self)
                  self.raw.HOUR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MIN: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MIN_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.MIN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MIN_Field.self, BitField6.self)
                  self.raw.MIN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SEC: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SEC_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.SEC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SEC_Field.self, BitField6.self)
                  self.raw.SEC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// RTC Control and status
    public var CTRL: Register<CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct CTRL_Descriptor {
        @available(*, unavailable)
        /// If set, leapyear is forced off.
        /// Useful for years divisible by 100 but not by 400
        public var FORCE_NOTLEAPYEAR: FORCE_NOTLEAPYEAR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Load RTC
        public var LOAD: LOAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// RTC enabled (running)
        public var RTC_ACTIVE: RTC_ACTIVE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable RTC
        public var RTC_ENABLE: RTC_ENABLE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FORCE_NOTLEAPYEAR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum LOAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum RTC_ACTIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RTC_ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CTRL_Descriptor

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
                public var FORCE_NOTLEAPYEAR: UInt32 {
                @inlinable @inline(__always) get {
                    FORCE_NOTLEAPYEAR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FORCE_NOTLEAPYEAR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LOAD: UInt32 {
                @inlinable @inline(__always) get {
                  LOAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LOAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RTC_ACTIVE: UInt32 {
                @inlinable @inline(__always) get {
                  RTC_ACTIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RTC_ACTIVE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RTC_ENABLE: UInt32 {
                @inlinable @inline(__always) get {
                  RTC_ENABLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RTC_ENABLE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var FORCE_NOTLEAPYEAR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FORCE_NOTLEAPYEAR_Field.self, Bool.self)
                    return Bool(storage: self.raw.FORCE_NOTLEAPYEAR)
                }
                }
              public var LOAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LOAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.LOAD)
                }
              }
              public var RTC_ACTIVE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RTC_ACTIVE_Field.self, Bool.self)
                  return Bool(storage: self.raw.RTC_ACTIVE)
                }
              }
              public var RTC_ENABLE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RTC_ENABLE_Field.self, Bool.self)
                  return Bool(storage: self.raw.RTC_ENABLE)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var FORCE_NOTLEAPYEAR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FORCE_NOTLEAPYEAR_Field.self, Bool.self)
                    return Bool(storage: self.raw.FORCE_NOTLEAPYEAR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FORCE_NOTLEAPYEAR_Field.self, Bool.self)
                    self.raw.FORCE_NOTLEAPYEAR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LOAD: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LOAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.LOAD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LOAD_Field.self, Bool.self)
                  self.raw.LOAD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RTC_ENABLE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RTC_ENABLE_Field.self, Bool.self)
                  return Bool(storage: self.raw.RTC_ENABLE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RTC_ENABLE_Field.self, Bool.self)
                  self.raw.RTC_ENABLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt setup register 0
    public var IRQ_SETUP_0: Register<IRQ_SETUP_0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct IRQ_SETUP_0_Descriptor {
        @available(*, unavailable)
        public var MATCH_ACTIVE: MATCH_ACTIVE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Global match enable. Don't change any other value while this one is enabled
        public var MATCH_ENA: MATCH_ENA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable year matching
        public var YEAR_ENA: YEAR_ENA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable month matching
        public var MONTH_ENA: MONTH_ENA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable day matching
        public var DAY_ENA: DAY_ENA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Year
        public var YEAR: YEAR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Month (1..12)
        public var MONTH: MONTH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Day of the month (1..31)
        public var DAY: DAY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum MATCH_ACTIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum MATCH_ENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum YEAR_ENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum MONTH_ENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum DAY_ENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum YEAR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 24
        }

        public enum MONTH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 12
        }

        public enum DAY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IRQ_SETUP_0_Descriptor

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
                public var MATCH_ACTIVE: UInt32 {
                @inlinable @inline(__always) get {
                    MATCH_ACTIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    MATCH_ACTIVE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var MATCH_ENA: UInt32 {
                @inlinable @inline(__always) get {
                  MATCH_ENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MATCH_ENA_Field.insert(newValue, into: &self.storage)
                }
              }
              public var YEAR_ENA: UInt32 {
                @inlinable @inline(__always) get {
                  YEAR_ENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  YEAR_ENA_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MONTH_ENA: UInt32 {
                @inlinable @inline(__always) get {
                  MONTH_ENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MONTH_ENA_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DAY_ENA: UInt32 {
                @inlinable @inline(__always) get {
                  DAY_ENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DAY_ENA_Field.insert(newValue, into: &self.storage)
                }
              }
              public var YEAR: UInt32 {
                @inlinable @inline(__always) get {
                  YEAR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  YEAR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MONTH: UInt32 {
                @inlinable @inline(__always) get {
                  MONTH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MONTH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DAY: UInt32 {
                @inlinable @inline(__always) get {
                  DAY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DAY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IRQ_SETUP_0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var MATCH_ACTIVE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(MATCH_ACTIVE_Field.self, Bool.self)
                    return Bool(storage: self.raw.MATCH_ACTIVE)
                }
                }
              public var MATCH_ENA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MATCH_ENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.MATCH_ENA)
                }
              }
              public var YEAR_ENA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(YEAR_ENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.YEAR_ENA)
                }
              }
              public var MONTH_ENA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MONTH_ENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.MONTH_ENA)
                }
              }
              public var DAY_ENA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DAY_ENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.DAY_ENA)
                }
              }
              public var YEAR: BitField12 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(YEAR_Field.self, BitField12.self)
                  return BitField12(storage: self.raw.YEAR)
                }
              }
              public var MONTH: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MONTH_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.MONTH)
                }
              }
              public var DAY: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DAY_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.DAY)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IRQ_SETUP_0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var MATCH_ENA: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(MATCH_ENA_Field.self, Bool.self)
                    return Bool(storage: self.raw.MATCH_ENA)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(MATCH_ENA_Field.self, Bool.self)
                    self.raw.MATCH_ENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var YEAR_ENA: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(YEAR_ENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.YEAR_ENA)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(YEAR_ENA_Field.self, Bool.self)
                  self.raw.YEAR_ENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MONTH_ENA: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MONTH_ENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.MONTH_ENA)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MONTH_ENA_Field.self, Bool.self)
                  self.raw.MONTH_ENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DAY_ENA: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DAY_ENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.DAY_ENA)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DAY_ENA_Field.self, Bool.self)
                  self.raw.DAY_ENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var YEAR: BitField12 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(YEAR_Field.self, BitField12.self)
                  return BitField12(storage: self.raw.YEAR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(YEAR_Field.self, BitField12.self)
                  self.raw.YEAR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MONTH: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MONTH_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.MONTH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MONTH_Field.self, BitField4.self)
                  self.raw.MONTH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DAY: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DAY_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.DAY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DAY_Field.self, BitField5.self)
                  self.raw.DAY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt setup register 1
    public var IRQ_SETUP_1: Register<IRQ_SETUP_1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct IRQ_SETUP_1_Descriptor {
        @available(*, unavailable)
        /// Enable day of the week matching
        public var DOTW_ENA: DOTW_ENA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable hour matching
        public var HOUR_ENA: HOUR_ENA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable minute matching
        public var MIN_ENA: MIN_ENA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable second matching
        public var SEC_ENA: SEC_ENA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Day of the week
        public var DOTW: DOTW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Hours
        public var HOUR: HOUR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Minutes
        public var MIN: MIN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Seconds
        public var SEC: SEC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DOTW_ENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum HOUR_ENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum MIN_ENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum SEC_ENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum DOTW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 27
        }

        public enum HOUR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 21
        }

        public enum MIN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 14
        }

        public enum SEC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IRQ_SETUP_1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DOTW_ENA: UInt32 {
                @inlinable @inline(__always) get {
                    DOTW_ENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DOTW_ENA_Field.insert(newValue, into: &self.storage)
                }
                }
              public var HOUR_ENA: UInt32 {
                @inlinable @inline(__always) get {
                  HOUR_ENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOUR_ENA_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MIN_ENA: UInt32 {
                @inlinable @inline(__always) get {
                  MIN_ENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MIN_ENA_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SEC_ENA: UInt32 {
                @inlinable @inline(__always) get {
                  SEC_ENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SEC_ENA_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOTW: UInt32 {
                @inlinable @inline(__always) get {
                  DOTW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOTW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOUR: UInt32 {
                @inlinable @inline(__always) get {
                  HOUR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOUR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MIN: UInt32 {
                @inlinable @inline(__always) get {
                  MIN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MIN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SEC: UInt32 {
                @inlinable @inline(__always) get {
                  SEC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SEC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IRQ_SETUP_1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DOTW_ENA: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DOTW_ENA_Field.self, Bool.self)
                    return Bool(storage: self.raw.DOTW_ENA)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DOTW_ENA_Field.self, Bool.self)
                    self.raw.DOTW_ENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var HOUR_ENA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOUR_ENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOUR_ENA)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HOUR_ENA_Field.self, Bool.self)
                  self.raw.HOUR_ENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MIN_ENA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MIN_ENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.MIN_ENA)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MIN_ENA_Field.self, Bool.self)
                  self.raw.MIN_ENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SEC_ENA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SEC_ENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.SEC_ENA)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SEC_ENA_Field.self, Bool.self)
                  self.raw.SEC_ENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOTW: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOTW_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.DOTW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOTW_Field.self, BitField3.self)
                  self.raw.DOTW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HOUR: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOUR_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.HOUR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HOUR_Field.self, BitField5.self)
                  self.raw.HOUR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MIN: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MIN_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.MIN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MIN_Field.self, BitField6.self)
                  self.raw.MIN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SEC: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SEC_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.SEC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SEC_Field.self, BitField6.self)
                  self.raw.SEC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// RTC register 1.
    public var RTC_1: Register<RTC_1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct RTC_1_Descriptor {
        @available(*, unavailable)
        /// Year
        public var YEAR: YEAR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Month (1..12)
        public var MONTH: MONTH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Day of the month (1..31)
        public var DAY: DAY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum YEAR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 24
        }

        public enum MONTH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 12
        }

        public enum DAY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RTC_1_Descriptor

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
                public var YEAR: UInt32 {
                @inlinable @inline(__always) get {
                    YEAR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    YEAR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var MONTH: UInt32 {
                @inlinable @inline(__always) get {
                  MONTH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MONTH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DAY: UInt32 {
                @inlinable @inline(__always) get {
                  DAY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DAY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = RTC_1_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var YEAR: BitField12 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(YEAR_Field.self, BitField12.self)
                    return BitField12(storage: self.raw.YEAR)
                }
                }
              public var MONTH: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MONTH_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.MONTH)
                }
              }
              public var DAY: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DAY_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.DAY)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = RTC_1_Descriptor
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

    /// RTC register 0
    /// Read this before RTC 1!
    public var RTC_0: Register<RTC_0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct RTC_0_Descriptor {
        @available(*, unavailable)
        /// Day of the week
        public var DOTW: DOTW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Hours
        public var HOUR: HOUR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Minutes
        public var MIN: MIN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Seconds
        public var SEC: SEC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DOTW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 27
        }

        public enum HOUR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 21
        }

        public enum MIN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 14
        }

        public enum SEC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RTC_0_Descriptor

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
                public var DOTW: UInt32 {
                @inlinable @inline(__always) get {
                    DOTW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DOTW_Field.insert(newValue, into: &self.storage)
                }
                }
              public var HOUR: UInt32 {
                @inlinable @inline(__always) get {
                  HOUR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOUR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MIN: UInt32 {
                @inlinable @inline(__always) get {
                  MIN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MIN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SEC: UInt32 {
                @inlinable @inline(__always) get {
                  SEC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SEC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = RTC_0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var DOTW: BitField3 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DOTW_Field.self, BitField3.self)
                    return BitField3(storage: self.raw.DOTW)
                }
                }
              public var HOUR: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOUR_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.HOUR)
                }
              }
              public var MIN: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MIN_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.MIN)
                }
              }
              public var SEC: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SEC_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.SEC)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = RTC_0_Descriptor
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

    /// Raw Interrupts
    public var INTR: Register<INTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct INTR_Descriptor {
        @available(*, unavailable)
        public var RTC: RTC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RTC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTR_Descriptor

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
                public var RTC: UInt32 {
                @inlinable @inline(__always) get {
                    RTC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RTC_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RTC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RTC_Field.self, Bool.self)
                    return Bool(storage: self.raw.RTC)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INTR_Descriptor
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

    /// Interrupt Enable
    public var INTE: Register<INTE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct INTE_Descriptor {
        @available(*, unavailable)
        public var RTC: RTC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RTC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var RTC: UInt32 {
                @inlinable @inline(__always) get {
                    RTC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RTC_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var RTC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RTC_Field.self, Bool.self)
                    return Bool(storage: self.raw.RTC)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RTC_Field.self, Bool.self)
                    self.raw.RTC = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt Force
    public var INTF: Register<INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct INTF_Descriptor {
        @available(*, unavailable)
        public var RTC: RTC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RTC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTF_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var RTC: UInt32 {
                @inlinable @inline(__always) get {
                    RTC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RTC_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTF_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var RTC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RTC_Field.self, Bool.self)
                    return Bool(storage: self.raw.RTC)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RTC_Field.self, Bool.self)
                    self.raw.RTC = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt status after masking & forcing
    public var INTS: Register<INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct INTS_Descriptor {
        @available(*, unavailable)
        public var RTC: RTC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RTC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTS_Descriptor

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
                public var RTC: UInt32 {
                @inlinable @inline(__always) get {
                    RTC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RTC_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RTC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RTC_Field.self, Bool.self)
                    return Bool(storage: self.raw.RTC)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INTS_Descriptor
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

extension RTC.CLKDIV_M1_Descriptor: RegisterValue {
}

extension RTC.SETUP_0_Descriptor: RegisterValue {
}

extension RTC.SETUP_1_Descriptor: RegisterValue {
}

extension RTC.CTRL_Descriptor: RegisterValue {
}

extension RTC.IRQ_SETUP_0_Descriptor: RegisterValue {
}

extension RTC.IRQ_SETUP_1_Descriptor: RegisterValue {
}

extension RTC.RTC_1_Descriptor: RegisterValue {
}

extension RTC.RTC_0_Descriptor: RegisterValue {
}

extension RTC.INTR_Descriptor: RegisterValue {
}

extension RTC.INTE_Descriptor: RegisterValue {
}

extension RTC.INTF_Descriptor: RegisterValue {
}

extension RTC.INTS_Descriptor: RegisterValue {
}
