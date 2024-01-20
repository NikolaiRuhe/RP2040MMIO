import MMIO
import MMIOExtensions
public struct PPB {

    public static var `default`: Self { .init(unsafeAddress: 0xe0000000) }

    /// Use the SysTick Control and Status Register to enable the SysTick features.
    public var SYST_CSR: Register<SYST_CSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe010))
          #endif
        }
    }
    public struct SYST_CSR_Descriptor {
        @available(*, unavailable)
        /// Returns 1 if timer counted to 0 since last time this was read. Clears on read by application or debugger.
        public var COUNTFLAG: COUNTFLAG_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// SysTick clock source. Always reads as one if SYST_CALIB reports NOREF.
        /// Selects the SysTick timer clock source:
        /// 0 = External reference clock.
        /// 1 = Processor clock.
        public var CLKSOURCE: CLKSOURCE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enables SysTick exception request:
        /// 0 = Counting down to zero does not assert the SysTick exception request.
        /// 1 = Counting down to zero to asserts the SysTick exception request.
        public var TICKINT: TICKINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable SysTick counter:
        /// 0 = Counter disabled.
        /// 1 = Counter enabled.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum COUNTFLAG_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum CLKSOURCE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum TICKINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SYST_CSR_Descriptor

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
                public var COUNTFLAG: UInt32 {
                @inlinable @inline(__always) get {
                    COUNTFLAG_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    COUNTFLAG_Field.insert(newValue, into: &self.storage)
                }
                }
              public var CLKSOURCE: UInt32 {
                @inlinable @inline(__always) get {
                  CLKSOURCE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CLKSOURCE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TICKINT: UInt32 {
                @inlinable @inline(__always) get {
                  TICKINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TICKINT_Field.insert(newValue, into: &self.storage)
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
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SYST_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var COUNTFLAG: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(COUNTFLAG_Field.self, Bool.self)
                    return Bool(storage: self.raw.COUNTFLAG)
                }
                }
              public var CLKSOURCE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CLKSOURCE_Field.self, Bool.self)
                  return Bool(storage: self.raw.CLKSOURCE)
                }
              }
              public var TICKINT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TICKINT_Field.self, Bool.self)
                  return Bool(storage: self.raw.TICKINT)
                }
              }
              public var ENABLE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENABLE_Field.self, Bool.self)
                  return Bool(storage: self.raw.ENABLE)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SYST_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var CLKSOURCE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLKSOURCE_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLKSOURCE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CLKSOURCE_Field.self, Bool.self)
                    self.raw.CLKSOURCE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var TICKINT: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TICKINT_Field.self, Bool.self)
                  return Bool(storage: self.raw.TICKINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TICKINT_Field.self, Bool.self)
                  self.raw.TICKINT = newValue.storage(Self.Value.Raw.Storage.self)
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
        }
    }

    /// Use the SysTick Reload Value Register to specify the start value to load into the current value register when the counter reaches 0. It can be any value between 0 and 0x00FFFFFF. A start value of 0 is possible, but has no effect because the SysTick interrupt and COUNTFLAG are activated when counting from 1 to 0. The reset value of this register is UNKNOWN.
    /// To generate a multi-shot timer with a period of N processor clock cycles, use a RELOAD value of N-1. For example, if the SysTick interrupt is required every 100 clock pulses, set RELOAD to 99.
    public var SYST_RVR: Register<SYST_RVR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe014))
          #endif
        }
    }
    public struct SYST_RVR_Descriptor {
        @available(*, unavailable)
        /// Value to load into the SysTick Current Value Register when the counter reaches 0.
        public var RELOAD: RELOAD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RELOAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SYST_RVR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var RELOAD: UInt32 {
                @inlinable @inline(__always) get {
                    RELOAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RELOAD_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SYST_RVR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var RELOAD: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RELOAD_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.RELOAD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RELOAD_Field.self, BitField24.self)
                    self.raw.RELOAD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Use the SysTick Current Value Register to find the current value in the register. The reset value of this register is UNKNOWN.
    public var SYST_CVR: Register<SYST_CVR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe018))
          #endif
        }
    }
    public struct SYST_CVR_Descriptor {
        @available(*, unavailable)
        /// Reads return the current value of the SysTick counter. This register is write-clear. Writing to it with any value clears the register to 0. Clearing this register also clears the COUNTFLAG bit of the SysTick Control and Status Register.
        public var CURRENT: CURRENT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CURRENT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SYST_CVR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CURRENT: UInt32 {
                @inlinable @inline(__always) get {
                    CURRENT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CURRENT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SYST_CVR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CURRENT: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CURRENT_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.CURRENT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CURRENT_Field.self, BitField24.self)
                    self.raw.CURRENT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Use the SysTick Calibration Value Register to enable software to scale to any required speed using divide and multiply.
    public var SYST_CALIB: Register<SYST_CALIB_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe01c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe01c))
          #endif
        }
    }
    public struct SYST_CALIB_Descriptor {
        @available(*, unavailable)
        /// If reads as 1, the Reference clock is not provided - the CLKSOURCE bit of the SysTick Control and Status register will be forced to 1 and cannot be cleared to 0.
        public var NOREF: NOREF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If reads as 1, the calibration value for 10ms is inexact (due to clock frequency).
        public var SKEW: SKEW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// An optional Reload value to be used for 10ms (100Hz) timing, subject to system clock skew errors. If the value reads as 0, the calibration value is not known.
        public var TENMS: TENMS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NOREF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum SKEW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum TENMS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SYST_CALIB_Descriptor

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
                public var NOREF: UInt32 {
                @inlinable @inline(__always) get {
                    NOREF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NOREF_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SKEW: UInt32 {
                @inlinable @inline(__always) get {
                  SKEW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SKEW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TENMS: UInt32 {
                @inlinable @inline(__always) get {
                  TENMS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TENMS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SYST_CALIB_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var NOREF: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NOREF_Field.self, Bool.self)
                    return Bool(storage: self.raw.NOREF)
                }
                }
              public var SKEW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SKEW_Field.self, Bool.self)
                  return Bool(storage: self.raw.SKEW)
                }
              }
              public var TENMS: BitField24 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TENMS_Field.self, BitField24.self)
                  return BitField24(storage: self.raw.TENMS)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SYST_CALIB_Descriptor
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

    /// Use the Interrupt Set-Enable Register to enable interrupts and determine which interrupts are currently enabled.
    /// If a pending interrupt is enabled, the NVIC activates the interrupt based on its priority. If an interrupt is not enabled, asserting its interrupt signal changes the interrupt state to pending, but the NVIC never activates the interrupt, regardless of its priority.
    public var NVIC_ISER: Register<NVIC_ISER_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe100), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe100))
          #endif
        }
    }
    public struct NVIC_ISER_Descriptor {
        @available(*, unavailable)
        /// Interrupt set-enable bits.
        /// Write:
        /// 0 = No effect.
        /// 1 = Enable interrupt.
        /// Read:
        /// 0 = Interrupt disabled.
        /// 1 = Interrupt enabled.
        public var SETENA: SETENA_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SETENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_ISER_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SETENA: UInt32 {
                @inlinable @inline(__always) get {
                    SETENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SETENA_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_ISER_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SETENA: BitField32 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SETENA_Field.self, BitField32.self)
                    return BitField32(storage: self.raw.SETENA)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SETENA_Field.self, BitField32.self)
                    self.raw.SETENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Use the Interrupt Clear-Enable Registers to disable interrupts and determine which interrupts are currently enabled.
    public var NVIC_ICER: Register<NVIC_ICER_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe180), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe180))
          #endif
        }
    }
    public struct NVIC_ICER_Descriptor {
        @available(*, unavailable)
        /// Interrupt clear-enable bits.
        /// Write:
        /// 0 = No effect.
        /// 1 = Disable interrupt.
        /// Read:
        /// 0 = Interrupt disabled.
        /// 1 = Interrupt enabled.
        public var CLRENA: CLRENA_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLRENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_ICER_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CLRENA: UInt32 {
                @inlinable @inline(__always) get {
                    CLRENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLRENA_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_ICER_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CLRENA: BitField32 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLRENA_Field.self, BitField32.self)
                    return BitField32(storage: self.raw.CLRENA)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CLRENA_Field.self, BitField32.self)
                    self.raw.CLRENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// The NVIC_ISPR forces interrupts into the pending state, and shows which interrupts are pending.
    public var NVIC_ISPR: Register<NVIC_ISPR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe200), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe200))
          #endif
        }
    }
    public struct NVIC_ISPR_Descriptor {
        @available(*, unavailable)
        /// Interrupt set-pending bits.
        /// Write:
        /// 0 = No effect.
        /// 1 = Changes interrupt state to pending.
        /// Read:
        /// 0 = Interrupt is not pending.
        /// 1 = Interrupt is pending.
        /// Note: Writing 1 to the NVIC_ISPR bit corresponding to:
        /// An interrupt that is pending has no effect.
        /// A disabled interrupt sets the state of that interrupt to pending.
        public var SETPEND: SETPEND_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SETPEND_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_ISPR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SETPEND: UInt32 {
                @inlinable @inline(__always) get {
                    SETPEND_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SETPEND_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_ISPR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SETPEND: BitField32 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SETPEND_Field.self, BitField32.self)
                    return BitField32(storage: self.raw.SETPEND)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SETPEND_Field.self, BitField32.self)
                    self.raw.SETPEND = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Use the Interrupt Clear-Pending Register to clear pending interrupts and determine which interrupts are currently pending.
    public var NVIC_ICPR: Register<NVIC_ICPR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe280), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe280))
          #endif
        }
    }
    public struct NVIC_ICPR_Descriptor {
        @available(*, unavailable)
        /// Interrupt clear-pending bits.
        /// Write:
        /// 0 = No effect.
        /// 1 = Removes pending state and interrupt.
        /// Read:
        /// 0 = Interrupt is not pending.
        /// 1 = Interrupt is pending.
        public var CLRPEND: CLRPEND_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLRPEND_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_ICPR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CLRPEND: UInt32 {
                @inlinable @inline(__always) get {
                    CLRPEND_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLRPEND_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_ICPR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CLRPEND: BitField32 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLRPEND_Field.self, BitField32.self)
                    return BitField32(storage: self.raw.CLRPEND)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CLRPEND_Field.self, BitField32.self)
                    self.raw.CLRPEND = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    /// Note: Writing 1 to an NVIC_ICPR bit does not affect the active state of the corresponding interrupt.
    /// These registers are only word-accessible
    public var NVIC_IPR0: Register<NVIC_IPR0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe400), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe400))
          #endif
        }
    }
    public struct NVIC_IPR0_Descriptor {
        @available(*, unavailable)
        /// Priority of interrupt 3
        public var IP_3: IP_3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 2
        public var IP_2: IP_2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 1
        public var IP_1: IP_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 0
        public var IP_0: IP_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IP_3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 32
        }

        public enum IP_2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 24
        }

        public enum IP_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 16
        }

        public enum IP_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_IPR0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IP_3: UInt32 {
                @inlinable @inline(__always) get {
                    IP_3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IP_3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IP_2: UInt32 {
                @inlinable @inline(__always) get {
                  IP_2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_1: UInt32 {
                @inlinable @inline(__always) get {
                  IP_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_0: UInt32 {
                @inlinable @inline(__always) get {
                  IP_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_IPR0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IP_3: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IP_3_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.IP_3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IP_3_Field.self, BitField2.self)
                    self.raw.IP_3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IP_2: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_2_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_2_Field.self, BitField2.self)
                  self.raw.IP_2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_1: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_1_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_1_Field.self, BitField2.self)
                  self.raw.IP_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_0: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_0_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_0_Field.self, BitField2.self)
                  self.raw.IP_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    public var NVIC_IPR1: Register<NVIC_IPR1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe404), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe404))
          #endif
        }
    }
    public struct NVIC_IPR1_Descriptor {
        @available(*, unavailable)
        /// Priority of interrupt 7
        public var IP_7: IP_7_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 6
        public var IP_6: IP_6_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 5
        public var IP_5: IP_5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 4
        public var IP_4: IP_4_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IP_7_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 32
        }

        public enum IP_6_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 24
        }

        public enum IP_5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 16
        }

        public enum IP_4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_IPR1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IP_7: UInt32 {
                @inlinable @inline(__always) get {
                    IP_7_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IP_7_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IP_6: UInt32 {
                @inlinable @inline(__always) get {
                  IP_6_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_6_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_5: UInt32 {
                @inlinable @inline(__always) get {
                  IP_5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_4: UInt32 {
                @inlinable @inline(__always) get {
                  IP_4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_4_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_IPR1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IP_7: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IP_7_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.IP_7)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IP_7_Field.self, BitField2.self)
                    self.raw.IP_7 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IP_6: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_6_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_6)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_6_Field.self, BitField2.self)
                  self.raw.IP_6 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_5: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_5_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_5_Field.self, BitField2.self)
                  self.raw.IP_5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_4: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_4_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_4_Field.self, BitField2.self)
                  self.raw.IP_4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    public var NVIC_IPR2: Register<NVIC_IPR2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe408), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe408))
          #endif
        }
    }
    public struct NVIC_IPR2_Descriptor {
        @available(*, unavailable)
        /// Priority of interrupt 11
        public var IP_11: IP_11_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 10
        public var IP_10: IP_10_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 9
        public var IP_9: IP_9_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 8
        public var IP_8: IP_8_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IP_11_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 32
        }

        public enum IP_10_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 24
        }

        public enum IP_9_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 16
        }

        public enum IP_8_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_IPR2_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IP_11: UInt32 {
                @inlinable @inline(__always) get {
                    IP_11_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IP_11_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IP_10: UInt32 {
                @inlinable @inline(__always) get {
                  IP_10_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_10_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_9: UInt32 {
                @inlinable @inline(__always) get {
                  IP_9_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_9_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_8: UInt32 {
                @inlinable @inline(__always) get {
                  IP_8_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_8_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_IPR2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IP_11: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IP_11_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.IP_11)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IP_11_Field.self, BitField2.self)
                    self.raw.IP_11 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IP_10: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_10_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_10)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_10_Field.self, BitField2.self)
                  self.raw.IP_10 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_9: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_9_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_9)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_9_Field.self, BitField2.self)
                  self.raw.IP_9 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_8: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_8_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_8)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_8_Field.self, BitField2.self)
                  self.raw.IP_8 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    public var NVIC_IPR3: Register<NVIC_IPR3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe40c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe40c))
          #endif
        }
    }
    public struct NVIC_IPR3_Descriptor {
        @available(*, unavailable)
        /// Priority of interrupt 15
        public var IP_15: IP_15_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 14
        public var IP_14: IP_14_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 13
        public var IP_13: IP_13_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 12
        public var IP_12: IP_12_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IP_15_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 32
        }

        public enum IP_14_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 24
        }

        public enum IP_13_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 16
        }

        public enum IP_12_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_IPR3_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IP_15: UInt32 {
                @inlinable @inline(__always) get {
                    IP_15_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IP_15_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IP_14: UInt32 {
                @inlinable @inline(__always) get {
                  IP_14_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_14_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_13: UInt32 {
                @inlinable @inline(__always) get {
                  IP_13_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_13_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_12: UInt32 {
                @inlinable @inline(__always) get {
                  IP_12_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_12_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_IPR3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IP_15: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IP_15_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.IP_15)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IP_15_Field.self, BitField2.self)
                    self.raw.IP_15 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IP_14: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_14_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_14)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_14_Field.self, BitField2.self)
                  self.raw.IP_14 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_13: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_13_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_13)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_13_Field.self, BitField2.self)
                  self.raw.IP_13 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_12: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_12_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_12)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_12_Field.self, BitField2.self)
                  self.raw.IP_12 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    public var NVIC_IPR4: Register<NVIC_IPR4_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe410), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe410))
          #endif
        }
    }
    public struct NVIC_IPR4_Descriptor {
        @available(*, unavailable)
        /// Priority of interrupt 19
        public var IP_19: IP_19_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 18
        public var IP_18: IP_18_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 17
        public var IP_17: IP_17_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 16
        public var IP_16: IP_16_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IP_19_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 32
        }

        public enum IP_18_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 24
        }

        public enum IP_17_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 16
        }

        public enum IP_16_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_IPR4_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IP_19: UInt32 {
                @inlinable @inline(__always) get {
                    IP_19_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IP_19_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IP_18: UInt32 {
                @inlinable @inline(__always) get {
                  IP_18_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_18_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_17: UInt32 {
                @inlinable @inline(__always) get {
                  IP_17_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_17_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_16: UInt32 {
                @inlinable @inline(__always) get {
                  IP_16_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_16_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_IPR4_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IP_19: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IP_19_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.IP_19)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IP_19_Field.self, BitField2.self)
                    self.raw.IP_19 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IP_18: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_18_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_18)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_18_Field.self, BitField2.self)
                  self.raw.IP_18 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_17: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_17_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_17)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_17_Field.self, BitField2.self)
                  self.raw.IP_17 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_16: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_16_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_16)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_16_Field.self, BitField2.self)
                  self.raw.IP_16 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    public var NVIC_IPR5: Register<NVIC_IPR5_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe414), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe414))
          #endif
        }
    }
    public struct NVIC_IPR5_Descriptor {
        @available(*, unavailable)
        /// Priority of interrupt 23
        public var IP_23: IP_23_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 22
        public var IP_22: IP_22_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 21
        public var IP_21: IP_21_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 20
        public var IP_20: IP_20_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IP_23_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 32
        }

        public enum IP_22_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 24
        }

        public enum IP_21_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 16
        }

        public enum IP_20_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_IPR5_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IP_23: UInt32 {
                @inlinable @inline(__always) get {
                    IP_23_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IP_23_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IP_22: UInt32 {
                @inlinable @inline(__always) get {
                  IP_22_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_22_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_21: UInt32 {
                @inlinable @inline(__always) get {
                  IP_21_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_21_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_20: UInt32 {
                @inlinable @inline(__always) get {
                  IP_20_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_20_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_IPR5_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IP_23: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IP_23_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.IP_23)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IP_23_Field.self, BitField2.self)
                    self.raw.IP_23 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IP_22: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_22_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_22)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_22_Field.self, BitField2.self)
                  self.raw.IP_22 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_21: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_21_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_21)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_21_Field.self, BitField2.self)
                  self.raw.IP_21 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_20: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_20_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_20)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_20_Field.self, BitField2.self)
                  self.raw.IP_20 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    public var NVIC_IPR6: Register<NVIC_IPR6_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe418), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe418))
          #endif
        }
    }
    public struct NVIC_IPR6_Descriptor {
        @available(*, unavailable)
        /// Priority of interrupt 27
        public var IP_27: IP_27_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 26
        public var IP_26: IP_26_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 25
        public var IP_25: IP_25_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 24
        public var IP_24: IP_24_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IP_27_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 32
        }

        public enum IP_26_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 24
        }

        public enum IP_25_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 16
        }

        public enum IP_24_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_IPR6_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IP_27: UInt32 {
                @inlinable @inline(__always) get {
                    IP_27_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IP_27_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IP_26: UInt32 {
                @inlinable @inline(__always) get {
                  IP_26_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_26_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_25: UInt32 {
                @inlinable @inline(__always) get {
                  IP_25_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_25_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_24: UInt32 {
                @inlinable @inline(__always) get {
                  IP_24_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_24_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_IPR6_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IP_27: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IP_27_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.IP_27)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IP_27_Field.self, BitField2.self)
                    self.raw.IP_27 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IP_26: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_26_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_26)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_26_Field.self, BitField2.self)
                  self.raw.IP_26 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_25: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_25_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_25)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_25_Field.self, BitField2.self)
                  self.raw.IP_25 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_24: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_24_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_24)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_24_Field.self, BitField2.self)
                  self.raw.IP_24 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    public var NVIC_IPR7: Register<NVIC_IPR7_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xe41c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xe41c))
          #endif
        }
    }
    public struct NVIC_IPR7_Descriptor {
        @available(*, unavailable)
        /// Priority of interrupt 31
        public var IP_31: IP_31_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 30
        public var IP_30: IP_30_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 29
        public var IP_29: IP_29_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of interrupt 28
        public var IP_28: IP_28_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IP_31_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 32
        }

        public enum IP_30_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 24
        }

        public enum IP_29_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 16
        }

        public enum IP_28_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NVIC_IPR7_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IP_31: UInt32 {
                @inlinable @inline(__always) get {
                    IP_31_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IP_31_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IP_30: UInt32 {
                @inlinable @inline(__always) get {
                  IP_30_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_30_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_29: UInt32 {
                @inlinable @inline(__always) get {
                  IP_29_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_29_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IP_28: UInt32 {
                @inlinable @inline(__always) get {
                  IP_28_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IP_28_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NVIC_IPR7_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IP_31: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IP_31_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.IP_31)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IP_31_Field.self, BitField2.self)
                    self.raw.IP_31 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IP_30: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_30_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_30)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_30_Field.self, BitField2.self)
                  self.raw.IP_30 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_29: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_29_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_29)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_29_Field.self, BitField2.self)
                  self.raw.IP_29 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IP_28: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IP_28_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.IP_28)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IP_28_Field.self, BitField2.self)
                  self.raw.IP_28 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Read the CPU ID Base Register to determine: the ID number of the processor core, the version number of the processor core, the implementation details of the processor core.
    public var CPUID: Register<CPUID_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed00), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed00))
          #endif
        }
    }
    public struct CPUID_Descriptor {
        @available(*, unavailable)
        /// Implementor code: 0x41 = ARM
        public var IMPLEMENTER: IMPLEMENTER_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Major revision number n in the rnpm revision status:
        /// 0x0 = Revision 0.
        public var VARIANT: VARIANT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Constant that defines the architecture of the processor:
        /// 0xC = ARMv6-M architecture.
        public var ARCHITECTURE: ARCHITECTURE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Number of processor within family: 0xC60 = Cortex-M0+
        public var PARTNO: PARTNO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Minor revision number m in the rnpm revision status:
        /// 0x1 = Patch 1.
        public var REVISION: REVISION_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IMPLEMENTER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 32
        }

        public enum VARIANT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 24
        }

        public enum ARCHITECTURE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum PARTNO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 16
        }

        public enum REVISION_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CPUID_Descriptor

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
                public var IMPLEMENTER: UInt32 {
                @inlinable @inline(__always) get {
                    IMPLEMENTER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IMPLEMENTER_Field.insert(newValue, into: &self.storage)
                }
                }
              public var VARIANT: UInt32 {
                @inlinable @inline(__always) get {
                  VARIANT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VARIANT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ARCHITECTURE: UInt32 {
                @inlinable @inline(__always) get {
                  ARCHITECTURE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ARCHITECTURE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PARTNO: UInt32 {
                @inlinable @inline(__always) get {
                  PARTNO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PARTNO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var REVISION: UInt32 {
                @inlinable @inline(__always) get {
                  REVISION_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  REVISION_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = CPUID_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IMPLEMENTER: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IMPLEMENTER_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.IMPLEMENTER)
                }
                }
              public var VARIANT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VARIANT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.VARIANT)
                }
              }
              public var ARCHITECTURE: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ARCHITECTURE_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ARCHITECTURE)
                }
              }
              public var PARTNO: BitField12 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PARTNO_Field.self, BitField12.self)
                  return BitField12(storage: self.raw.PARTNO)
                }
              }
              public var REVISION: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(REVISION_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.REVISION)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = CPUID_Descriptor
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

    /// Use the Interrupt Control State Register to set a pending Non-Maskable Interrupt (NMI), set or clear a pending PendSV, set or clear a pending SysTick, check for pending exceptions, check the vector number of the highest priority pended exception, check the vector number of the active exception.
    public var ICSR: Register<ICSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed04), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed04))
          #endif
        }
    }
    public struct ICSR_Descriptor {
        @available(*, unavailable)
        /// Setting this bit will activate an NMI. Since NMI is the highest priority exception, it will activate as soon as it is registered.
        /// NMI set-pending bit.
        /// Write:
        /// 0 = No effect.
        /// 1 = Changes NMI exception state to pending.
        /// Read:
        /// 0 = NMI exception is not pending.
        /// 1 = NMI exception is pending.
        /// Because NMI is the highest-priority exception, normally the processor enters the NMI
        /// exception handler as soon as it detects a write of 1 to this bit. Entering the handler then clears
        /// this bit to 0. This means a read of this bit by the NMI exception handler returns 1 only if the
        /// NMI signal is reasserted while the processor is executing that handler.
        public var NMIPENDSET: NMIPENDSET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// PendSV set-pending bit.
        /// Write:
        /// 0 = No effect.
        /// 1 = Changes PendSV exception state to pending.
        /// Read:
        /// 0 = PendSV exception is not pending.
        /// 1 = PendSV exception is pending.
        /// Writing 1 to this bit is the only way to set the PendSV exception state to pending.
        public var PENDSVSET: PENDSVSET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// PendSV clear-pending bit.
        /// Write:
        /// 0 = No effect.
        /// 1 = Removes the pending state from the PendSV exception.
        public var PENDSVCLR: PENDSVCLR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// SysTick exception set-pending bit.
        /// Write:
        /// 0 = No effect.
        /// 1 = Changes SysTick exception state to pending.
        /// Read:
        /// 0 = SysTick exception is not pending.
        /// 1 = SysTick exception is pending.
        public var PENDSTSET: PENDSTSET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// SysTick exception clear-pending bit.
        /// Write:
        /// 0 = No effect.
        /// 1 = Removes the pending state from the SysTick exception.
        /// This bit is WO. On a register read its value is Unknown.
        public var PENDSTCLR: PENDSTCLR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The system can only access this bit when the core is halted. It indicates that a pending interrupt is to be taken in the next running cycle. If C_MASKINTS is clear in the Debug Halting Control and Status Register, the interrupt is serviced.
        public var ISRPREEMPT: ISRPREEMPT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// External interrupt pending flag
        public var ISRPENDING: ISRPENDING_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indicates the exception number for the highest priority pending exception: 0 = no pending exceptions. Non zero = The pending state includes the effect of memory-mapped enable and mask registers. It does not include the PRIMASK special-purpose register qualifier.
        public var VECTPENDING: VECTPENDING_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Active exception number field. Reset clears the VECTACTIVE field.
        public var VECTACTIVE: VECTACTIVE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NMIPENDSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum PENDSVSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum PENDSVCLR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum PENDSTSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum PENDSTCLR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ISRPREEMPT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum ISRPENDING_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum VECTPENDING_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 21
        }

        public enum VECTACTIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ICSR_Descriptor

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
                public var NMIPENDSET: UInt32 {
                @inlinable @inline(__always) get {
                    NMIPENDSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NMIPENDSET_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PENDSVSET: UInt32 {
                @inlinable @inline(__always) get {
                  PENDSVSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PENDSVSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PENDSVCLR: UInt32 {
                @inlinable @inline(__always) get {
                  PENDSVCLR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PENDSVCLR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PENDSTSET: UInt32 {
                @inlinable @inline(__always) get {
                  PENDSTSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PENDSTSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PENDSTCLR: UInt32 {
                @inlinable @inline(__always) get {
                  PENDSTCLR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PENDSTCLR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ISRPREEMPT: UInt32 {
                @inlinable @inline(__always) get {
                  ISRPREEMPT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ISRPREEMPT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ISRPENDING: UInt32 {
                @inlinable @inline(__always) get {
                  ISRPENDING_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ISRPENDING_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VECTPENDING: UInt32 {
                @inlinable @inline(__always) get {
                  VECTPENDING_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VECTPENDING_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VECTACTIVE: UInt32 {
                @inlinable @inline(__always) get {
                  VECTACTIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VECTACTIVE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = ICSR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var NMIPENDSET: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NMIPENDSET_Field.self, Bool.self)
                    return Bool(storage: self.raw.NMIPENDSET)
                }
                }
              public var PENDSVSET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PENDSVSET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PENDSVSET)
                }
              }
              public var PENDSVCLR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PENDSVCLR_Field.self, Bool.self)
                  return Bool(storage: self.raw.PENDSVCLR)
                }
              }
              public var PENDSTSET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PENDSTSET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PENDSTSET)
                }
              }
              public var PENDSTCLR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PENDSTCLR_Field.self, Bool.self)
                  return Bool(storage: self.raw.PENDSTCLR)
                }
              }
              public var ISRPREEMPT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ISRPREEMPT_Field.self, Bool.self)
                  return Bool(storage: self.raw.ISRPREEMPT)
                }
              }
              public var ISRPENDING: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ISRPENDING_Field.self, Bool.self)
                  return Bool(storage: self.raw.ISRPENDING)
                }
              }
              public var VECTPENDING: BitField9 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VECTPENDING_Field.self, BitField9.self)
                  return BitField9(storage: self.raw.VECTPENDING)
                }
              }
              public var VECTACTIVE: BitField9 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VECTACTIVE_Field.self, BitField9.self)
                  return BitField9(storage: self.raw.VECTACTIVE)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = ICSR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var NMIPENDSET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NMIPENDSET_Field.self, Bool.self)
                    return Bool(storage: self.raw.NMIPENDSET)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(NMIPENDSET_Field.self, Bool.self)
                    self.raw.NMIPENDSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PENDSVSET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PENDSVSET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PENDSVSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PENDSVSET_Field.self, Bool.self)
                  self.raw.PENDSVSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PENDSVCLR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PENDSVCLR_Field.self, Bool.self)
                  return Bool(storage: self.raw.PENDSVCLR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PENDSVCLR_Field.self, Bool.self)
                  self.raw.PENDSVCLR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PENDSTSET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PENDSTSET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PENDSTSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PENDSTSET_Field.self, Bool.self)
                  self.raw.PENDSTSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PENDSTCLR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PENDSTCLR_Field.self, Bool.self)
                  return Bool(storage: self.raw.PENDSTCLR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PENDSTCLR_Field.self, Bool.self)
                  self.raw.PENDSTCLR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// The VTOR holds the vector table offset address.
    public var VTOR: Register<VTOR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed08), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed08))
          #endif
        }
    }
    public struct VTOR_Descriptor {
        @available(*, unavailable)
        /// Bits [31:8] of the indicate the vector table offset address.
        public var TBLOFF: TBLOFF_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TBLOFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = VTOR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TBLOFF: UInt32 {
                @inlinable @inline(__always) get {
                    TBLOFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TBLOFF_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = VTOR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TBLOFF: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TBLOFF_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.TBLOFF)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TBLOFF_Field.self, BitField24.self)
                    self.raw.TBLOFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Use the Application Interrupt and Reset Control Register to: determine data endianness, clear all active state information from debug halt mode, request a system reset.
    public var AIRCR: Register<AIRCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed0c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed0c))
          #endif
        }
    }
    public struct AIRCR_Descriptor {
        @available(*, unavailable)
        /// Register key:
        /// Reads as Unknown
        /// On writes, write 0x05FA to VECTKEY, otherwise the write is ignored.
        public var VECTKEY: VECTKEY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Data endianness implemented:
        /// 0 = Little-endian.
        public var ENDIANESS: ENDIANESS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Writing 1 to this bit causes the SYSRESETREQ signal to the outer system to be asserted to request a reset. The intention is to force a large system reset of all major components except for debug. The C_HALT bit in the DHCSR is cleared as a result of the system reset requested. The debugger does not lose contact with the device.
        public var SYSRESETREQ: SYSRESETREQ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Clears all active state information for fixed and configurable exceptions. This bit: is self-clearing, can only be set by the DAP when the core is halted.  When set: clears all active exception status of the processor, forces a return to Thread mode, forces an IPSR of 0. A debugger must re-initialize the stack.
        public var VECTCLRACTIVE: VECTCLRACTIVE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum VECTKEY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum ENDIANESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum SYSRESETREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum VECTCLRACTIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = AIRCR_Descriptor

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
                public var VECTKEY: UInt32 {
                @inlinable @inline(__always) get {
                    VECTKEY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    VECTKEY_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ENDIANESS: UInt32 {
                @inlinable @inline(__always) get {
                  ENDIANESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDIANESS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SYSRESETREQ: UInt32 {
                @inlinable @inline(__always) get {
                  SYSRESETREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SYSRESETREQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VECTCLRACTIVE: UInt32 {
                @inlinable @inline(__always) get {
                  VECTCLRACTIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VECTCLRACTIVE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = AIRCR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var VECTKEY: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(VECTKEY_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.VECTKEY)
                }
                }
              public var ENDIANESS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDIANESS_Field.self, Bool.self)
                  return Bool(storage: self.raw.ENDIANESS)
                }
              }
              public var SYSRESETREQ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SYSRESETREQ_Field.self, Bool.self)
                  return Bool(storage: self.raw.SYSRESETREQ)
                }
              }
              public var VECTCLRACTIVE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VECTCLRACTIVE_Field.self, Bool.self)
                  return Bool(storage: self.raw.VECTCLRACTIVE)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = AIRCR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var VECTKEY: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(VECTKEY_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.VECTKEY)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(VECTKEY_Field.self, BitField16.self)
                    self.raw.VECTKEY = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SYSRESETREQ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SYSRESETREQ_Field.self, Bool.self)
                  return Bool(storage: self.raw.SYSRESETREQ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SYSRESETREQ_Field.self, Bool.self)
                  self.raw.SYSRESETREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var VECTCLRACTIVE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VECTCLRACTIVE_Field.self, Bool.self)
                  return Bool(storage: self.raw.VECTCLRACTIVE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(VECTCLRACTIVE_Field.self, Bool.self)
                  self.raw.VECTCLRACTIVE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// System Control Register. Use the System Control Register for power-management functions: signal to the system when the processor can enter a low power state, control how the processor enters and exits low power states.
    public var SCR: Register<SCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed10), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed10))
          #endif
        }
    }
    public struct SCR_Descriptor {
        @available(*, unavailable)
        /// Send Event on Pending bit:
        /// 0 = Only enabled interrupts or events can wakeup the processor, disabled interrupts are excluded.
        /// 1 = Enabled events and all interrupts, including disabled interrupts, can wakeup the processor.
        /// When an event or interrupt becomes pending, the event signal wakes up the processor from WFE. If the
        /// processor is not waiting for an event, the event is registered and affects the next WFE.
        /// The processor also wakes up on execution of an SEV instruction or an external event.
        public var SEVONPEND: SEVONPEND_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Controls whether the processor uses sleep or deep sleep as its low power mode:
        /// 0 = Sleep.
        /// 1 = Deep sleep.
        public var SLEEPDEEP: SLEEPDEEP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indicates sleep-on-exit when returning from Handler mode to Thread mode:
        /// 0 = Do not sleep when returning to Thread mode.
        /// 1 = Enter sleep, or deep sleep, on return from an ISR to Thread mode.
        /// Setting this bit to 1 enables an interrupt driven application to avoid returning to an empty main application.
        public var SLEEPONEXIT: SLEEPONEXIT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SEVONPEND_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum SLEEPDEEP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SLEEPONEXIT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SCR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SEVONPEND: UInt32 {
                @inlinable @inline(__always) get {
                    SEVONPEND_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SEVONPEND_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SLEEPDEEP: UInt32 {
                @inlinable @inline(__always) get {
                  SLEEPDEEP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLEEPDEEP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SLEEPONEXIT: UInt32 {
                @inlinable @inline(__always) get {
                  SLEEPONEXIT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLEEPONEXIT_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SEVONPEND: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SEVONPEND_Field.self, Bool.self)
                    return Bool(storage: self.raw.SEVONPEND)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SEVONPEND_Field.self, Bool.self)
                    self.raw.SEVONPEND = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SLEEPDEEP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLEEPDEEP_Field.self, Bool.self)
                  return Bool(storage: self.raw.SLEEPDEEP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SLEEPDEEP_Field.self, Bool.self)
                  self.raw.SLEEPDEEP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SLEEPONEXIT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLEEPONEXIT_Field.self, Bool.self)
                  return Bool(storage: self.raw.SLEEPONEXIT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SLEEPONEXIT_Field.self, Bool.self)
                  self.raw.SLEEPONEXIT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// The Configuration and Control Register permanently enables stack alignment and causes unaligned accesses to result in a Hard Fault.
    public var CCR: Register<CCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed14), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed14))
          #endif
        }
    }
    public struct CCR_Descriptor {
        @available(*, unavailable)
        /// Always reads as one, indicates 8-byte stack alignment on exception entry. On exception entry, the processor uses bit[9] of the stacked PSR to indicate the stack alignment. On return from the exception it uses this stacked bit to restore the correct stack alignment.
        public var STKALIGN: STKALIGN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Always reads as one, indicates that all unaligned accesses generate a HardFault.
        public var UNALIGN_TRP: UNALIGN_TRP_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum STKALIGN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum UNALIGN_TRP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CCR_Descriptor

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
                public var STKALIGN: UInt32 {
                @inlinable @inline(__always) get {
                    STKALIGN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    STKALIGN_Field.insert(newValue, into: &self.storage)
                }
                }
              public var UNALIGN_TRP: UInt32 {
                @inlinable @inline(__always) get {
                  UNALIGN_TRP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  UNALIGN_TRP_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = CCR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var STKALIGN: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(STKALIGN_Field.self, Bool.self)
                    return Bool(storage: self.raw.STKALIGN)
                }
                }
              public var UNALIGN_TRP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(UNALIGN_TRP_Field.self, Bool.self)
                  return Bool(storage: self.raw.UNALIGN_TRP)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = CCR_Descriptor
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

    /// System handlers are a special class of exception handler that can have their priority set to any of the priority levels. Use the System Handler Priority Register 2 to set the priority of SVCall.
    public var SHPR2: Register<SHPR2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed1c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed1c))
          #endif
        }
    }
    public struct SHPR2_Descriptor {
        @available(*, unavailable)
        /// Priority of system handler 11, SVCall
        public var PRI_11: PRI_11_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PRI_11_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SHPR2_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PRI_11: UInt32 {
                @inlinable @inline(__always) get {
                    PRI_11_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PRI_11_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SHPR2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PRI_11: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PRI_11_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.PRI_11)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PRI_11_Field.self, BitField2.self)
                    self.raw.PRI_11 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// System handlers are a special class of exception handler that can have their priority set to any of the priority levels. Use the System Handler Priority Register 3 to set the priority of PendSV and SysTick.
    public var SHPR3: Register<SHPR3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed20), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed20))
          #endif
        }
    }
    public struct SHPR3_Descriptor {
        @available(*, unavailable)
        /// Priority of system handler 15, SysTick
        public var PRI_15: PRI_15_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Priority of system handler 14, PendSV
        public var PRI_14: PRI_14_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PRI_15_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 32
        }

        public enum PRI_14_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SHPR3_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PRI_15: UInt32 {
                @inlinable @inline(__always) get {
                    PRI_15_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PRI_15_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PRI_14: UInt32 {
                @inlinable @inline(__always) get {
                  PRI_14_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PRI_14_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SHPR3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PRI_15: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PRI_15_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.PRI_15)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PRI_15_Field.self, BitField2.self)
                    self.raw.PRI_15 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PRI_14: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PRI_14_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.PRI_14)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PRI_14_Field.self, BitField2.self)
                  self.raw.PRI_14 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Use the System Handler Control and State Register to determine or clear the pending status of SVCall.
    public var SHCSR: Register<SHCSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed24), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed24))
          #endif
        }
    }
    public struct SHCSR_Descriptor {
        @available(*, unavailable)
        /// Reads as 1 if SVCall is Pending.  Write 1 to set pending SVCall, write 0 to clear pending SVCall.
        public var SVCALLPENDED: SVCALLPENDED_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SVCALLPENDED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SHCSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SVCALLPENDED: UInt32 {
                @inlinable @inline(__always) get {
                    SVCALLPENDED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SVCALLPENDED_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SHCSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SVCALLPENDED: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SVCALLPENDED_Field.self, Bool.self)
                    return Bool(storage: self.raw.SVCALLPENDED)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SVCALLPENDED_Field.self, Bool.self)
                    self.raw.SVCALLPENDED = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read the MPU Type Register to determine if the processor implements an MPU, and how many regions the MPU supports.
    public var MPU_TYPE: Register<MPU_TYPE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed90), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed90))
          #endif
        }
    }
    public struct MPU_TYPE_Descriptor {
        @available(*, unavailable)
        /// Instruction region. Reads as zero as ARMv6-M only supports a unified MPU.
        public var IREGION: IREGION_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Number of regions supported by the MPU.
        public var DREGION: DREGION_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indicates support for separate instruction and data address maps. Reads as 0 as ARMv6-M only supports a unified MPU.
        public var SEPARATE: SEPARATE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IREGION_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 24
        }

        public enum DREGION_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 16
        }

        public enum SEPARATE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = MPU_TYPE_Descriptor

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
                public var IREGION: UInt32 {
                @inlinable @inline(__always) get {
                    IREGION_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IREGION_Field.insert(newValue, into: &self.storage)
                }
                }
              public var DREGION: UInt32 {
                @inlinable @inline(__always) get {
                  DREGION_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DREGION_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SEPARATE: UInt32 {
                @inlinable @inline(__always) get {
                  SEPARATE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SEPARATE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = MPU_TYPE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IREGION: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IREGION_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.IREGION)
                }
                }
              public var DREGION: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DREGION_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.DREGION)
                }
              }
              public var SEPARATE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SEPARATE_Field.self, Bool.self)
                  return Bool(storage: self.raw.SEPARATE)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = MPU_TYPE_Descriptor
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

    /// Use the MPU Control Register to enable and disable the MPU, and to control whether the default memory map is enabled as a background region for privileged accesses, and whether the MPU is enabled for HardFaults and NMIs.
    public var MPU_CTRL: Register<MPU_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed94), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed94))
          #endif
        }
    }
    public struct MPU_CTRL_Descriptor {
        @available(*, unavailable)
        /// Controls whether the default memory map is enabled as a background region for privileged accesses. This bit is ignored when ENABLE is clear.
        /// 0 = If the MPU is enabled, disables use of the default memory map. Any memory access to a location not
        /// covered by any enabled region causes a fault.
        /// 1 = If the MPU is enabled, enables use of the default memory map as a background region for privileged software accesses.
        /// When enabled, the background region acts as if it is region number -1. Any region that is defined and enabled has priority over this default map.
        public var PRIVDEFENA: PRIVDEFENA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Controls the use of the MPU for HardFaults and NMIs. Setting this bit when ENABLE is clear results in UNPREDICTABLE behaviour.
        /// When the MPU is enabled:
        /// 0 = MPU is disabled during HardFault and NMI handlers, regardless of the value of the ENABLE bit.
        /// 1 = the MPU is enabled during HardFault and NMI handlers.
        public var HFNMIENA: HFNMIENA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enables the MPU. If the MPU is disabled, privileged and unprivileged accesses use the default memory map.
        /// 0 = MPU disabled.
        /// 1 = MPU enabled.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PRIVDEFENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum HFNMIENA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = MPU_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PRIVDEFENA: UInt32 {
                @inlinable @inline(__always) get {
                    PRIVDEFENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PRIVDEFENA_Field.insert(newValue, into: &self.storage)
                }
                }
              public var HFNMIENA: UInt32 {
                @inlinable @inline(__always) get {
                  HFNMIENA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HFNMIENA_Field.insert(newValue, into: &self.storage)
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
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = MPU_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PRIVDEFENA: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PRIVDEFENA_Field.self, Bool.self)
                    return Bool(storage: self.raw.PRIVDEFENA)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PRIVDEFENA_Field.self, Bool.self)
                    self.raw.PRIVDEFENA = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var HFNMIENA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HFNMIENA_Field.self, Bool.self)
                  return Bool(storage: self.raw.HFNMIENA)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HFNMIENA_Field.self, Bool.self)
                  self.raw.HFNMIENA = newValue.storage(Self.Value.Raw.Storage.self)
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
        }
    }

    /// Use the MPU Region Number Register to select the region currently accessed by MPU_RBAR and MPU_RASR.
    public var MPU_RNR: Register<MPU_RNR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed98), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed98))
          #endif
        }
    }
    public struct MPU_RNR_Descriptor {
        @available(*, unavailable)
        /// Indicates the MPU region referenced by the MPU_RBAR and MPU_RASR registers.
        /// The MPU supports 8 memory regions, so the permitted values of this field are 0-7.
        public var REGION: REGION_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum REGION_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = MPU_RNR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var REGION: UInt32 {
                @inlinable @inline(__always) get {
                    REGION_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    REGION_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = MPU_RNR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var REGION: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(REGION_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.REGION)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(REGION_Field.self, BitField4.self)
                    self.raw.REGION = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read the MPU Region Base Address Register to determine the base address of the region identified by MPU_RNR. Write to update the base address of said region or that of a specified region, with whose number MPU_RNR will also be updated.
    public var MPU_RBAR: Register<MPU_RBAR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xed9c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xed9c))
          #endif
        }
    }
    public struct MPU_RBAR_Descriptor {
        @available(*, unavailable)
        /// Base address of the region.
        public var ADDR: ADDR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// On writes, indicates whether the write must update the base address of the region identified by the REGION field, updating the MPU_RNR to indicate this new region.
        /// Write:
        /// 0 = MPU_RNR not changed, and the processor:
        /// Updates the base address for the region specified in the MPU_RNR.
        /// Ignores the value of the REGION field.
        /// 1 = The processor:
        /// Updates the value of the MPU_RNR to the value of the REGION field.
        /// Updates the base address for the region specified in the REGION field.
        /// Always reads as zero.
        public var VALID: VALID_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// On writes, specifies the number of the region whose base address to update provided VALID is set written as 1. On reads, returns bits [3:0] of MPU_RNR.
        public var REGION: REGION_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ADDR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 32
        }

        public enum VALID_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum REGION_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = MPU_RBAR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var ADDR: UInt32 {
                @inlinable @inline(__always) get {
                    ADDR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ADDR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var VALID: UInt32 {
                @inlinable @inline(__always) get {
                  VALID_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VALID_Field.insert(newValue, into: &self.storage)
                }
              }
              public var REGION: UInt32 {
                @inlinable @inline(__always) get {
                  REGION_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  REGION_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = MPU_RBAR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var ADDR: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ADDR_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.ADDR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ADDR_Field.self, BitField24.self)
                    self.raw.ADDR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var VALID: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VALID_Field.self, Bool.self)
                  return Bool(storage: self.raw.VALID)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(VALID_Field.self, Bool.self)
                  self.raw.VALID = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var REGION: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(REGION_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.REGION)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(REGION_Field.self, BitField4.self)
                  self.raw.REGION = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Use the MPU Region Attribute and Size Register to define the size, access behaviour and memory type of the region identified by MPU_RNR, and enable that region.
    public var MPU_RASR: Register<MPU_RASR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0xeda0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0xeda0))
          #endif
        }
    }
    public struct MPU_RASR_Descriptor {
        @available(*, unavailable)
        /// The MPU Region Attribute field. Use to define the region attribute control.
        /// 28 = XN: Instruction access disable bit:
        /// 0 = Instruction fetches enabled.
        /// 1 = Instruction fetches disabled.
        /// 26:24 = AP: Access permission field
        /// 18 = S: Shareable bit
        /// 17 = C: Cacheable bit
        /// 16 = B: Bufferable bit
        public var ATTRS: ATTRS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Subregion Disable. For regions of 256 bytes or larger, each bit of this field controls whether one of the eight equal subregions is enabled.
        public var SRD: SRD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indicates the region size. Region size in bytes = 2^(SIZE+1). The minimum permitted value is 7 (b00111) = 256Bytes
        public var SIZE: SIZE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enables the region.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ATTRS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum SRD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 16
        }

        public enum SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 6
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = MPU_RASR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var ATTRS: UInt32 {
                @inlinable @inline(__always) get {
                    ATTRS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ATTRS_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SRD: UInt32 {
                @inlinable @inline(__always) get {
                  SRD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SRD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIZE_Field.insert(newValue, into: &self.storage)
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
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = MPU_RASR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var ATTRS: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ATTRS_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.ATTRS)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ATTRS_Field.self, BitField16.self)
                    self.raw.ATTRS = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SRD: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SRD_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.SRD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SRD_Field.self, BitField8.self)
                  self.raw.SRD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIZE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIZE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIZE_Field.self, BitField5.self)
                  self.raw.SIZE = newValue.storage(Self.Value.Raw.Storage.self)
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

extension PPB.SYST_CSR_Descriptor: RegisterValue {
}

extension PPB.SYST_RVR_Descriptor: RegisterValue {
}

extension PPB.SYST_CVR_Descriptor: RegisterValue {
}

extension PPB.SYST_CALIB_Descriptor: RegisterValue {
}

extension PPB.NVIC_ISER_Descriptor: RegisterValue {
}

extension PPB.NVIC_ICER_Descriptor: RegisterValue {
}

extension PPB.NVIC_ISPR_Descriptor: RegisterValue {
}

extension PPB.NVIC_ICPR_Descriptor: RegisterValue {
}

extension PPB.NVIC_IPR0_Descriptor: RegisterValue {
}

extension PPB.NVIC_IPR1_Descriptor: RegisterValue {
}

extension PPB.NVIC_IPR2_Descriptor: RegisterValue {
}

extension PPB.NVIC_IPR3_Descriptor: RegisterValue {
}

extension PPB.NVIC_IPR4_Descriptor: RegisterValue {
}

extension PPB.NVIC_IPR5_Descriptor: RegisterValue {
}

extension PPB.NVIC_IPR6_Descriptor: RegisterValue {
}

extension PPB.NVIC_IPR7_Descriptor: RegisterValue {
}

extension PPB.CPUID_Descriptor: RegisterValue {
}

extension PPB.ICSR_Descriptor: RegisterValue {
}

extension PPB.VTOR_Descriptor: RegisterValue {
}

extension PPB.AIRCR_Descriptor: RegisterValue {
}

extension PPB.SCR_Descriptor: RegisterValue {
}

extension PPB.CCR_Descriptor: RegisterValue {
}

extension PPB.SHPR2_Descriptor: RegisterValue {
}

extension PPB.SHPR3_Descriptor: RegisterValue {
}

extension PPB.SHCSR_Descriptor: RegisterValue {
}

extension PPB.MPU_TYPE_Descriptor: RegisterValue {
}

extension PPB.MPU_CTRL_Descriptor: RegisterValue {
}

extension PPB.MPU_RNR_Descriptor: RegisterValue {
}

extension PPB.MPU_RBAR_Descriptor: RegisterValue {
}

extension PPB.MPU_RASR_Descriptor: RegisterValue {
}
