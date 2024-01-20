import MMIO
import MMIOExtensions
public struct CLOCKS {

    public static var `default`: Self { .init(unsafeAddress: 0x40008000) }

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    public var CLK_GPOUT0_CTRL: Register<CLK_GPOUT0_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CLK_GPOUT0_CTRL_Descriptor {
        @available(*, unavailable)
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        public var NUDGE: NUDGE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        public var PHASE: PHASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enables duty cycle correction for odd divisors
        public var DC50: DC50_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Starts and stops the clock generator cleanly
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Asynchronously kills the clock generator
        public var KILL: KILL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Selects the auxiliary clock source, will glitch when switching
        public var AUXSRC: AUXSRC_Field {
            get {
                fatalError()
            }
        }

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_sys = 0
            case AUXSRC_clksrc_gpin0 = 1
            case AUXSRC_clksrc_gpin1 = 2
            case AUXSRC_clksrc_pll_usb = 3
            case AUXSRC_rosc_clksrc = 4
            case AUXSRC_xosc_clksrc = 5
            case AUXSRC_clk_sys = 6
            case AUXSRC_clk_usb = 7
            case AUXSRC_clk_adc = 8
            case AUXSRC_clk_rtc = 9
            case AUXSRC_clk_ref = 10

            public static var bitWidth: Int { 4 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NUDGE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum PHASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum DC50_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum KILL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum AUXSRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT0_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var NUDGE: UInt32 {
                @inlinable @inline(__always) get {
                    NUDGE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NUDGE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PHASE: UInt32 {
                @inlinable @inline(__always) get {
                  PHASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PHASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DC50: UInt32 {
                @inlinable @inline(__always) get {
                  DC50_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DC50_Field.insert(newValue, into: &self.storage)
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
              public var KILL: UInt32 {
                @inlinable @inline(__always) get {
                  KILL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  KILL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUXSRC: UInt32 {
                @inlinable @inline(__always) get {
                  AUXSRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUXSRC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_GPOUT0_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var NUDGE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    return Bool(storage: self.raw.NUDGE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    self.raw.NUDGE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PHASE: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.PHASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  self.raw.PHASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DC50: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DC50_Field.self, Bool.self)
                  return Bool(storage: self.raw.DC50)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DC50_Field.self, Bool.self)
                  self.raw.DC50 = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var KILL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  return Bool(storage: self.raw.KILL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  self.raw.KILL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUXSRC: AUXSRC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  return AUXSRC_Values(storage: self.raw.AUXSRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  self.raw.AUXSRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    public var CLK_GPOUT0_DIV: Register<CLK_GPOUT0_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct CLK_GPOUT0_DIV_Descriptor {
        @available(*, unavailable)
        /// Integer component of the divisor, 0 -> divide by 2^16
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional component of the divisor
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 32
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT0_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_GPOUT0_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    public var CLK_GPOUT0_SELECTED: Register<CLK_GPOUT0_SELECTED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct CLK_GPOUT0_SELECTED_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT0_SELECTED_Descriptor

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

                    public  typealias Value = CLK_GPOUT0_SELECTED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    public var CLK_GPOUT1_CTRL: Register<CLK_GPOUT1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct CLK_GPOUT1_CTRL_Descriptor {
        @available(*, unavailable)
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        public var NUDGE: NUDGE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        public var PHASE: PHASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enables duty cycle correction for odd divisors
        public var DC50: DC50_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Starts and stops the clock generator cleanly
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Asynchronously kills the clock generator
        public var KILL: KILL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Selects the auxiliary clock source, will glitch when switching
        public var AUXSRC: AUXSRC_Field {
            get {
                fatalError()
            }
        }

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_sys = 0
            case AUXSRC_clksrc_gpin0 = 1
            case AUXSRC_clksrc_gpin1 = 2
            case AUXSRC_clksrc_pll_usb = 3
            case AUXSRC_rosc_clksrc = 4
            case AUXSRC_xosc_clksrc = 5
            case AUXSRC_clk_sys = 6
            case AUXSRC_clk_usb = 7
            case AUXSRC_clk_adc = 8
            case AUXSRC_clk_rtc = 9
            case AUXSRC_clk_ref = 10

            public static var bitWidth: Int { 4 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NUDGE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum PHASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum DC50_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum KILL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum AUXSRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT1_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var NUDGE: UInt32 {
                @inlinable @inline(__always) get {
                    NUDGE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NUDGE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PHASE: UInt32 {
                @inlinable @inline(__always) get {
                  PHASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PHASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DC50: UInt32 {
                @inlinable @inline(__always) get {
                  DC50_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DC50_Field.insert(newValue, into: &self.storage)
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
              public var KILL: UInt32 {
                @inlinable @inline(__always) get {
                  KILL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  KILL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUXSRC: UInt32 {
                @inlinable @inline(__always) get {
                  AUXSRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUXSRC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_GPOUT1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var NUDGE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    return Bool(storage: self.raw.NUDGE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    self.raw.NUDGE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PHASE: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.PHASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  self.raw.PHASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DC50: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DC50_Field.self, Bool.self)
                  return Bool(storage: self.raw.DC50)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DC50_Field.self, Bool.self)
                  self.raw.DC50 = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var KILL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  return Bool(storage: self.raw.KILL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  self.raw.KILL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUXSRC: AUXSRC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  return AUXSRC_Values(storage: self.raw.AUXSRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  self.raw.AUXSRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    public var CLK_GPOUT1_DIV: Register<CLK_GPOUT1_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct CLK_GPOUT1_DIV_Descriptor {
        @available(*, unavailable)
        /// Integer component of the divisor, 0 -> divide by 2^16
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional component of the divisor
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 32
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT1_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_GPOUT1_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    public var CLK_GPOUT1_SELECTED: Register<CLK_GPOUT1_SELECTED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct CLK_GPOUT1_SELECTED_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT1_SELECTED_Descriptor

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

                    public  typealias Value = CLK_GPOUT1_SELECTED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    public var CLK_GPOUT2_CTRL: Register<CLK_GPOUT2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct CLK_GPOUT2_CTRL_Descriptor {
        @available(*, unavailable)
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        public var NUDGE: NUDGE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        public var PHASE: PHASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enables duty cycle correction for odd divisors
        public var DC50: DC50_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Starts and stops the clock generator cleanly
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Asynchronously kills the clock generator
        public var KILL: KILL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Selects the auxiliary clock source, will glitch when switching
        public var AUXSRC: AUXSRC_Field {
            get {
                fatalError()
            }
        }

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_sys = 0
            case AUXSRC_clksrc_gpin0 = 1
            case AUXSRC_clksrc_gpin1 = 2
            case AUXSRC_clksrc_pll_usb = 3
            case AUXSRC_rosc_clksrc_ph = 4
            case AUXSRC_xosc_clksrc = 5
            case AUXSRC_clk_sys = 6
            case AUXSRC_clk_usb = 7
            case AUXSRC_clk_adc = 8
            case AUXSRC_clk_rtc = 9
            case AUXSRC_clk_ref = 10

            public static var bitWidth: Int { 4 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NUDGE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum PHASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum DC50_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum KILL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum AUXSRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT2_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var NUDGE: UInt32 {
                @inlinable @inline(__always) get {
                    NUDGE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NUDGE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PHASE: UInt32 {
                @inlinable @inline(__always) get {
                  PHASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PHASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DC50: UInt32 {
                @inlinable @inline(__always) get {
                  DC50_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DC50_Field.insert(newValue, into: &self.storage)
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
              public var KILL: UInt32 {
                @inlinable @inline(__always) get {
                  KILL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  KILL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUXSRC: UInt32 {
                @inlinable @inline(__always) get {
                  AUXSRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUXSRC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_GPOUT2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var NUDGE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    return Bool(storage: self.raw.NUDGE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    self.raw.NUDGE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PHASE: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.PHASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  self.raw.PHASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DC50: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DC50_Field.self, Bool.self)
                  return Bool(storage: self.raw.DC50)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DC50_Field.self, Bool.self)
                  self.raw.DC50 = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var KILL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  return Bool(storage: self.raw.KILL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  self.raw.KILL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUXSRC: AUXSRC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  return AUXSRC_Values(storage: self.raw.AUXSRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  self.raw.AUXSRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    public var CLK_GPOUT2_DIV: Register<CLK_GPOUT2_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct CLK_GPOUT2_DIV_Descriptor {
        @available(*, unavailable)
        /// Integer component of the divisor, 0 -> divide by 2^16
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional component of the divisor
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 32
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT2_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_GPOUT2_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    public var CLK_GPOUT2_SELECTED: Register<CLK_GPOUT2_SELECTED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct CLK_GPOUT2_SELECTED_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT2_SELECTED_Descriptor

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

                    public  typealias Value = CLK_GPOUT2_SELECTED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    public var CLK_GPOUT3_CTRL: Register<CLK_GPOUT3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct CLK_GPOUT3_CTRL_Descriptor {
        @available(*, unavailable)
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        public var NUDGE: NUDGE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        public var PHASE: PHASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enables duty cycle correction for odd divisors
        public var DC50: DC50_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Starts and stops the clock generator cleanly
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Asynchronously kills the clock generator
        public var KILL: KILL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Selects the auxiliary clock source, will glitch when switching
        public var AUXSRC: AUXSRC_Field {
            get {
                fatalError()
            }
        }

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_sys = 0
            case AUXSRC_clksrc_gpin0 = 1
            case AUXSRC_clksrc_gpin1 = 2
            case AUXSRC_clksrc_pll_usb = 3
            case AUXSRC_rosc_clksrc_ph = 4
            case AUXSRC_xosc_clksrc = 5
            case AUXSRC_clk_sys = 6
            case AUXSRC_clk_usb = 7
            case AUXSRC_clk_adc = 8
            case AUXSRC_clk_rtc = 9
            case AUXSRC_clk_ref = 10

            public static var bitWidth: Int { 4 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NUDGE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum PHASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum DC50_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum KILL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum AUXSRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT3_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var NUDGE: UInt32 {
                @inlinable @inline(__always) get {
                    NUDGE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NUDGE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PHASE: UInt32 {
                @inlinable @inline(__always) get {
                  PHASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PHASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DC50: UInt32 {
                @inlinable @inline(__always) get {
                  DC50_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DC50_Field.insert(newValue, into: &self.storage)
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
              public var KILL: UInt32 {
                @inlinable @inline(__always) get {
                  KILL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  KILL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUXSRC: UInt32 {
                @inlinable @inline(__always) get {
                  AUXSRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUXSRC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_GPOUT3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var NUDGE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    return Bool(storage: self.raw.NUDGE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    self.raw.NUDGE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PHASE: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.PHASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  self.raw.PHASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DC50: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DC50_Field.self, Bool.self)
                  return Bool(storage: self.raw.DC50)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DC50_Field.self, Bool.self)
                  self.raw.DC50 = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var KILL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  return Bool(storage: self.raw.KILL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  self.raw.KILL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUXSRC: AUXSRC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  return AUXSRC_Values(storage: self.raw.AUXSRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  self.raw.AUXSRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    public var CLK_GPOUT3_DIV: Register<CLK_GPOUT3_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct CLK_GPOUT3_DIV_Descriptor {
        @available(*, unavailable)
        /// Integer component of the divisor, 0 -> divide by 2^16
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional component of the divisor
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 32
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT3_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_GPOUT3_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    public var CLK_GPOUT3_SELECTED: Register<CLK_GPOUT3_SELECTED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct CLK_GPOUT3_SELECTED_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_GPOUT3_SELECTED_Descriptor

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

                    public  typealias Value = CLK_GPOUT3_SELECTED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    public var CLK_REF_CTRL: Register<CLK_REF_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct CLK_REF_CTRL_Descriptor {
        @available(*, unavailable)
        /// Selects the auxiliary clock source, will glitch when switching
        public var AUXSRC: AUXSRC_Field {
            get {
                fatalError()
            }
        }

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_usb = 0
            case AUXSRC_clksrc_gpin0 = 1
            case AUXSRC_clksrc_gpin1 = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Selects the clock source glitchlessly, can be changed on-the-fly
        public var SRC: SRC_Field {
            get {
                fatalError()
            }
        }

        public enum SRC_Values: UInt, BitFieldProjectable {
            case SRC_rosc_clksrc_ph = 0
            case SRC_clksrc_clk_ref_aux = 1
            case SRC_xosc_clksrc = 2

            public static var bitWidth: Int { 2 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AUXSRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 7
        }

        public enum SRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 2
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_REF_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var AUXSRC: UInt32 {
                @inlinable @inline(__always) get {
                    AUXSRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AUXSRC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SRC: UInt32 {
                @inlinable @inline(__always) get {
                  SRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SRC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_REF_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var AUXSRC: AUXSRC_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                    return AUXSRC_Values(storage: self.raw.AUXSRC)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                    self.raw.AUXSRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SRC: SRC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SRC_Field.self, SRC_Values.self)
                  return SRC_Values(storage: self.raw.SRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SRC_Field.self, SRC_Values.self)
                  self.raw.SRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    public var CLK_REF_DIV: Register<CLK_REF_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct CLK_REF_DIV_Descriptor {
        @available(*, unavailable)
        /// Integer component of the divisor, 0 -> divide by 2^16
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_REF_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_REF_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField2.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// The glitchless multiplexer does not switch instantaneously (to avoid glitches), so software should poll this register to wait for the switch to complete. This register contains one decoded bit for each of the clock sources enumerated in the CTRL SRC field. At most one of these bits will be set at any time, indicating that clock is currently present at the output of the glitchless mux. Whilst switching is in progress, this register may briefly show all-0s.
    public var CLK_REF_SELECTED: Register<CLK_REF_SELECTED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct CLK_REF_SELECTED_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_REF_SELECTED_Descriptor

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

                    public  typealias Value = CLK_REF_SELECTED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    public var CLK_SYS_CTRL: Register<CLK_SYS_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct CLK_SYS_CTRL_Descriptor {
        @available(*, unavailable)
        /// Selects the auxiliary clock source, will glitch when switching
        public var AUXSRC: AUXSRC_Field {
            get {
                fatalError()
            }
        }

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_sys = 0
            case AUXSRC_clksrc_pll_usb = 1
            case AUXSRC_rosc_clksrc = 2
            case AUXSRC_xosc_clksrc = 3
            case AUXSRC_clksrc_gpin0 = 4
            case AUXSRC_clksrc_gpin1 = 5

            public static var bitWidth: Int { 3 }
        }
        @available(*, unavailable)

        /// Selects the clock source glitchlessly, can be changed on-the-fly
        public var SRC: SRC_Field {
            get {
                fatalError()
            }
        }

        public enum SRC_Values: UInt, BitFieldProjectable {
            case SRC_clk_ref = 0
            case SRC_clksrc_clk_sys_aux = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AUXSRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 8
        }

        public enum SRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_SYS_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var AUXSRC: UInt32 {
                @inlinable @inline(__always) get {
                    AUXSRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AUXSRC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SRC: UInt32 {
                @inlinable @inline(__always) get {
                  SRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SRC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_SYS_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var AUXSRC: AUXSRC_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                    return AUXSRC_Values(storage: self.raw.AUXSRC)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                    self.raw.AUXSRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SRC: SRC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SRC_Field.self, SRC_Values.self)
                  return SRC_Values(storage: self.raw.SRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SRC_Field.self, SRC_Values.self)
                  self.raw.SRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    public var CLK_SYS_DIV: Register<CLK_SYS_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct CLK_SYS_DIV_Descriptor {
        @available(*, unavailable)
        /// Integer component of the divisor, 0 -> divide by 2^16
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional component of the divisor
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 32
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_SYS_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_SYS_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// The glitchless multiplexer does not switch instantaneously (to avoid glitches), so software should poll this register to wait for the switch to complete. This register contains one decoded bit for each of the clock sources enumerated in the CTRL SRC field. At most one of these bits will be set at any time, indicating that clock is currently present at the output of the glitchless mux. Whilst switching is in progress, this register may briefly show all-0s.
    public var CLK_SYS_SELECTED: Register<CLK_SYS_SELECTED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct CLK_SYS_SELECTED_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_SYS_SELECTED_Descriptor

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

                    public  typealias Value = CLK_SYS_SELECTED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    public var CLK_PERI_CTRL: Register<CLK_PERI_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct CLK_PERI_CTRL_Descriptor {
        @available(*, unavailable)
        /// Starts and stops the clock generator cleanly
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Asynchronously kills the clock generator
        public var KILL: KILL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Selects the auxiliary clock source, will glitch when switching
        public var AUXSRC: AUXSRC_Field {
            get {
                fatalError()
            }
        }

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clk_sys = 0
            case AUXSRC_clksrc_pll_sys = 1
            case AUXSRC_clksrc_pll_usb = 2
            case AUXSRC_rosc_clksrc_ph = 3
            case AUXSRC_xosc_clksrc = 4
            case AUXSRC_clksrc_gpin0 = 5
            case AUXSRC_clksrc_gpin1 = 6

            public static var bitWidth: Int { 3 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum KILL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum AUXSRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_PERI_CTRL_Descriptor

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
              public var KILL: UInt32 {
                @inlinable @inline(__always) get {
                  KILL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  KILL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUXSRC: UInt32 {
                @inlinable @inline(__always) get {
                  AUXSRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUXSRC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_PERI_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
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
              public var KILL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  return Bool(storage: self.raw.KILL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  self.raw.KILL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUXSRC: AUXSRC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  return AUXSRC_Values(storage: self.raw.AUXSRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  self.raw.AUXSRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    public var CLK_PERI_SELECTED: Register<CLK_PERI_SELECTED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct CLK_PERI_SELECTED_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_PERI_SELECTED_Descriptor

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

                    public  typealias Value = CLK_PERI_SELECTED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    public var CLK_USB_CTRL: Register<CLK_USB_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct CLK_USB_CTRL_Descriptor {
        @available(*, unavailable)
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        public var NUDGE: NUDGE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        public var PHASE: PHASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Starts and stops the clock generator cleanly
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Asynchronously kills the clock generator
        public var KILL: KILL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Selects the auxiliary clock source, will glitch when switching
        public var AUXSRC: AUXSRC_Field {
            get {
                fatalError()
            }
        }

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_usb = 0
            case AUXSRC_clksrc_pll_sys = 1
            case AUXSRC_rosc_clksrc_ph = 2
            case AUXSRC_xosc_clksrc = 3
            case AUXSRC_clksrc_gpin0 = 4
            case AUXSRC_clksrc_gpin1 = 5

            public static var bitWidth: Int { 3 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NUDGE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum PHASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum KILL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum AUXSRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_USB_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var NUDGE: UInt32 {
                @inlinable @inline(__always) get {
                    NUDGE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NUDGE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PHASE: UInt32 {
                @inlinable @inline(__always) get {
                  PHASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PHASE_Field.insert(newValue, into: &self.storage)
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
              public var KILL: UInt32 {
                @inlinable @inline(__always) get {
                  KILL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  KILL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUXSRC: UInt32 {
                @inlinable @inline(__always) get {
                  AUXSRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUXSRC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_USB_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var NUDGE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    return Bool(storage: self.raw.NUDGE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    self.raw.NUDGE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PHASE: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.PHASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  self.raw.PHASE = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var KILL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  return Bool(storage: self.raw.KILL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  self.raw.KILL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUXSRC: AUXSRC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  return AUXSRC_Values(storage: self.raw.AUXSRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  self.raw.AUXSRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    public var CLK_USB_DIV: Register<CLK_USB_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0058), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0058))
          #endif
        }
    }
    public struct CLK_USB_DIV_Descriptor {
        @available(*, unavailable)
        /// Integer component of the divisor, 0 -> divide by 2^16
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_USB_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_USB_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField2.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    public var CLK_USB_SELECTED: Register<CLK_USB_SELECTED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x005c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x005c))
          #endif
        }
    }
    public struct CLK_USB_SELECTED_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_USB_SELECTED_Descriptor

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

                    public  typealias Value = CLK_USB_SELECTED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    public var CLK_ADC_CTRL: Register<CLK_ADC_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0060), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0060))
          #endif
        }
    }
    public struct CLK_ADC_CTRL_Descriptor {
        @available(*, unavailable)
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        public var NUDGE: NUDGE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        public var PHASE: PHASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Starts and stops the clock generator cleanly
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Asynchronously kills the clock generator
        public var KILL: KILL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Selects the auxiliary clock source, will glitch when switching
        public var AUXSRC: AUXSRC_Field {
            get {
                fatalError()
            }
        }

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_usb = 0
            case AUXSRC_clksrc_pll_sys = 1
            case AUXSRC_rosc_clksrc_ph = 2
            case AUXSRC_xosc_clksrc = 3
            case AUXSRC_clksrc_gpin0 = 4
            case AUXSRC_clksrc_gpin1 = 5

            public static var bitWidth: Int { 3 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NUDGE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum PHASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum KILL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum AUXSRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_ADC_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var NUDGE: UInt32 {
                @inlinable @inline(__always) get {
                    NUDGE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NUDGE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PHASE: UInt32 {
                @inlinable @inline(__always) get {
                  PHASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PHASE_Field.insert(newValue, into: &self.storage)
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
              public var KILL: UInt32 {
                @inlinable @inline(__always) get {
                  KILL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  KILL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUXSRC: UInt32 {
                @inlinable @inline(__always) get {
                  AUXSRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUXSRC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_ADC_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var NUDGE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    return Bool(storage: self.raw.NUDGE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    self.raw.NUDGE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PHASE: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.PHASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  self.raw.PHASE = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var KILL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  return Bool(storage: self.raw.KILL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  self.raw.KILL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUXSRC: AUXSRC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  return AUXSRC_Values(storage: self.raw.AUXSRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  self.raw.AUXSRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    public var CLK_ADC_DIV: Register<CLK_ADC_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0064), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0064))
          #endif
        }
    }
    public struct CLK_ADC_DIV_Descriptor {
        @available(*, unavailable)
        /// Integer component of the divisor, 0 -> divide by 2^16
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_ADC_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_ADC_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField2.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    public var CLK_ADC_SELECTED: Register<CLK_ADC_SELECTED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0068), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0068))
          #endif
        }
    }
    public struct CLK_ADC_SELECTED_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_ADC_SELECTED_Descriptor

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

                    public  typealias Value = CLK_ADC_SELECTED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    public var CLK_RTC_CTRL: Register<CLK_RTC_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x006c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x006c))
          #endif
        }
    }
    public struct CLK_RTC_CTRL_Descriptor {
        @available(*, unavailable)
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        public var NUDGE: NUDGE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        public var PHASE: PHASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Starts and stops the clock generator cleanly
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Asynchronously kills the clock generator
        public var KILL: KILL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Selects the auxiliary clock source, will glitch when switching
        public var AUXSRC: AUXSRC_Field {
            get {
                fatalError()
            }
        }

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_usb = 0
            case AUXSRC_clksrc_pll_sys = 1
            case AUXSRC_rosc_clksrc_ph = 2
            case AUXSRC_xosc_clksrc = 3
            case AUXSRC_clksrc_gpin0 = 4
            case AUXSRC_clksrc_gpin1 = 5

            public static var bitWidth: Int { 3 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NUDGE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum PHASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum KILL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum AUXSRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_RTC_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var NUDGE: UInt32 {
                @inlinable @inline(__always) get {
                    NUDGE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NUDGE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PHASE: UInt32 {
                @inlinable @inline(__always) get {
                  PHASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PHASE_Field.insert(newValue, into: &self.storage)
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
              public var KILL: UInt32 {
                @inlinable @inline(__always) get {
                  KILL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  KILL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUXSRC: UInt32 {
                @inlinable @inline(__always) get {
                  AUXSRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUXSRC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_RTC_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var NUDGE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    return Bool(storage: self.raw.NUDGE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(NUDGE_Field.self, Bool.self)
                    self.raw.NUDGE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PHASE: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.PHASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PHASE_Field.self, BitField2.self)
                  self.raw.PHASE = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var KILL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  return Bool(storage: self.raw.KILL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(KILL_Field.self, Bool.self)
                  self.raw.KILL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUXSRC: AUXSRC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  return AUXSRC_Values(storage: self.raw.AUXSRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUXSRC_Field.self, AUXSRC_Values.self)
                  self.raw.AUXSRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    public var CLK_RTC_DIV: Register<CLK_RTC_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0070), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0070))
          #endif
        }
    }
    public struct CLK_RTC_DIV_Descriptor {
        @available(*, unavailable)
        /// Integer component of the divisor, 0 -> divide by 2^16
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional component of the divisor
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 32
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_RTC_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_RTC_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField24.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    public var CLK_RTC_SELECTED: Register<CLK_RTC_SELECTED_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0074), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0074))
          #endif
        }
    }
    public struct CLK_RTC_SELECTED_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_RTC_SELECTED_Descriptor

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

                    public  typealias Value = CLK_RTC_SELECTED_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}
    public var CLK_SYS_RESUS_CTRL: Register<CLK_SYS_RESUS_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0078), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0078))
          #endif
        }
    }
    public struct CLK_SYS_RESUS_CTRL_Descriptor {
        @available(*, unavailable)
        /// For clearing the resus after the fault that triggered it has been corrected
        public var CLEAR: CLEAR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Force a resus, for test purposes only
        public var FRCE: FRCE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable resus
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This is expressed as a number of clk_ref cycles
        /// and must be >= 2x clk_ref_freq/min_clk_tst_freq
        public var TIMEOUT: TIMEOUT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLEAR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum FRCE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum TIMEOUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_SYS_RESUS_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CLEAR: UInt32 {
                @inlinable @inline(__always) get {
                    CLEAR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLEAR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRCE: UInt32 {
                @inlinable @inline(__always) get {
                  FRCE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRCE_Field.insert(newValue, into: &self.storage)
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
              public var TIMEOUT: UInt32 {
                @inlinable @inline(__always) get {
                  TIMEOUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TIMEOUT_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CLK_SYS_RESUS_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CLEAR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLEAR_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLEAR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CLEAR_Field.self, Bool.self)
                    self.raw.CLEAR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRCE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRCE_Field.self, Bool.self)
                  return Bool(storage: self.raw.FRCE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRCE_Field.self, Bool.self)
                  self.raw.FRCE = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var TIMEOUT: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TIMEOUT_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.TIMEOUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TIMEOUT_Field.self, BitField8.self)
                  self.raw.TIMEOUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var CLK_SYS_RESUS_STATUS: Register<CLK_SYS_RESUS_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x007c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x007c))
          #endif
        }
    }
    public struct CLK_SYS_RESUS_STATUS_Descriptor {
        @available(*, unavailable)
        /// Clock has been resuscitated, correct the error then send ctrl_clear=1
        public var RESUSSED: RESUSSED_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RESUSSED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CLK_SYS_RESUS_STATUS_Descriptor

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
                public var RESUSSED: UInt32 {
                @inlinable @inline(__always) get {
                    RESUSSED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RESUSSED_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = CLK_SYS_RESUS_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RESUSSED: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RESUSSED_Field.self, Bool.self)
                    return Bool(storage: self.raw.RESUSSED)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = CLK_SYS_RESUS_STATUS_Descriptor
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

    /// Reference clock frequency in kHz
    public var FC0_REF_KHZ: Register<FC0_REF_KHZ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0080), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0080))
          #endif
        }
    }
    public struct FC0_REF_KHZ_Descriptor {
        @available(*, unavailable)
        public var FC0_REF_KHZ: FC0_REF_KHZ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FC0_REF_KHZ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 20
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FC0_REF_KHZ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FC0_REF_KHZ: UInt32 {
                @inlinable @inline(__always) get {
                    FC0_REF_KHZ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FC0_REF_KHZ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FC0_REF_KHZ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FC0_REF_KHZ: BitField20 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FC0_REF_KHZ_Field.self, BitField20.self)
                    return BitField20(storage: self.raw.FC0_REF_KHZ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FC0_REF_KHZ_Field.self, BitField20.self)
                    self.raw.FC0_REF_KHZ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Minimum pass frequency in kHz. This is optional. Set to 0 if you are not using the pass/fail flags
    public var FC0_MIN_KHZ: Register<FC0_MIN_KHZ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0084), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0084))
          #endif
        }
    }
    public struct FC0_MIN_KHZ_Descriptor {
        @available(*, unavailable)
        public var FC0_MIN_KHZ: FC0_MIN_KHZ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FC0_MIN_KHZ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 25
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FC0_MIN_KHZ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FC0_MIN_KHZ: UInt32 {
                @inlinable @inline(__always) get {
                    FC0_MIN_KHZ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FC0_MIN_KHZ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FC0_MIN_KHZ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FC0_MIN_KHZ: BitField25 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FC0_MIN_KHZ_Field.self, BitField25.self)
                    return BitField25(storage: self.raw.FC0_MIN_KHZ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FC0_MIN_KHZ_Field.self, BitField25.self)
                    self.raw.FC0_MIN_KHZ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Maximum pass frequency in kHz. This is optional. Set to 0x1ffffff if you are not using the pass/fail flags
    public var FC0_MAX_KHZ: Register<FC0_MAX_KHZ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0088), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0088))
          #endif
        }
    }
    public struct FC0_MAX_KHZ_Descriptor {
        @available(*, unavailable)
        public var FC0_MAX_KHZ: FC0_MAX_KHZ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FC0_MAX_KHZ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 25
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FC0_MAX_KHZ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FC0_MAX_KHZ: UInt32 {
                @inlinable @inline(__always) get {
                    FC0_MAX_KHZ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FC0_MAX_KHZ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FC0_MAX_KHZ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FC0_MAX_KHZ: BitField25 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FC0_MAX_KHZ_Field.self, BitField25.self)
                    return BitField25(storage: self.raw.FC0_MAX_KHZ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FC0_MAX_KHZ_Field.self, BitField25.self)
                    self.raw.FC0_MAX_KHZ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Delays the start of frequency counting to allow the mux to settle
    /// Delay is measured in multiples of the reference clock period
    public var FC0_DELAY: Register<FC0_DELAY_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x008c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x008c))
          #endif
        }
    }
    public struct FC0_DELAY_Descriptor {
        @available(*, unavailable)
        public var FC0_DELAY: FC0_DELAY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FC0_DELAY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 3
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FC0_DELAY_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FC0_DELAY: UInt32 {
                @inlinable @inline(__always) get {
                    FC0_DELAY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FC0_DELAY_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FC0_DELAY_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FC0_DELAY: BitField3 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FC0_DELAY_Field.self, BitField3.self)
                    return BitField3(storage: self.raw.FC0_DELAY)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FC0_DELAY_Field.self, BitField3.self)
                    self.raw.FC0_DELAY = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// The test interval is 0.98us * 2**interval, but let's call it 1us * 2**interval
    /// The default gives a test interval of 250us
    public var FC0_INTERVAL: Register<FC0_INTERVAL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0090), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0090))
          #endif
        }
    }
    public struct FC0_INTERVAL_Descriptor {
        @available(*, unavailable)
        public var FC0_INTERVAL: FC0_INTERVAL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FC0_INTERVAL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FC0_INTERVAL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FC0_INTERVAL: UInt32 {
                @inlinable @inline(__always) get {
                    FC0_INTERVAL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FC0_INTERVAL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FC0_INTERVAL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FC0_INTERVAL: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FC0_INTERVAL_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.FC0_INTERVAL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FC0_INTERVAL_Field.self, BitField4.self)
                    self.raw.FC0_INTERVAL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Clock sent to frequency counter, set to 0 when not required
    /// Writing to this register initiates the frequency count
    public var FC0_SRC: Register<FC0_SRC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0094), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0094))
          #endif
        }
    }
    public struct FC0_SRC_Descriptor {
        @available(*, unavailable)
        public var FC0_SRC: FC0_SRC_Field {
            get {
                fatalError()
            }
        }

        public enum FC0_SRC_Values: UInt, BitFieldProjectable {
            case FC0_SRC_NULL = 0
            case FC0_SRC_pll_sys_clksrc_primary = 1
            case FC0_SRC_pll_usb_clksrc_primary = 2
            case FC0_SRC_rosc_clksrc = 3
            case FC0_SRC_rosc_clksrc_ph = 4
            case FC0_SRC_xosc_clksrc = 5
            case FC0_SRC_clksrc_gpin0 = 6
            case FC0_SRC_clksrc_gpin1 = 7
            case FC0_SRC_clk_ref = 8
            case FC0_SRC_clk_sys = 9
            case FC0_SRC_clk_peri = 10
            case FC0_SRC_clk_usb = 11
            case FC0_SRC_clk_adc = 12
            case FC0_SRC_clk_rtc = 13

            public static var bitWidth: Int { 8 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FC0_SRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FC0_SRC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FC0_SRC: UInt32 {
                @inlinable @inline(__always) get {
                    FC0_SRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FC0_SRC_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FC0_SRC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FC0_SRC: FC0_SRC_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FC0_SRC_Field.self, FC0_SRC_Values.self)
                    return FC0_SRC_Values(storage: self.raw.FC0_SRC)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FC0_SRC_Field.self, FC0_SRC_Values.self)
                    self.raw.FC0_SRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Frequency counter status
    public var FC0_STATUS: Register<FC0_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0098), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0098))
          #endif
        }
    }
    public struct FC0_STATUS_Descriptor {
        @available(*, unavailable)
        /// Test clock stopped during test
        public var DIED: DIED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Test clock faster than expected, only valid when status_done=1
        public var FAST: FAST_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Test clock slower than expected, only valid when status_done=1
        public var SLOW: SLOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Test failed
        public var FAIL: FAIL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Waiting for test clock to start
        public var WAITING: WAITING_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Test running
        public var RUNNING: RUNNING_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Test complete
        public var DONE: DONE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Test passed
        public var PASS: PASS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DIED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum FAST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SLOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum FAIL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum WAITING_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum RUNNING_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum DONE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum PASS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FC0_STATUS_Descriptor

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
                public var DIED: UInt32 {
                @inlinable @inline(__always) get {
                    DIED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DIED_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FAST: UInt32 {
                @inlinable @inline(__always) get {
                  FAST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FAST_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SLOW: UInt32 {
                @inlinable @inline(__always) get {
                  SLOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FAIL: UInt32 {
                @inlinable @inline(__always) get {
                  FAIL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FAIL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WAITING: UInt32 {
                @inlinable @inline(__always) get {
                  WAITING_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WAITING_Field.insert(newValue, into: &self.storage)
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
              public var DONE: UInt32 {
                @inlinable @inline(__always) get {
                  DONE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DONE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PASS: UInt32 {
                @inlinable @inline(__always) get {
                  PASS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PASS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = FC0_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var DIED: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DIED_Field.self, Bool.self)
                    return Bool(storage: self.raw.DIED)
                }
                }
              public var FAST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FAST_Field.self, Bool.self)
                  return Bool(storage: self.raw.FAST)
                }
              }
              public var SLOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.SLOW)
                }
              }
              public var FAIL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FAIL_Field.self, Bool.self)
                  return Bool(storage: self.raw.FAIL)
                }
              }
              public var WAITING: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WAITING_Field.self, Bool.self)
                  return Bool(storage: self.raw.WAITING)
                }
              }
              public var RUNNING: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RUNNING_Field.self, Bool.self)
                  return Bool(storage: self.raw.RUNNING)
                }
              }
              public var DONE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DONE_Field.self, Bool.self)
                  return Bool(storage: self.raw.DONE)
                }
              }
              public var PASS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PASS_Field.self, Bool.self)
                  return Bool(storage: self.raw.PASS)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = FC0_STATUS_Descriptor
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

    /// Result of frequency measurement, only valid when status_done=1
    public var FC0_RESULT: Register<FC0_RESULT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x009c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x009c))
          #endif
        }
    }
    public struct FC0_RESULT_Descriptor {
        @available(*, unavailable)
        public var KHZ: KHZ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum KHZ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 30
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FC0_RESULT_Descriptor

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
                public var KHZ: UInt32 {
                @inlinable @inline(__always) get {
                    KHZ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    KHZ_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = FC0_RESULT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var KHZ: BitField25 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(KHZ_Field.self, BitField25.self)
                    return BitField25(storage: self.raw.KHZ)
                }
                }
              public var FRAC: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.FRAC)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = FC0_RESULT_Descriptor
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

    /// enable clock in wake mode
    public var WAKE_EN0: Register<WAKE_EN0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0))
          #endif
        }
    }
    public struct WAKE_EN0_Descriptor {
        @available(*, unavailable)
        public var clk_sys_sram3: clk_sys_sram3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram2: clk_sys_sram2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram1: clk_sys_sram1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram0: clk_sys_sram0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_spi1: clk_sys_spi1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_spi1: clk_peri_spi1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_spi0: clk_sys_spi0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_spi0: clk_peri_spi0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sio: clk_sys_sio_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_rtc: clk_sys_rtc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_rtc_rtc: clk_rtc_rtc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_rosc: clk_sys_rosc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_rom: clk_sys_rom_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_resets: clk_sys_resets_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pwm: clk_sys_pwm_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_psm: clk_sys_psm_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pll_usb: clk_sys_pll_usb_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pll_sys: clk_sys_pll_sys_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pio1: clk_sys_pio1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pio0: clk_sys_pio0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pads: clk_sys_pads_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_vreg_and_chip_reset: clk_sys_vreg_and_chip_reset_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_jtag: clk_sys_jtag_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_io: clk_sys_io_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_i2c1: clk_sys_i2c1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_i2c0: clk_sys_i2c0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_dma: clk_sys_dma_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_busfabric: clk_sys_busfabric_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_busctrl: clk_sys_busctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_adc: clk_sys_adc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_adc_adc: clk_adc_adc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_clocks: clk_sys_clocks_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum clk_sys_sram3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum clk_sys_sram2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum clk_sys_sram1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum clk_sys_sram0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum clk_sys_spi1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum clk_peri_spi1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum clk_sys_spi0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum clk_peri_spi0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum clk_sys_sio_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum clk_sys_rtc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum clk_rtc_rtc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum clk_sys_rosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum clk_sys_rom_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum clk_sys_resets_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum clk_sys_pwm_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum clk_sys_psm_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum clk_sys_pll_usb_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum clk_sys_pll_sys_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum clk_sys_pio1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum clk_sys_pio0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum clk_sys_pads_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum clk_sys_vreg_and_chip_reset_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum clk_sys_jtag_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum clk_sys_io_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum clk_sys_i2c1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum clk_sys_i2c0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum clk_sys_dma_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum clk_sys_busfabric_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum clk_sys_busctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum clk_sys_adc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum clk_adc_adc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum clk_sys_clocks_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = WAKE_EN0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var clk_sys_sram3: UInt32 {
                @inlinable @inline(__always) get {
                    clk_sys_sram3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    clk_sys_sram3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var clk_sys_sram2: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_spi1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_spi1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_spi1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_spi1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_spi1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_spi1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_spi0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_spi0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_spi0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_spi0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_spi0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_spi0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sio: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sio_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sio_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_rtc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_rtc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_rtc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_rtc_rtc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_rtc_rtc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_rtc_rtc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_rosc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_rosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_rosc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_rom: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_rom_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_rom_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_resets: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_resets_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_resets_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pwm: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pwm_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pwm_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_psm: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_psm_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_psm_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pll_usb: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pll_usb_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pll_usb_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pll_sys: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pll_sys_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pll_sys_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pio1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pio1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pio1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pio0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pio0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pio0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pads: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pads_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pads_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_vreg_and_chip_reset: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_vreg_and_chip_reset_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_vreg_and_chip_reset_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_jtag: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_jtag_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_jtag_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_io: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_io_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_io_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_i2c1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_i2c1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_i2c1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_i2c0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_i2c0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_i2c0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_dma: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_dma_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_dma_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_busfabric: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_busfabric_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_busfabric_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_busctrl: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_busctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_busctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_adc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_adc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_adc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_adc_adc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_adc_adc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_adc_adc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_clocks: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_clocks_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_clocks_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = WAKE_EN0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var clk_sys_sram3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(clk_sys_sram3_Field.self, Bool.self)
                    return Bool(storage: self.raw.clk_sys_sram3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(clk_sys_sram3_Field.self, Bool.self)
                    self.raw.clk_sys_sram3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var clk_sys_sram2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram2_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sram2_Field.self, Bool.self)
                  self.raw.clk_sys_sram2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sram1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sram1_Field.self, Bool.self)
                  self.raw.clk_sys_sram1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sram0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sram0_Field.self, Bool.self)
                  self.raw.clk_sys_sram0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_spi1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_spi1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_spi1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_spi1_Field.self, Bool.self)
                  self.raw.clk_sys_spi1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_peri_spi1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_spi1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_spi1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_peri_spi1_Field.self, Bool.self)
                  self.raw.clk_peri_spi1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_spi0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_spi0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_spi0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_spi0_Field.self, Bool.self)
                  self.raw.clk_sys_spi0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_peri_spi0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_spi0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_spi0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_peri_spi0_Field.self, Bool.self)
                  self.raw.clk_peri_spi0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sio: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sio_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sio)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sio_Field.self, Bool.self)
                  self.raw.clk_sys_sio = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_rtc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_rtc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_rtc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_rtc_Field.self, Bool.self)
                  self.raw.clk_sys_rtc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_rtc_rtc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_rtc_rtc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_rtc_rtc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_rtc_rtc_Field.self, Bool.self)
                  self.raw.clk_rtc_rtc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_rosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_rosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_rosc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_rosc_Field.self, Bool.self)
                  self.raw.clk_sys_rosc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_rom: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_rom_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_rom)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_rom_Field.self, Bool.self)
                  self.raw.clk_sys_rom = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_resets: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_resets_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_resets)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_resets_Field.self, Bool.self)
                  self.raw.clk_sys_resets = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pwm: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pwm_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pwm)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pwm_Field.self, Bool.self)
                  self.raw.clk_sys_pwm = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_psm: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_psm_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_psm)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_psm_Field.self, Bool.self)
                  self.raw.clk_sys_psm = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pll_usb: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pll_usb_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pll_usb)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pll_usb_Field.self, Bool.self)
                  self.raw.clk_sys_pll_usb = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pll_sys: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pll_sys_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pll_sys)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pll_sys_Field.self, Bool.self)
                  self.raw.clk_sys_pll_sys = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pio1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pio1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pio1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pio1_Field.self, Bool.self)
                  self.raw.clk_sys_pio1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pio0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pio0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pio0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pio0_Field.self, Bool.self)
                  self.raw.clk_sys_pio0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pads: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pads_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pads)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pads_Field.self, Bool.self)
                  self.raw.clk_sys_pads = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_vreg_and_chip_reset: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_vreg_and_chip_reset_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_vreg_and_chip_reset)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_vreg_and_chip_reset_Field.self, Bool.self)
                  self.raw.clk_sys_vreg_and_chip_reset = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_jtag: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_jtag_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_jtag)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_jtag_Field.self, Bool.self)
                  self.raw.clk_sys_jtag = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_io: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_io_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_io)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_io_Field.self, Bool.self)
                  self.raw.clk_sys_io = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_i2c1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_i2c1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_i2c1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_i2c1_Field.self, Bool.self)
                  self.raw.clk_sys_i2c1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_i2c0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_i2c0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_i2c0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_i2c0_Field.self, Bool.self)
                  self.raw.clk_sys_i2c0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_dma: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_dma_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_dma)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_dma_Field.self, Bool.self)
                  self.raw.clk_sys_dma = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_busfabric: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_busfabric_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_busfabric)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_busfabric_Field.self, Bool.self)
                  self.raw.clk_sys_busfabric = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_busctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_busctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_busctrl)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_busctrl_Field.self, Bool.self)
                  self.raw.clk_sys_busctrl = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_adc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_adc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_adc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_adc_Field.self, Bool.self)
                  self.raw.clk_sys_adc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_adc_adc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_adc_adc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_adc_adc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_adc_adc_Field.self, Bool.self)
                  self.raw.clk_adc_adc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_clocks: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_clocks_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_clocks)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_clocks_Field.self, Bool.self)
                  self.raw.clk_sys_clocks = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// enable clock in wake mode
    public var WAKE_EN1: Register<WAKE_EN1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4))
          #endif
        }
    }
    public struct WAKE_EN1_Descriptor {
        @available(*, unavailable)
        public var clk_sys_xosc: clk_sys_xosc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_xip: clk_sys_xip_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_watchdog: clk_sys_watchdog_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_usb_usbctrl: clk_usb_usbctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_usbctrl: clk_sys_usbctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_uart1: clk_sys_uart1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_uart1: clk_peri_uart1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_uart0: clk_sys_uart0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_uart0: clk_peri_uart0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_timer: clk_sys_timer_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_tbman: clk_sys_tbman_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sysinfo: clk_sys_sysinfo_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_syscfg: clk_sys_syscfg_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram5: clk_sys_sram5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram4: clk_sys_sram4_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum clk_sys_xosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum clk_sys_xip_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum clk_sys_watchdog_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum clk_usb_usbctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum clk_sys_usbctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum clk_sys_uart1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum clk_peri_uart1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum clk_sys_uart0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum clk_peri_uart0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum clk_sys_timer_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum clk_sys_tbman_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum clk_sys_sysinfo_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum clk_sys_syscfg_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum clk_sys_sram5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum clk_sys_sram4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = WAKE_EN1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var clk_sys_xosc: UInt32 {
                @inlinable @inline(__always) get {
                    clk_sys_xosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    clk_sys_xosc_Field.insert(newValue, into: &self.storage)
                }
                }
              public var clk_sys_xip: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_xip_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_xip_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_watchdog: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_watchdog_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_watchdog_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_usb_usbctrl: UInt32 {
                @inlinable @inline(__always) get {
                  clk_usb_usbctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_usb_usbctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_usbctrl: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_usbctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_usbctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_uart1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_uart1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_uart1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_uart1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_uart1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_uart1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_uart0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_uart0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_uart0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_uart0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_uart0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_uart0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_timer: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_timer_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_timer_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_tbman: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_tbman_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_tbman_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sysinfo: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sysinfo_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sysinfo_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_syscfg: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_syscfg_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_syscfg_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram5: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram4: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram4_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = WAKE_EN1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var clk_sys_xosc: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(clk_sys_xosc_Field.self, Bool.self)
                    return Bool(storage: self.raw.clk_sys_xosc)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(clk_sys_xosc_Field.self, Bool.self)
                    self.raw.clk_sys_xosc = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var clk_sys_xip: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_xip_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_xip)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_xip_Field.self, Bool.self)
                  self.raw.clk_sys_xip = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_watchdog: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_watchdog_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_watchdog)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_watchdog_Field.self, Bool.self)
                  self.raw.clk_sys_watchdog = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_usb_usbctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_usb_usbctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_usb_usbctrl)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_usb_usbctrl_Field.self, Bool.self)
                  self.raw.clk_usb_usbctrl = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_usbctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_usbctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_usbctrl)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_usbctrl_Field.self, Bool.self)
                  self.raw.clk_sys_usbctrl = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_uart1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_uart1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_uart1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_uart1_Field.self, Bool.self)
                  self.raw.clk_sys_uart1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_peri_uart1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_uart1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_uart1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_peri_uart1_Field.self, Bool.self)
                  self.raw.clk_peri_uart1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_uart0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_uart0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_uart0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_uart0_Field.self, Bool.self)
                  self.raw.clk_sys_uart0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_peri_uart0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_uart0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_uart0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_peri_uart0_Field.self, Bool.self)
                  self.raw.clk_peri_uart0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_timer: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_timer_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_timer)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_timer_Field.self, Bool.self)
                  self.raw.clk_sys_timer = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_tbman: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_tbman_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_tbman)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_tbman_Field.self, Bool.self)
                  self.raw.clk_sys_tbman = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sysinfo: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sysinfo_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sysinfo)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sysinfo_Field.self, Bool.self)
                  self.raw.clk_sys_sysinfo = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_syscfg: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_syscfg_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_syscfg)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_syscfg_Field.self, Bool.self)
                  self.raw.clk_sys_syscfg = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sram5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram5_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sram5_Field.self, Bool.self)
                  self.raw.clk_sys_sram5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sram4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram4_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sram4_Field.self, Bool.self)
                  self.raw.clk_sys_sram4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// enable clock in sleep mode
    public var SLEEP_EN0: Register<SLEEP_EN0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8))
          #endif
        }
    }
    public struct SLEEP_EN0_Descriptor {
        @available(*, unavailable)
        public var clk_sys_sram3: clk_sys_sram3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram2: clk_sys_sram2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram1: clk_sys_sram1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram0: clk_sys_sram0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_spi1: clk_sys_spi1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_spi1: clk_peri_spi1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_spi0: clk_sys_spi0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_spi0: clk_peri_spi0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sio: clk_sys_sio_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_rtc: clk_sys_rtc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_rtc_rtc: clk_rtc_rtc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_rosc: clk_sys_rosc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_rom: clk_sys_rom_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_resets: clk_sys_resets_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pwm: clk_sys_pwm_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_psm: clk_sys_psm_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pll_usb: clk_sys_pll_usb_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pll_sys: clk_sys_pll_sys_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pio1: clk_sys_pio1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pio0: clk_sys_pio0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pads: clk_sys_pads_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_vreg_and_chip_reset: clk_sys_vreg_and_chip_reset_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_jtag: clk_sys_jtag_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_io: clk_sys_io_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_i2c1: clk_sys_i2c1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_i2c0: clk_sys_i2c0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_dma: clk_sys_dma_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_busfabric: clk_sys_busfabric_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_busctrl: clk_sys_busctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_adc: clk_sys_adc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_adc_adc: clk_adc_adc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_clocks: clk_sys_clocks_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum clk_sys_sram3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum clk_sys_sram2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum clk_sys_sram1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum clk_sys_sram0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum clk_sys_spi1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum clk_peri_spi1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum clk_sys_spi0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum clk_peri_spi0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum clk_sys_sio_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum clk_sys_rtc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum clk_rtc_rtc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum clk_sys_rosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum clk_sys_rom_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum clk_sys_resets_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum clk_sys_pwm_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum clk_sys_psm_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum clk_sys_pll_usb_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum clk_sys_pll_sys_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum clk_sys_pio1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum clk_sys_pio0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum clk_sys_pads_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum clk_sys_vreg_and_chip_reset_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum clk_sys_jtag_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum clk_sys_io_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum clk_sys_i2c1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum clk_sys_i2c0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum clk_sys_dma_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum clk_sys_busfabric_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum clk_sys_busctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum clk_sys_adc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum clk_adc_adc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum clk_sys_clocks_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SLEEP_EN0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var clk_sys_sram3: UInt32 {
                @inlinable @inline(__always) get {
                    clk_sys_sram3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    clk_sys_sram3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var clk_sys_sram2: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_spi1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_spi1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_spi1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_spi1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_spi1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_spi1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_spi0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_spi0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_spi0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_spi0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_spi0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_spi0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sio: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sio_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sio_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_rtc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_rtc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_rtc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_rtc_rtc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_rtc_rtc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_rtc_rtc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_rosc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_rosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_rosc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_rom: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_rom_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_rom_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_resets: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_resets_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_resets_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pwm: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pwm_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pwm_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_psm: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_psm_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_psm_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pll_usb: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pll_usb_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pll_usb_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pll_sys: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pll_sys_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pll_sys_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pio1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pio1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pio1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pio0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pio0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pio0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pads: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pads_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pads_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_vreg_and_chip_reset: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_vreg_and_chip_reset_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_vreg_and_chip_reset_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_jtag: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_jtag_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_jtag_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_io: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_io_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_io_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_i2c1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_i2c1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_i2c1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_i2c0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_i2c0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_i2c0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_dma: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_dma_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_dma_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_busfabric: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_busfabric_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_busfabric_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_busctrl: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_busctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_busctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_adc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_adc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_adc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_adc_adc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_adc_adc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_adc_adc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_clocks: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_clocks_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_clocks_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SLEEP_EN0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var clk_sys_sram3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(clk_sys_sram3_Field.self, Bool.self)
                    return Bool(storage: self.raw.clk_sys_sram3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(clk_sys_sram3_Field.self, Bool.self)
                    self.raw.clk_sys_sram3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var clk_sys_sram2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram2_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sram2_Field.self, Bool.self)
                  self.raw.clk_sys_sram2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sram1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sram1_Field.self, Bool.self)
                  self.raw.clk_sys_sram1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sram0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sram0_Field.self, Bool.self)
                  self.raw.clk_sys_sram0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_spi1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_spi1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_spi1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_spi1_Field.self, Bool.self)
                  self.raw.clk_sys_spi1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_peri_spi1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_spi1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_spi1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_peri_spi1_Field.self, Bool.self)
                  self.raw.clk_peri_spi1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_spi0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_spi0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_spi0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_spi0_Field.self, Bool.self)
                  self.raw.clk_sys_spi0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_peri_spi0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_spi0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_spi0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_peri_spi0_Field.self, Bool.self)
                  self.raw.clk_peri_spi0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sio: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sio_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sio)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sio_Field.self, Bool.self)
                  self.raw.clk_sys_sio = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_rtc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_rtc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_rtc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_rtc_Field.self, Bool.self)
                  self.raw.clk_sys_rtc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_rtc_rtc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_rtc_rtc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_rtc_rtc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_rtc_rtc_Field.self, Bool.self)
                  self.raw.clk_rtc_rtc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_rosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_rosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_rosc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_rosc_Field.self, Bool.self)
                  self.raw.clk_sys_rosc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_rom: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_rom_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_rom)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_rom_Field.self, Bool.self)
                  self.raw.clk_sys_rom = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_resets: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_resets_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_resets)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_resets_Field.self, Bool.self)
                  self.raw.clk_sys_resets = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pwm: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pwm_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pwm)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pwm_Field.self, Bool.self)
                  self.raw.clk_sys_pwm = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_psm: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_psm_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_psm)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_psm_Field.self, Bool.self)
                  self.raw.clk_sys_psm = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pll_usb: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pll_usb_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pll_usb)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pll_usb_Field.self, Bool.self)
                  self.raw.clk_sys_pll_usb = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pll_sys: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pll_sys_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pll_sys)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pll_sys_Field.self, Bool.self)
                  self.raw.clk_sys_pll_sys = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pio1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pio1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pio1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pio1_Field.self, Bool.self)
                  self.raw.clk_sys_pio1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pio0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pio0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pio0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pio0_Field.self, Bool.self)
                  self.raw.clk_sys_pio0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_pads: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pads_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pads)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_pads_Field.self, Bool.self)
                  self.raw.clk_sys_pads = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_vreg_and_chip_reset: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_vreg_and_chip_reset_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_vreg_and_chip_reset)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_vreg_and_chip_reset_Field.self, Bool.self)
                  self.raw.clk_sys_vreg_and_chip_reset = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_jtag: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_jtag_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_jtag)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_jtag_Field.self, Bool.self)
                  self.raw.clk_sys_jtag = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_io: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_io_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_io)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_io_Field.self, Bool.self)
                  self.raw.clk_sys_io = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_i2c1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_i2c1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_i2c1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_i2c1_Field.self, Bool.self)
                  self.raw.clk_sys_i2c1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_i2c0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_i2c0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_i2c0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_i2c0_Field.self, Bool.self)
                  self.raw.clk_sys_i2c0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_dma: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_dma_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_dma)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_dma_Field.self, Bool.self)
                  self.raw.clk_sys_dma = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_busfabric: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_busfabric_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_busfabric)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_busfabric_Field.self, Bool.self)
                  self.raw.clk_sys_busfabric = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_busctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_busctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_busctrl)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_busctrl_Field.self, Bool.self)
                  self.raw.clk_sys_busctrl = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_adc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_adc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_adc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_adc_Field.self, Bool.self)
                  self.raw.clk_sys_adc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_adc_adc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_adc_adc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_adc_adc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_adc_adc_Field.self, Bool.self)
                  self.raw.clk_adc_adc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_clocks: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_clocks_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_clocks)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_clocks_Field.self, Bool.self)
                  self.raw.clk_sys_clocks = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// enable clock in sleep mode
    public var SLEEP_EN1: Register<SLEEP_EN1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac))
          #endif
        }
    }
    public struct SLEEP_EN1_Descriptor {
        @available(*, unavailable)
        public var clk_sys_xosc: clk_sys_xosc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_xip: clk_sys_xip_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_watchdog: clk_sys_watchdog_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_usb_usbctrl: clk_usb_usbctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_usbctrl: clk_sys_usbctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_uart1: clk_sys_uart1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_uart1: clk_peri_uart1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_uart0: clk_sys_uart0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_uart0: clk_peri_uart0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_timer: clk_sys_timer_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_tbman: clk_sys_tbman_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sysinfo: clk_sys_sysinfo_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_syscfg: clk_sys_syscfg_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram5: clk_sys_sram5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram4: clk_sys_sram4_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum clk_sys_xosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum clk_sys_xip_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum clk_sys_watchdog_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum clk_usb_usbctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum clk_sys_usbctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum clk_sys_uart1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum clk_peri_uart1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum clk_sys_uart0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum clk_peri_uart0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum clk_sys_timer_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum clk_sys_tbman_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum clk_sys_sysinfo_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum clk_sys_syscfg_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum clk_sys_sram5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum clk_sys_sram4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SLEEP_EN1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var clk_sys_xosc: UInt32 {
                @inlinable @inline(__always) get {
                    clk_sys_xosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    clk_sys_xosc_Field.insert(newValue, into: &self.storage)
                }
                }
              public var clk_sys_xip: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_xip_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_xip_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_watchdog: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_watchdog_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_watchdog_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_usb_usbctrl: UInt32 {
                @inlinable @inline(__always) get {
                  clk_usb_usbctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_usb_usbctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_usbctrl: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_usbctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_usbctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_uart1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_uart1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_uart1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_uart1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_uart1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_uart1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_uart0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_uart0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_uart0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_uart0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_uart0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_uart0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_timer: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_timer_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_timer_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_tbman: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_tbman_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_tbman_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sysinfo: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sysinfo_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sysinfo_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_syscfg: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_syscfg_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_syscfg_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram5: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram4: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram4_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SLEEP_EN1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var clk_sys_xosc: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(clk_sys_xosc_Field.self, Bool.self)
                    return Bool(storage: self.raw.clk_sys_xosc)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(clk_sys_xosc_Field.self, Bool.self)
                    self.raw.clk_sys_xosc = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var clk_sys_xip: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_xip_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_xip)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_xip_Field.self, Bool.self)
                  self.raw.clk_sys_xip = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_watchdog: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_watchdog_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_watchdog)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_watchdog_Field.self, Bool.self)
                  self.raw.clk_sys_watchdog = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_usb_usbctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_usb_usbctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_usb_usbctrl)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_usb_usbctrl_Field.self, Bool.self)
                  self.raw.clk_usb_usbctrl = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_usbctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_usbctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_usbctrl)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_usbctrl_Field.self, Bool.self)
                  self.raw.clk_sys_usbctrl = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_uart1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_uart1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_uart1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_uart1_Field.self, Bool.self)
                  self.raw.clk_sys_uart1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_peri_uart1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_uart1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_uart1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_peri_uart1_Field.self, Bool.self)
                  self.raw.clk_peri_uart1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_uart0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_uart0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_uart0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_uart0_Field.self, Bool.self)
                  self.raw.clk_sys_uart0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_peri_uart0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_uart0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_uart0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_peri_uart0_Field.self, Bool.self)
                  self.raw.clk_peri_uart0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_timer: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_timer_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_timer)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_timer_Field.self, Bool.self)
                  self.raw.clk_sys_timer = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_tbman: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_tbman_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_tbman)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_tbman_Field.self, Bool.self)
                  self.raw.clk_sys_tbman = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sysinfo: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sysinfo_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sysinfo)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sysinfo_Field.self, Bool.self)
                  self.raw.clk_sys_sysinfo = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_syscfg: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_syscfg_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_syscfg)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_syscfg_Field.self, Bool.self)
                  self.raw.clk_sys_syscfg = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sram5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram5_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sram5_Field.self, Bool.self)
                  self.raw.clk_sys_sram5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clk_sys_sram4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram4_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clk_sys_sram4_Field.self, Bool.self)
                  self.raw.clk_sys_sram4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// indicates the state of the clock enable
    public var ENABLED0: Register<ENABLED0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0))
          #endif
        }
    }
    public struct ENABLED0_Descriptor {
        @available(*, unavailable)
        public var clk_sys_sram3: clk_sys_sram3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram2: clk_sys_sram2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram1: clk_sys_sram1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram0: clk_sys_sram0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_spi1: clk_sys_spi1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_spi1: clk_peri_spi1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_spi0: clk_sys_spi0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_spi0: clk_peri_spi0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sio: clk_sys_sio_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_rtc: clk_sys_rtc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_rtc_rtc: clk_rtc_rtc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_rosc: clk_sys_rosc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_rom: clk_sys_rom_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_resets: clk_sys_resets_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pwm: clk_sys_pwm_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_psm: clk_sys_psm_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pll_usb: clk_sys_pll_usb_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pll_sys: clk_sys_pll_sys_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pio1: clk_sys_pio1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pio0: clk_sys_pio0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_pads: clk_sys_pads_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_vreg_and_chip_reset: clk_sys_vreg_and_chip_reset_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_jtag: clk_sys_jtag_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_io: clk_sys_io_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_i2c1: clk_sys_i2c1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_i2c0: clk_sys_i2c0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_dma: clk_sys_dma_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_busfabric: clk_sys_busfabric_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_busctrl: clk_sys_busctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_adc: clk_sys_adc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_adc_adc: clk_adc_adc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_clocks: clk_sys_clocks_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum clk_sys_sram3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum clk_sys_sram2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum clk_sys_sram1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum clk_sys_sram0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum clk_sys_spi1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum clk_peri_spi1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum clk_sys_spi0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum clk_peri_spi0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum clk_sys_sio_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum clk_sys_rtc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum clk_rtc_rtc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum clk_sys_rosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum clk_sys_rom_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum clk_sys_resets_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum clk_sys_pwm_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum clk_sys_psm_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum clk_sys_pll_usb_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum clk_sys_pll_sys_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum clk_sys_pio1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum clk_sys_pio0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum clk_sys_pads_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum clk_sys_vreg_and_chip_reset_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum clk_sys_jtag_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum clk_sys_io_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum clk_sys_i2c1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum clk_sys_i2c0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum clk_sys_dma_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum clk_sys_busfabric_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum clk_sys_busctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum clk_sys_adc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum clk_adc_adc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum clk_sys_clocks_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ENABLED0_Descriptor

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
                public var clk_sys_sram3: UInt32 {
                @inlinable @inline(__always) get {
                    clk_sys_sram3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    clk_sys_sram3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var clk_sys_sram2: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_spi1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_spi1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_spi1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_spi1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_spi1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_spi1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_spi0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_spi0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_spi0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_spi0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_spi0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_spi0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sio: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sio_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sio_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_rtc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_rtc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_rtc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_rtc_rtc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_rtc_rtc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_rtc_rtc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_rosc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_rosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_rosc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_rom: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_rom_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_rom_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_resets: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_resets_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_resets_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pwm: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pwm_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pwm_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_psm: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_psm_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_psm_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pll_usb: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pll_usb_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pll_usb_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pll_sys: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pll_sys_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pll_sys_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pio1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pio1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pio1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pio0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pio0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pio0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_pads: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_pads_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_pads_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_vreg_and_chip_reset: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_vreg_and_chip_reset_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_vreg_and_chip_reset_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_jtag: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_jtag_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_jtag_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_io: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_io_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_io_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_i2c1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_i2c1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_i2c1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_i2c0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_i2c0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_i2c0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_dma: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_dma_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_dma_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_busfabric: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_busfabric_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_busfabric_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_busctrl: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_busctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_busctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_adc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_adc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_adc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_adc_adc: UInt32 {
                @inlinable @inline(__always) get {
                  clk_adc_adc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_adc_adc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_clocks: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_clocks_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_clocks_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = ENABLED0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var clk_sys_sram3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(clk_sys_sram3_Field.self, Bool.self)
                    return Bool(storage: self.raw.clk_sys_sram3)
                }
                }
              public var clk_sys_sram2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram2_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram2)
                }
              }
              public var clk_sys_sram1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram1)
                }
              }
              public var clk_sys_sram0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram0)
                }
              }
              public var clk_sys_spi1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_spi1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_spi1)
                }
              }
              public var clk_peri_spi1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_spi1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_spi1)
                }
              }
              public var clk_sys_spi0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_spi0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_spi0)
                }
              }
              public var clk_peri_spi0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_spi0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_spi0)
                }
              }
              public var clk_sys_sio: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sio_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sio)
                }
              }
              public var clk_sys_rtc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_rtc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_rtc)
                }
              }
              public var clk_rtc_rtc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_rtc_rtc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_rtc_rtc)
                }
              }
              public var clk_sys_rosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_rosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_rosc)
                }
              }
              public var clk_sys_rom: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_rom_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_rom)
                }
              }
              public var clk_sys_resets: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_resets_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_resets)
                }
              }
              public var clk_sys_pwm: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pwm_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pwm)
                }
              }
              public var clk_sys_psm: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_psm_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_psm)
                }
              }
              public var clk_sys_pll_usb: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pll_usb_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pll_usb)
                }
              }
              public var clk_sys_pll_sys: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pll_sys_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pll_sys)
                }
              }
              public var clk_sys_pio1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pio1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pio1)
                }
              }
              public var clk_sys_pio0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pio0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pio0)
                }
              }
              public var clk_sys_pads: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_pads_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_pads)
                }
              }
              public var clk_sys_vreg_and_chip_reset: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_vreg_and_chip_reset_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_vreg_and_chip_reset)
                }
              }
              public var clk_sys_jtag: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_jtag_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_jtag)
                }
              }
              public var clk_sys_io: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_io_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_io)
                }
              }
              public var clk_sys_i2c1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_i2c1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_i2c1)
                }
              }
              public var clk_sys_i2c0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_i2c0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_i2c0)
                }
              }
              public var clk_sys_dma: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_dma_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_dma)
                }
              }
              public var clk_sys_busfabric: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_busfabric_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_busfabric)
                }
              }
              public var clk_sys_busctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_busctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_busctrl)
                }
              }
              public var clk_sys_adc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_adc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_adc)
                }
              }
              public var clk_adc_adc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_adc_adc_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_adc_adc)
                }
              }
              public var clk_sys_clocks: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_clocks_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_clocks)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = ENABLED0_Descriptor
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

    /// indicates the state of the clock enable
    public var ENABLED1: Register<ENABLED1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b4))
          #endif
        }
    }
    public struct ENABLED1_Descriptor {
        @available(*, unavailable)
        public var clk_sys_xosc: clk_sys_xosc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_xip: clk_sys_xip_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_watchdog: clk_sys_watchdog_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_usb_usbctrl: clk_usb_usbctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_usbctrl: clk_sys_usbctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_uart1: clk_sys_uart1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_uart1: clk_peri_uart1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_uart0: clk_sys_uart0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_peri_uart0: clk_peri_uart0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_timer: clk_sys_timer_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_tbman: clk_sys_tbman_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sysinfo: clk_sys_sysinfo_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_syscfg: clk_sys_syscfg_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram5: clk_sys_sram5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clk_sys_sram4: clk_sys_sram4_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum clk_sys_xosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum clk_sys_xip_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum clk_sys_watchdog_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum clk_usb_usbctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum clk_sys_usbctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum clk_sys_uart1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum clk_peri_uart1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum clk_sys_uart0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum clk_peri_uart0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum clk_sys_timer_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum clk_sys_tbman_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum clk_sys_sysinfo_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum clk_sys_syscfg_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum clk_sys_sram5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum clk_sys_sram4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ENABLED1_Descriptor

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
                public var clk_sys_xosc: UInt32 {
                @inlinable @inline(__always) get {
                    clk_sys_xosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    clk_sys_xosc_Field.insert(newValue, into: &self.storage)
                }
                }
              public var clk_sys_xip: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_xip_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_xip_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_watchdog: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_watchdog_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_watchdog_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_usb_usbctrl: UInt32 {
                @inlinable @inline(__always) get {
                  clk_usb_usbctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_usb_usbctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_usbctrl: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_usbctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_usbctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_uart1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_uart1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_uart1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_uart1: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_uart1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_uart1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_uart0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_uart0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_uart0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_peri_uart0: UInt32 {
                @inlinable @inline(__always) get {
                  clk_peri_uart0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_peri_uart0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_timer: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_timer_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_timer_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_tbman: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_tbman_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_tbman_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sysinfo: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sysinfo_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sysinfo_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_syscfg: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_syscfg_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_syscfg_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram5: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clk_sys_sram4: UInt32 {
                @inlinable @inline(__always) get {
                  clk_sys_sram4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clk_sys_sram4_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = ENABLED1_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var clk_sys_xosc: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(clk_sys_xosc_Field.self, Bool.self)
                    return Bool(storage: self.raw.clk_sys_xosc)
                }
                }
              public var clk_sys_xip: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_xip_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_xip)
                }
              }
              public var clk_sys_watchdog: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_watchdog_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_watchdog)
                }
              }
              public var clk_usb_usbctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_usb_usbctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_usb_usbctrl)
                }
              }
              public var clk_sys_usbctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_usbctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_usbctrl)
                }
              }
              public var clk_sys_uart1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_uart1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_uart1)
                }
              }
              public var clk_peri_uart1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_uart1_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_uart1)
                }
              }
              public var clk_sys_uart0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_uart0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_uart0)
                }
              }
              public var clk_peri_uart0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_peri_uart0_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_peri_uart0)
                }
              }
              public var clk_sys_timer: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_timer_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_timer)
                }
              }
              public var clk_sys_tbman: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_tbman_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_tbman)
                }
              }
              public var clk_sys_sysinfo: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sysinfo_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sysinfo)
                }
              }
              public var clk_sys_syscfg: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_syscfg_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_syscfg)
                }
              }
              public var clk_sys_sram5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram5_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram5)
                }
              }
              public var clk_sys_sram4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clk_sys_sram4_Field.self, Bool.self)
                  return Bool(storage: self.raw.clk_sys_sram4)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = ENABLED1_Descriptor
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
          return .init(unsafeAddress: self.unsafeAddress + (0x00b8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b8))
          #endif
        }
    }
    public struct INTR_Descriptor {
        @available(*, unavailable)
        public var CLK_SYS_RESUS: CLK_SYS_RESUS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLK_SYS_RESUS_Field: ContiguousBitField {
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
                public var CLK_SYS_RESUS: UInt32 {
                @inlinable @inline(__always) get {
                    CLK_SYS_RESUS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLK_SYS_RESUS_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLK_SYS_RESUS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLK_SYS_RESUS_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLK_SYS_RESUS)
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
          return .init(unsafeAddress: self.unsafeAddress + (0x00bc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00bc))
          #endif
        }
    }
    public struct INTE_Descriptor {
        @available(*, unavailable)
        public var CLK_SYS_RESUS: CLK_SYS_RESUS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLK_SYS_RESUS_Field: ContiguousBitField {
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
                public var CLK_SYS_RESUS: UInt32 {
                @inlinable @inline(__always) get {
                    CLK_SYS_RESUS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLK_SYS_RESUS_Field.insert(newValue, into: &self.storage)
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
                public var CLK_SYS_RESUS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLK_SYS_RESUS_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLK_SYS_RESUS)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CLK_SYS_RESUS_Field.self, Bool.self)
                    self.raw.CLK_SYS_RESUS = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt Force
    public var INTF: Register<INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c0))
          #endif
        }
    }
    public struct INTF_Descriptor {
        @available(*, unavailable)
        public var CLK_SYS_RESUS: CLK_SYS_RESUS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLK_SYS_RESUS_Field: ContiguousBitField {
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
                public var CLK_SYS_RESUS: UInt32 {
                @inlinable @inline(__always) get {
                    CLK_SYS_RESUS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLK_SYS_RESUS_Field.insert(newValue, into: &self.storage)
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
                public var CLK_SYS_RESUS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLK_SYS_RESUS_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLK_SYS_RESUS)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CLK_SYS_RESUS_Field.self, Bool.self)
                    self.raw.CLK_SYS_RESUS = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt status after masking & forcing
    public var INTS: Register<INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c4))
          #endif
        }
    }
    public struct INTS_Descriptor {
        @available(*, unavailable)
        public var CLK_SYS_RESUS: CLK_SYS_RESUS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLK_SYS_RESUS_Field: ContiguousBitField {
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
                public var CLK_SYS_RESUS: UInt32 {
                @inlinable @inline(__always) get {
                    CLK_SYS_RESUS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLK_SYS_RESUS_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLK_SYS_RESUS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLK_SYS_RESUS_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLK_SYS_RESUS)
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

extension CLOCKS.CLK_GPOUT0_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT0_DIV_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT0_SELECTED_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT1_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT1_DIV_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT1_SELECTED_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT2_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT2_DIV_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT2_SELECTED_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT3_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT3_DIV_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_GPOUT3_SELECTED_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_REF_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_REF_DIV_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_REF_SELECTED_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_SYS_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_SYS_DIV_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_SYS_SELECTED_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_PERI_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_PERI_SELECTED_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_USB_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_USB_DIV_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_USB_SELECTED_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_ADC_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_ADC_DIV_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_ADC_SELECTED_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_RTC_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_RTC_DIV_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_RTC_SELECTED_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_SYS_RESUS_CTRL_Descriptor: RegisterValue {
}

extension CLOCKS.CLK_SYS_RESUS_STATUS_Descriptor: RegisterValue {
}

extension CLOCKS.FC0_REF_KHZ_Descriptor: RegisterValue {
}

extension CLOCKS.FC0_MIN_KHZ_Descriptor: RegisterValue {
}

extension CLOCKS.FC0_MAX_KHZ_Descriptor: RegisterValue {
}

extension CLOCKS.FC0_DELAY_Descriptor: RegisterValue {
}

extension CLOCKS.FC0_INTERVAL_Descriptor: RegisterValue {
}

extension CLOCKS.FC0_SRC_Descriptor: RegisterValue {
}

extension CLOCKS.FC0_STATUS_Descriptor: RegisterValue {
}

extension CLOCKS.FC0_RESULT_Descriptor: RegisterValue {
}

extension CLOCKS.WAKE_EN0_Descriptor: RegisterValue {
}

extension CLOCKS.WAKE_EN1_Descriptor: RegisterValue {
}

extension CLOCKS.SLEEP_EN0_Descriptor: RegisterValue {
}

extension CLOCKS.SLEEP_EN1_Descriptor: RegisterValue {
}

extension CLOCKS.ENABLED0_Descriptor: RegisterValue {
}

extension CLOCKS.ENABLED1_Descriptor: RegisterValue {
}

extension CLOCKS.INTR_Descriptor: RegisterValue {
}

extension CLOCKS.INTE_Descriptor: RegisterValue {
}

extension CLOCKS.INTF_Descriptor: RegisterValue {
}

extension CLOCKS.INTS_Descriptor: RegisterValue {
}
