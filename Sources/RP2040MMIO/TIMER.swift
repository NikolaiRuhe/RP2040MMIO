import MMIO
import MMIOExtensions

/// Controls time and alarms
/// time is a 64 bit value indicating the time in usec since power-on
/// timeh is the top 32 bits of time & timel is the bottom 32 bits
/// to change time write to timelw before timehw
/// to read time read from timelr before timehr
/// An alarm is set by setting alarm_enable and writing to the corresponding alarm register
/// When an alarm is pending, the corresponding alarm_running signal will be high
/// An alarm can be cancelled before it has finished by clearing the alarm_enable
/// When an alarm fires, the corresponding alarm_irq is set and alarm_running is cleared
/// To clear the interrupt write a 1 to the corresponding alarm_irq
public struct TIMER {

    public static var `default`: Self { .init(unsafeAddress: 0x40054000) }

    /// Write to bits 63:32 of time
    /// always write timelw before timehw
    public var TIMEHW: Register<TIMEHW_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct TIMEHW_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TIMEHW_Descriptor

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

                    public  typealias Value = TIMEHW_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Write to bits 31:0 of time
    /// writes do not get copied to time until timehw is written
    public var TIMELW: Register<TIMELW_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct TIMELW_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TIMELW_Descriptor

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

                    public  typealias Value = TIMELW_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read from bits 63:32 of time
    /// always read timelr before timehr
    public var TIMEHR: Register<TIMEHR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct TIMEHR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TIMEHR_Descriptor

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

                    public  typealias Value = TIMEHR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read from bits 31:0 of time
    public var TIMELR: Register<TIMELR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct TIMELR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TIMELR_Descriptor

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

                    public  typealias Value = TIMELR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Arm alarm 0, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM0 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    public var ALARM0: Register<ALARM0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct ALARM0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ALARM0_Descriptor

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

                    public  typealias Value = ALARM0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Arm alarm 1, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM1 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    public var ALARM1: Register<ALARM1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct ALARM1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ALARM1_Descriptor

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

                    public  typealias Value = ALARM1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Arm alarm 2, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM2 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    public var ALARM2: Register<ALARM2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct ALARM2_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ALARM2_Descriptor

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

                    public  typealias Value = ALARM2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Arm alarm 3, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM3 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    public var ALARM3: Register<ALARM3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct ALARM3_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ALARM3_Descriptor

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

                    public  typealias Value = ALARM3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Indicates the armed/disarmed status of each alarm.
    /// A write to the corresponding ALARMx register arms the alarm.
    /// Alarms automatically disarm upon firing, but writing ones here
    /// will disarm immediately without waiting to fire.
    public var ARMED: Register<ARMED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct ARMED_Descriptor {
        @available(*, unavailable)
        public var ARMED: ARMED_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ARMED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ARMED_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var ARMED: UInt32 {
                @inlinable @inline(__always) get {
                    ARMED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ARMED_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ARMED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var ARMED: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ARMED_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.ARMED)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ARMED_Field.self, BitField4.self)
                    self.raw.ARMED = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Raw read from bits 63:32 of time (no side effects)
    public var TIMERAWH: Register<TIMERAWH_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct TIMERAWH_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TIMERAWH_Descriptor

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

                    public  typealias Value = TIMERAWH_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Raw read from bits 31:0 of time (no side effects)
    public var TIMERAWL: Register<TIMERAWL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct TIMERAWL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TIMERAWL_Descriptor

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

                    public  typealias Value = TIMERAWL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Set bits high to enable pause when the corresponding debug ports are active
    public var DBGPAUSE: Register<DBGPAUSE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct DBGPAUSE_Descriptor {
        @available(*, unavailable)
        /// Pause when processor 1 is in debug mode
        public var DBG1: DBG1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pause when processor 0 is in debug mode
        public var DBG0: DBG0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DBG1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum DBG0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DBGPAUSE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DBG1: UInt32 {
                @inlinable @inline(__always) get {
                    DBG1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DBG1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var DBG0: UInt32 {
                @inlinable @inline(__always) get {
                  DBG0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DBG0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DBGPAUSE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DBG1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DBG1_Field.self, Bool.self)
                    return Bool(storage: self.raw.DBG1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DBG1_Field.self, Bool.self)
                    self.raw.DBG1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var DBG0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DBG0_Field.self, Bool.self)
                  return Bool(storage: self.raw.DBG0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DBG0_Field.self, Bool.self)
                  self.raw.DBG0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Set high to pause the timer
    public var PAUSE: Register<PAUSE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct PAUSE_Descriptor {
        @available(*, unavailable)
        public var PAUSE: PAUSE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PAUSE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PAUSE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PAUSE: UInt32 {
                @inlinable @inline(__always) get {
                    PAUSE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PAUSE_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PAUSE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PAUSE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PAUSE_Field.self, Bool.self)
                    return Bool(storage: self.raw.PAUSE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PAUSE_Field.self, Bool.self)
                    self.raw.PAUSE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Raw Interrupts
    public var INTR: Register<INTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct INTR_Descriptor {
        @available(*, unavailable)
        public var ALARM_3: ALARM_3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_2: ALARM_2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_1: ALARM_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_0: ALARM_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ALARM_3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum ALARM_2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum ALARM_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum ALARM_0_Field: ContiguousBitField {
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

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var ALARM_3: UInt32 {
                @inlinable @inline(__always) get {
                    ALARM_3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ALARM_3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ALARM_2: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ALARM_1: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ALARM_0: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var ALARM_3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ALARM_3_Field.self, Bool.self)
                    return Bool(storage: self.raw.ALARM_3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ALARM_3_Field.self, Bool.self)
                    self.raw.ALARM_3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ALARM_2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_2_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ALARM_2_Field.self, Bool.self)
                  self.raw.ALARM_2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ALARM_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ALARM_1_Field.self, Bool.self)
                  self.raw.ALARM_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ALARM_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ALARM_0_Field.self, Bool.self)
                  self.raw.ALARM_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Enable
    public var INTE: Register<INTE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct INTE_Descriptor {
        @available(*, unavailable)
        public var ALARM_3: ALARM_3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_2: ALARM_2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_1: ALARM_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_0: ALARM_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ALARM_3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum ALARM_2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum ALARM_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum ALARM_0_Field: ContiguousBitField {
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
                public var ALARM_3: UInt32 {
                @inlinable @inline(__always) get {
                    ALARM_3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ALARM_3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ALARM_2: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ALARM_1: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ALARM_0: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_0_Field.insert(newValue, into: &self.storage)
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
                public var ALARM_3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ALARM_3_Field.self, Bool.self)
                    return Bool(storage: self.raw.ALARM_3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ALARM_3_Field.self, Bool.self)
                    self.raw.ALARM_3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ALARM_2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_2_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ALARM_2_Field.self, Bool.self)
                  self.raw.ALARM_2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ALARM_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ALARM_1_Field.self, Bool.self)
                  self.raw.ALARM_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ALARM_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ALARM_0_Field.self, Bool.self)
                  self.raw.ALARM_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Force
    public var INTF: Register<INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct INTF_Descriptor {
        @available(*, unavailable)
        public var ALARM_3: ALARM_3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_2: ALARM_2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_1: ALARM_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_0: ALARM_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ALARM_3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum ALARM_2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum ALARM_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum ALARM_0_Field: ContiguousBitField {
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
                public var ALARM_3: UInt32 {
                @inlinable @inline(__always) get {
                    ALARM_3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ALARM_3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ALARM_2: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ALARM_1: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ALARM_0: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_0_Field.insert(newValue, into: &self.storage)
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
                public var ALARM_3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ALARM_3_Field.self, Bool.self)
                    return Bool(storage: self.raw.ALARM_3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ALARM_3_Field.self, Bool.self)
                    self.raw.ALARM_3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ALARM_2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_2_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ALARM_2_Field.self, Bool.self)
                  self.raw.ALARM_2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ALARM_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ALARM_1_Field.self, Bool.self)
                  self.raw.ALARM_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ALARM_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ALARM_0_Field.self, Bool.self)
                  self.raw.ALARM_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt status after masking & forcing
    public var INTS: Register<INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct INTS_Descriptor {
        @available(*, unavailable)
        public var ALARM_3: ALARM_3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_2: ALARM_2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_1: ALARM_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ALARM_0: ALARM_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ALARM_3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum ALARM_2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum ALARM_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum ALARM_0_Field: ContiguousBitField {
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
                public var ALARM_3: UInt32 {
                @inlinable @inline(__always) get {
                    ALARM_3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ALARM_3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ALARM_2: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ALARM_1: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ALARM_0: UInt32 {
                @inlinable @inline(__always) get {
                  ALARM_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ALARM_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var ALARM_3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ALARM_3_Field.self, Bool.self)
                    return Bool(storage: self.raw.ALARM_3)
                }
                }
              public var ALARM_2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_2_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_2)
                }
              }
              public var ALARM_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_1)
                }
              }
              public var ALARM_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ALARM_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.ALARM_0)
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

extension TIMER.TIMEHW_Descriptor: RegisterValue {
}

extension TIMER.TIMELW_Descriptor: RegisterValue {
}

extension TIMER.TIMEHR_Descriptor: RegisterValue {
}

extension TIMER.TIMELR_Descriptor: RegisterValue {
}

extension TIMER.ALARM0_Descriptor: RegisterValue {
}

extension TIMER.ALARM1_Descriptor: RegisterValue {
}

extension TIMER.ALARM2_Descriptor: RegisterValue {
}

extension TIMER.ALARM3_Descriptor: RegisterValue {
}

extension TIMER.ARMED_Descriptor: RegisterValue {
}

extension TIMER.TIMERAWH_Descriptor: RegisterValue {
}

extension TIMER.TIMERAWL_Descriptor: RegisterValue {
}

extension TIMER.DBGPAUSE_Descriptor: RegisterValue {
}

extension TIMER.PAUSE_Descriptor: RegisterValue {
}

extension TIMER.INTR_Descriptor: RegisterValue {
}

extension TIMER.INTE_Descriptor: RegisterValue {
}

extension TIMER.INTF_Descriptor: RegisterValue {
}

extension TIMER.INTS_Descriptor: RegisterValue {
}
