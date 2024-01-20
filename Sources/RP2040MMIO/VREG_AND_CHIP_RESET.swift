import MMIO
import MMIOExtensions

/// control and status for on-chip voltage regulator and chip level reset subsystem
public struct VREG_AND_CHIP_RESET {

    public static var `default`: Self { .init(unsafeAddress: 0x40064000) }

    /// Voltage regulator control and status
    public var VREG: Register<VREG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct VREG_Descriptor {
        @available(*, unavailable)
        /// regulation status
        /// 0=not in regulation, 1=in regulation
        public var ROK: ROK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output voltage select
        /// 0000 to 0101 - 0.80V
        /// 0110         - 0.85V
        /// 0111         - 0.90V
        /// 1000         - 0.95V
        /// 1001         - 1.00V
        /// 1010         - 1.05V
        /// 1011         - 1.10V (default)
        /// 1100         - 1.15V
        /// 1101         - 1.20V
        /// 1110         - 1.25V
        /// 1111         - 1.30V
        public var VSEL: VSEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// high impedance mode select
        /// 0=not in high impedance mode, 1=in high impedance mode
        public var HIZ: HIZ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// enable
        /// 0=not enabled, 1=enabled
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ROK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum VSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 8
        }

        public enum HIZ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = VREG_Descriptor

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
                public var ROK: UInt32 {
                @inlinable @inline(__always) get {
                    ROK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ROK_Field.insert(newValue, into: &self.storage)
                }
                }
              public var VSEL: UInt32 {
                @inlinable @inline(__always) get {
                  VSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VSEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIZ: UInt32 {
                @inlinable @inline(__always) get {
                  HIZ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIZ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = VREG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var ROK: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ROK_Field.self, Bool.self)
                    return Bool(storage: self.raw.ROK)
                }
                }
              public var VSEL: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VSEL_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.VSEL)
                }
              }
              public var HIZ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIZ_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIZ)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = VREG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var VSEL: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(VSEL_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.VSEL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(VSEL_Field.self, BitField4.self)
                    self.raw.VSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var HIZ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIZ_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIZ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIZ_Field.self, Bool.self)
                  self.raw.HIZ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  self.raw.EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// brown-out detection control
    public var BOD: Register<BOD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct BOD_Descriptor {
        @available(*, unavailable)
        /// threshold select
        /// 0000 - 0.473V
        /// 0001 - 0.516V
        /// 0010 - 0.559V
        /// 0011 - 0.602V
        /// 0100 - 0.645V
        /// 0101 - 0.688V
        /// 0110 - 0.731V
        /// 0111 - 0.774V
        /// 1000 - 0.817V
        /// 1001 - 0.860V (default)
        /// 1010 - 0.903V
        /// 1011 - 0.946V
        /// 1100 - 0.989V
        /// 1101 - 1.032V
        /// 1110 - 1.075V
        /// 1111 - 1.118V
        public var VSEL: VSEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// enable
        /// 0=not enabled, 1=enabled
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum VSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 8
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = BOD_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var VSEL: UInt32 {
                @inlinable @inline(__always) get {
                    VSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    VSEL_Field.insert(newValue, into: &self.storage)
                }
                }
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = BOD_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var VSEL: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(VSEL_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.VSEL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(VSEL_Field.self, BitField4.self)
                    self.raw.VSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  self.raw.EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Chip reset control and status
    public var CHIP_RESET: Register<CHIP_RESET_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct CHIP_RESET_Descriptor {
        @available(*, unavailable)
        /// This is set by psm_restart from the debugger.
        /// Its purpose is to branch bootcode to a safe mode when the debugger has issued a psm_restart in order to recover from a boot lock-up.
        /// In the safe mode the debugger can repair the boot code, clear this flag then reboot the processor.
        public var PSM_RESTART_FLAG: PSM_RESTART_FLAG_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Last reset was from the debug port
        public var HAD_PSM_RESTART: HAD_PSM_RESTART_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Last reset was from the RUN pin
        public var HAD_RUN: HAD_RUN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Last reset was from the power-on reset or brown-out detection blocks
        public var HAD_POR: HAD_POR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PSM_RESTART_FLAG_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum HAD_PSM_RESTART_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum HAD_RUN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum HAD_POR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CHIP_RESET_Descriptor

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
                public var PSM_RESTART_FLAG: UInt32 {
                @inlinable @inline(__always) get {
                    PSM_RESTART_FLAG_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PSM_RESTART_FLAG_Field.insert(newValue, into: &self.storage)
                }
                }
              public var HAD_PSM_RESTART: UInt32 {
                @inlinable @inline(__always) get {
                  HAD_PSM_RESTART_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HAD_PSM_RESTART_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HAD_RUN: UInt32 {
                @inlinable @inline(__always) get {
                  HAD_RUN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HAD_RUN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HAD_POR: UInt32 {
                @inlinable @inline(__always) get {
                  HAD_POR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HAD_POR_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = CHIP_RESET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var PSM_RESTART_FLAG: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PSM_RESTART_FLAG_Field.self, Bool.self)
                    return Bool(storage: self.raw.PSM_RESTART_FLAG)
                }
                }
              public var HAD_PSM_RESTART: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HAD_PSM_RESTART_Field.self, Bool.self)
                  return Bool(storage: self.raw.HAD_PSM_RESTART)
                }
              }
              public var HAD_RUN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HAD_RUN_Field.self, Bool.self)
                  return Bool(storage: self.raw.HAD_RUN)
                }
              }
              public var HAD_POR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HAD_POR_Field.self, Bool.self)
                  return Bool(storage: self.raw.HAD_POR)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = CHIP_RESET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var PSM_RESTART_FLAG: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PSM_RESTART_FLAG_Field.self, Bool.self)
                    return Bool(storage: self.raw.PSM_RESTART_FLAG)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PSM_RESTART_FLAG_Field.self, Bool.self)
                    self.raw.PSM_RESTART_FLAG = newValue.storage(Self.Value.Raw.Storage.self)
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

extension VREG_AND_CHIP_RESET.VREG_Descriptor: RegisterValue {
}

extension VREG_AND_CHIP_RESET.BOD_Descriptor: RegisterValue {
}

extension VREG_AND_CHIP_RESET.CHIP_RESET_Descriptor: RegisterValue {
}
