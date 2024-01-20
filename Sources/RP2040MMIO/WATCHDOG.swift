import MMIO
import MMIOExtensions
public struct WATCHDOG {

    public static var `default`: Self { .init(unsafeAddress: 0x40058000) }

    /// Watchdog control
    /// The rst_wdsel register determines which subsystems are reset when the watchdog is triggered.
    /// The watchdog can be triggered in software.
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
        /// Trigger a watchdog reset
        public var TRIGGER: TRIGGER_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// When not enabled the watchdog timer is paused
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pause the watchdog timer when processor 1 is in debug mode
        public var PAUSE_DBG1: PAUSE_DBG1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pause the watchdog timer when processor 0 is in debug mode
        public var PAUSE_DBG0: PAUSE_DBG0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pause the watchdog timer when JTAG is accessing the bus fabric
        public var PAUSE_JTAG: PAUSE_JTAG_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indicates the number of ticks / 2 (see errata RP2040-E1) before a watchdog reset will be triggered
        public var TIME: TIME_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TRIGGER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PAUSE_DBG1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum PAUSE_DBG0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum PAUSE_JTAG_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum TIME_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
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
                public var TRIGGER: UInt32 {
                @inlinable @inline(__always) get {
                    TRIGGER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TRIGGER_Field.insert(newValue, into: &self.storage)
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
              public var PAUSE_DBG1: UInt32 {
                @inlinable @inline(__always) get {
                  PAUSE_DBG1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PAUSE_DBG1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PAUSE_DBG0: UInt32 {
                @inlinable @inline(__always) get {
                  PAUSE_DBG0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PAUSE_DBG0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PAUSE_JTAG: UInt32 {
                @inlinable @inline(__always) get {
                  PAUSE_JTAG_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PAUSE_JTAG_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TIME: UInt32 {
                @inlinable @inline(__always) get {
                  TIME_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TIME_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var TRIGGER: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TRIGGER_Field.self, Bool.self)
                    return Bool(storage: self.raw.TRIGGER)
                }
                }
              public var ENABLE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENABLE_Field.self, Bool.self)
                  return Bool(storage: self.raw.ENABLE)
                }
              }
              public var PAUSE_DBG1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PAUSE_DBG1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PAUSE_DBG1)
                }
              }
              public var PAUSE_DBG0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PAUSE_DBG0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PAUSE_DBG0)
                }
              }
              public var PAUSE_JTAG: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PAUSE_JTAG_Field.self, Bool.self)
                  return Bool(storage: self.raw.PAUSE_JTAG)
                }
              }
              public var TIME: BitField24 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TIME_Field.self, BitField24.self)
                  return BitField24(storage: self.raw.TIME)
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
                public var TRIGGER: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TRIGGER_Field.self, Bool.self)
                    return Bool(storage: self.raw.TRIGGER)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TRIGGER_Field.self, Bool.self)
                    self.raw.TRIGGER = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ENABLE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENABLE_Field.self, Bool.self)
                  return Bool(storage: self.raw.ENABLE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENABLE_Field.self, Bool.self)
                  self.raw.ENABLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PAUSE_DBG1: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PAUSE_DBG1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PAUSE_DBG1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PAUSE_DBG1_Field.self, Bool.self)
                  self.raw.PAUSE_DBG1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PAUSE_DBG0: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PAUSE_DBG0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PAUSE_DBG0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PAUSE_DBG0_Field.self, Bool.self)
                  self.raw.PAUSE_DBG0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PAUSE_JTAG: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PAUSE_JTAG_Field.self, Bool.self)
                  return Bool(storage: self.raw.PAUSE_JTAG)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PAUSE_JTAG_Field.self, Bool.self)
                  self.raw.PAUSE_JTAG = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Load the watchdog timer. The maximum setting is 0xffffff which corresponds to 0xffffff / 2 ticks before triggering a watchdog reset (see errata RP2040-E1).
    public var LOAD: Register<LOAD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct LOAD_Descriptor {
        @available(*, unavailable)
        public var LOAD: LOAD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum LOAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = LOAD_Descriptor

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
                public var LOAD: UInt32 {
                @inlinable @inline(__always) get {
                    LOAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    LOAD_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = LOAD_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = LOAD_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var LOAD: BitField24 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(LOAD_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.LOAD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(LOAD_Field.self, BitField24.self)
                    self.raw.LOAD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Logs the reason for the last reset. Both bits are zero for the case of a hardware reset.
    public var REASON: Register<REASON_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct REASON_Descriptor {
        @available(*, unavailable)
        public var FORCE: FORCE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TIMER: TIMER_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FORCE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum TIMER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = REASON_Descriptor

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
                public var FORCE: UInt32 {
                @inlinable @inline(__always) get {
                    FORCE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FORCE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var TIMER: UInt32 {
                @inlinable @inline(__always) get {
                  TIMER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TIMER_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = REASON_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var FORCE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FORCE_Field.self, Bool.self)
                    return Bool(storage: self.raw.FORCE)
                }
                }
              public var TIMER: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TIMER_Field.self, Bool.self)
                  return Bool(storage: self.raw.TIMER)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = REASON_Descriptor
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

    /// Scratch register. Information persists through soft reset of the chip.
    public var SCRATCH0: Register<SCRATCH0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct SCRATCH0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SCRATCH0_Descriptor

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

                    public  typealias Value = SCRATCH0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Scratch register. Information persists through soft reset of the chip.
    public var SCRATCH1: Register<SCRATCH1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct SCRATCH1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SCRATCH1_Descriptor

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

                    public  typealias Value = SCRATCH1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Scratch register. Information persists through soft reset of the chip.
    public var SCRATCH2: Register<SCRATCH2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct SCRATCH2_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SCRATCH2_Descriptor

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

                    public  typealias Value = SCRATCH2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Scratch register. Information persists through soft reset of the chip.
    public var SCRATCH3: Register<SCRATCH3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct SCRATCH3_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SCRATCH3_Descriptor

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

                    public  typealias Value = SCRATCH3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Scratch register. Information persists through soft reset of the chip.
    public var SCRATCH4: Register<SCRATCH4_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct SCRATCH4_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SCRATCH4_Descriptor

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

                    public  typealias Value = SCRATCH4_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Scratch register. Information persists through soft reset of the chip.
    public var SCRATCH5: Register<SCRATCH5_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct SCRATCH5_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SCRATCH5_Descriptor

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

                    public  typealias Value = SCRATCH5_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Scratch register. Information persists through soft reset of the chip.
    public var SCRATCH6: Register<SCRATCH6_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct SCRATCH6_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SCRATCH6_Descriptor

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

                    public  typealias Value = SCRATCH6_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Scratch register. Information persists through soft reset of the chip.
    public var SCRATCH7: Register<SCRATCH7_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct SCRATCH7_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SCRATCH7_Descriptor

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

                    public  typealias Value = SCRATCH7_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Controls the tick generator
    public var TICK: Register<TICK_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct TICK_Descriptor {
        @available(*, unavailable)
        /// Count down timer: the remaining number clk_tick cycles before the next tick is generated.
        public var COUNT: COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Is the tick generator running?
        public var RUNNING: RUNNING_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// start / stop tick generation
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Total number of clk_tick cycles before the next tick.
        public var CYCLES: CYCLES_Field {
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
          public static let bitRange = 11 ..< 20
        }

        public enum RUNNING_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum CYCLES_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TICK_Descriptor

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
                public var COUNT: UInt32 {
                @inlinable @inline(__always) get {
                    COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    COUNT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RUNNING: UInt32 {
                @inlinable @inline(__always) get {
                  RUNNING_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RUNNING_Field.insert(newValue, into: &self.storage)
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
              public var CYCLES: UInt32 {
                @inlinable @inline(__always) get {
                  CYCLES_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CYCLES_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = TICK_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var COUNT: BitField9 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(COUNT_Field.self, BitField9.self)
                    return BitField9(storage: self.raw.COUNT)
                }
                }
              public var RUNNING: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RUNNING_Field.self, Bool.self)
                  return Bool(storage: self.raw.RUNNING)
                }
              }
              public var ENABLE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENABLE_Field.self, Bool.self)
                  return Bool(storage: self.raw.ENABLE)
                }
              }
              public var CYCLES: BitField9 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CYCLES_Field.self, BitField9.self)
                  return BitField9(storage: self.raw.CYCLES)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = TICK_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var ENABLE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ENABLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.ENABLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ENABLE_Field.self, Bool.self)
                    self.raw.ENABLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var CYCLES: BitField9 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CYCLES_Field.self, BitField9.self)
                  return BitField9(storage: self.raw.CYCLES)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CYCLES_Field.self, BitField9.self)
                  self.raw.CYCLES = newValue.storage(Self.Value.Raw.Storage.self)
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

extension WATCHDOG.CTRL_Descriptor: RegisterValue {
}

extension WATCHDOG.LOAD_Descriptor: RegisterValue {
}

extension WATCHDOG.REASON_Descriptor: RegisterValue {
}

extension WATCHDOG.SCRATCH0_Descriptor: RegisterValue {
}

extension WATCHDOG.SCRATCH1_Descriptor: RegisterValue {
}

extension WATCHDOG.SCRATCH2_Descriptor: RegisterValue {
}

extension WATCHDOG.SCRATCH3_Descriptor: RegisterValue {
}

extension WATCHDOG.SCRATCH4_Descriptor: RegisterValue {
}

extension WATCHDOG.SCRATCH5_Descriptor: RegisterValue {
}

extension WATCHDOG.SCRATCH6_Descriptor: RegisterValue {
}

extension WATCHDOG.SCRATCH7_Descriptor: RegisterValue {
}

extension WATCHDOG.TICK_Descriptor: RegisterValue {
}
