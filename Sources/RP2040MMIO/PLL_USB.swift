import MMIO
import MMIOExtensions
public struct PLL_USB {

    public static var `default`: Self { .init(unsafeAddress: 0x4002c000) }

    /// Control and Status
    /// GENERAL CONSTRAINTS:
    /// Reference clock frequency min=5MHz, max=800MHz
    /// Feedback divider min=16, max=320
    /// VCO frequency min=750MHz, max=1600MHz
    public var CS: Register<CS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CS_Descriptor {
        @available(*, unavailable)
        /// PLL is locked
        public var LOCK: LOCK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Passes the reference clock to the output instead of the divided VCO. The VCO continues to run so the user can switch between the reference clock and the divided VCO but the output will glitch when doing so.
        public var BYPASS: BYPASS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Divides the PLL input reference clock.
        /// Behaviour is undefined for div=0.
        /// PLL output will be unpredictable during refdiv changes, wait for lock=1 before using it.
        public var REFDIV: REFDIV_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum LOCK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum BYPASS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum REFDIV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CS_Descriptor

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
                public var LOCK: UInt32 {
                @inlinable @inline(__always) get {
                    LOCK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    LOCK_Field.insert(newValue, into: &self.storage)
                }
                }
              public var BYPASS: UInt32 {
                @inlinable @inline(__always) get {
                  BYPASS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BYPASS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var REFDIV: UInt32 {
                @inlinable @inline(__always) get {
                  REFDIV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  REFDIV_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = CS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var LOCK: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(LOCK_Field.self, Bool.self)
                    return Bool(storage: self.raw.LOCK)
                }
                }
              public var BYPASS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BYPASS_Field.self, Bool.self)
                  return Bool(storage: self.raw.BYPASS)
                }
              }
              public var REFDIV: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(REFDIV_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.REFDIV)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = CS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var BYPASS: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(BYPASS_Field.self, Bool.self)
                    return Bool(storage: self.raw.BYPASS)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(BYPASS_Field.self, Bool.self)
                    self.raw.BYPASS = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var REFDIV: BitField6 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(REFDIV_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.REFDIV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(REFDIV_Field.self, BitField6.self)
                  self.raw.REFDIV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Controls the PLL power modes.
    public var PWR: Register<PWR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct PWR_Descriptor {
        @available(*, unavailable)
        /// PLL VCO powerdown
        /// To save power set high when PLL output not required or bypass=1.
        public var VCOPD: VCOPD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// PLL post divider powerdown
        /// To save power set high when PLL output not required or bypass=1.
        public var POSTDIVPD: POSTDIVPD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// PLL DSM powerdown
        /// Nothing is achieved by setting this low.
        public var DSMPD: DSMPD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// PLL powerdown
        /// To save power set high when PLL output not required.
        public var PD: PD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum VCOPD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum POSTDIVPD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum DSMPD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PWR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var VCOPD: UInt32 {
                @inlinable @inline(__always) get {
                    VCOPD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    VCOPD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var POSTDIVPD: UInt32 {
                @inlinable @inline(__always) get {
                  POSTDIVPD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  POSTDIVPD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DSMPD: UInt32 {
                @inlinable @inline(__always) get {
                  DSMPD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DSMPD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PD: UInt32 {
                @inlinable @inline(__always) get {
                  PD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PD_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PWR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var VCOPD: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(VCOPD_Field.self, Bool.self)
                    return Bool(storage: self.raw.VCOPD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(VCOPD_Field.self, Bool.self)
                    self.raw.VCOPD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var POSTDIVPD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(POSTDIVPD_Field.self, Bool.self)
                  return Bool(storage: self.raw.POSTDIVPD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(POSTDIVPD_Field.self, Bool.self)
                  self.raw.POSTDIVPD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DSMPD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DSMPD_Field.self, Bool.self)
                  return Bool(storage: self.raw.DSMPD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DSMPD_Field.self, Bool.self)
                  self.raw.DSMPD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PD_Field.self, Bool.self)
                  return Bool(storage: self.raw.PD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PD_Field.self, Bool.self)
                  self.raw.PD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Feedback divisor
    /// (note: this PLL does not support fractional division)
    public var FBDIV_INT: Register<FBDIV_INT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct FBDIV_INT_Descriptor {
        @available(*, unavailable)
        /// see ctrl reg description for constraints
        public var FBDIV_INT: FBDIV_INT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FBDIV_INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 12
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FBDIV_INT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FBDIV_INT: UInt32 {
                @inlinable @inline(__always) get {
                    FBDIV_INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FBDIV_INT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FBDIV_INT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FBDIV_INT: BitField12 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FBDIV_INT_Field.self, BitField12.self)
                    return BitField12(storage: self.raw.FBDIV_INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FBDIV_INT_Field.self, BitField12.self)
                    self.raw.FBDIV_INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Controls the PLL post dividers for the primary output
    /// (note: this PLL does not have a secondary output)
    /// the primary output is driven from VCO divided by postdiv1*postdiv2
    public var PRIM: Register<PRIM_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct PRIM_Descriptor {
        @available(*, unavailable)
        /// divide by 1-7
        public var POSTDIV1: POSTDIV1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// divide by 1-7
        public var POSTDIV2: POSTDIV2_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum POSTDIV1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 19
        }

        public enum POSTDIV2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 15
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PRIM_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var POSTDIV1: UInt32 {
                @inlinable @inline(__always) get {
                    POSTDIV1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    POSTDIV1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var POSTDIV2: UInt32 {
                @inlinable @inline(__always) get {
                  POSTDIV2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  POSTDIV2_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PRIM_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var POSTDIV1: BitField3 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(POSTDIV1_Field.self, BitField3.self)
                    return BitField3(storage: self.raw.POSTDIV1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(POSTDIV1_Field.self, BitField3.self)
                    self.raw.POSTDIV1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var POSTDIV2: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(POSTDIV2_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.POSTDIV2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(POSTDIV2_Field.self, BitField3.self)
                  self.raw.POSTDIV2 = newValue.storage(Self.Value.Raw.Storage.self)
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

extension PLL_USB.CS_Descriptor: RegisterValue {
}

extension PLL_USB.PWR_Descriptor: RegisterValue {
}

extension PLL_USB.FBDIV_INT_Descriptor: RegisterValue {
}

extension PLL_USB.PRIM_Descriptor: RegisterValue {
}
