import MMIO
import MMIOExtensions

/// Register block for various chip control signals
public struct SYSCFG {

    public static var `default`: Self { .init(unsafeAddress: 0x40004000) }

    /// Processor core 0 NMI source mask
    /// Set a bit high to enable NMI from that IRQ
    public var PROC0_NMI_MASK: Register<PROC0_NMI_MASK_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct PROC0_NMI_MASK_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC0_NMI_MASK_Descriptor

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

                    public  typealias Value = PROC0_NMI_MASK_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Processor core 1 NMI source mask
    /// Set a bit high to enable NMI from that IRQ
    public var PROC1_NMI_MASK: Register<PROC1_NMI_MASK_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct PROC1_NMI_MASK_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC1_NMI_MASK_Descriptor

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

                    public  typealias Value = PROC1_NMI_MASK_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Configuration for processors
    public var PROC_CONFIG: Register<PROC_CONFIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct PROC_CONFIG_Descriptor {
        @available(*, unavailable)
        /// Configure proc1 DAP instance ID.
        /// Recommend that this is NOT changed until you require debug access in multi-chip environment
        /// WARNING: do not set to 15 as this is reserved for RescueDP
        public var PROC1_DAP_INSTID: PROC1_DAP_INSTID_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Configure proc0 DAP instance ID.
        /// Recommend that this is NOT changed until you require debug access in multi-chip environment
        /// WARNING: do not set to 15 as this is reserved for RescueDP
        public var PROC0_DAP_INSTID: PROC0_DAP_INSTID_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indication that proc1 has halted
        public var PROC1_HALTED: PROC1_HALTED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indication that proc0 has halted
        public var PROC0_HALTED: PROC0_HALTED_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PROC1_DAP_INSTID_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 32
        }

        public enum PROC0_DAP_INSTID_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 28
        }

        public enum PROC1_HALTED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum PROC0_HALTED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC_CONFIG_Descriptor

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
                public var PROC1_DAP_INSTID: UInt32 {
                @inlinable @inline(__always) get {
                    PROC1_DAP_INSTID_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PROC1_DAP_INSTID_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PROC0_DAP_INSTID: UInt32 {
                @inlinable @inline(__always) get {
                  PROC0_DAP_INSTID_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC0_DAP_INSTID_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PROC1_HALTED: UInt32 {
                @inlinable @inline(__always) get {
                  PROC1_HALTED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC1_HALTED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PROC0_HALTED: UInt32 {
                @inlinable @inline(__always) get {
                  PROC0_HALTED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC0_HALTED_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = PROC_CONFIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var PROC1_DAP_INSTID: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PROC1_DAP_INSTID_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.PROC1_DAP_INSTID)
                }
                }
              public var PROC0_DAP_INSTID: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_DAP_INSTID_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.PROC0_DAP_INSTID)
                }
              }
              public var PROC1_HALTED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC1_HALTED_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC1_HALTED)
                }
              }
              public var PROC0_HALTED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_HALTED_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC0_HALTED)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = PROC_CONFIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var PROC1_DAP_INSTID: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PROC1_DAP_INSTID_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.PROC1_DAP_INSTID)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PROC1_DAP_INSTID_Field.self, BitField4.self)
                    self.raw.PROC1_DAP_INSTID = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PROC0_DAP_INSTID: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_DAP_INSTID_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.PROC0_DAP_INSTID)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PROC0_DAP_INSTID_Field.self, BitField4.self)
                  self.raw.PROC0_DAP_INSTID = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// For each bit, if 1, bypass the input synchronizer between that GPIO
    /// and the GPIO input register in the SIO. The input synchronizers should
    /// generally be unbypassed, to avoid injecting metastabilities into processors.
    /// If you're feeling brave, you can bypass to save two cycles of input
    /// latency. This register applies to GPIO 0...29.
    public var PROC_IN_SYNC_BYPASS: Register<PROC_IN_SYNC_BYPASS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct PROC_IN_SYNC_BYPASS_Descriptor {
        @available(*, unavailable)
        public var PROC_IN_SYNC_BYPASS: PROC_IN_SYNC_BYPASS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PROC_IN_SYNC_BYPASS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 30
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC_IN_SYNC_BYPASS_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PROC_IN_SYNC_BYPASS: UInt32 {
                @inlinable @inline(__always) get {
                    PROC_IN_SYNC_BYPASS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PROC_IN_SYNC_BYPASS_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PROC_IN_SYNC_BYPASS_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PROC_IN_SYNC_BYPASS: BitField30 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PROC_IN_SYNC_BYPASS_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.PROC_IN_SYNC_BYPASS)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PROC_IN_SYNC_BYPASS_Field.self, BitField30.self)
                    self.raw.PROC_IN_SYNC_BYPASS = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// For each bit, if 1, bypass the input synchronizer between that GPIO
    /// and the GPIO input register in the SIO. The input synchronizers should
    /// generally be unbypassed, to avoid injecting metastabilities into processors.
    /// If you're feeling brave, you can bypass to save two cycles of input
    /// latency. This register applies to GPIO 30...35 (the QSPI IOs).
    public var PROC_IN_SYNC_BYPASS_HI: Register<PROC_IN_SYNC_BYPASS_HI_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct PROC_IN_SYNC_BYPASS_HI_Descriptor {
        @available(*, unavailable)
        public var PROC_IN_SYNC_BYPASS_HI: PROC_IN_SYNC_BYPASS_HI_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PROC_IN_SYNC_BYPASS_HI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC_IN_SYNC_BYPASS_HI_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PROC_IN_SYNC_BYPASS_HI: UInt32 {
                @inlinable @inline(__always) get {
                    PROC_IN_SYNC_BYPASS_HI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PROC_IN_SYNC_BYPASS_HI_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PROC_IN_SYNC_BYPASS_HI_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PROC_IN_SYNC_BYPASS_HI: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PROC_IN_SYNC_BYPASS_HI_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.PROC_IN_SYNC_BYPASS_HI)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PROC_IN_SYNC_BYPASS_HI_Field.self, BitField6.self)
                    self.raw.PROC_IN_SYNC_BYPASS_HI = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Directly control the SWD debug port of either processor
    public var DBGFORCE: Register<DBGFORCE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct DBGFORCE_Descriptor {
        @available(*, unavailable)
        /// Attach processor 1 debug port to syscfg controls, and disconnect it from external SWD pads.
        public var PROC1_ATTACH: PROC1_ATTACH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Directly drive processor 1 SWCLK, if PROC1_ATTACH is set
        public var PROC1_SWCLK: PROC1_SWCLK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Directly drive processor 1 SWDIO input, if PROC1_ATTACH is set
        public var PROC1_SWDI: PROC1_SWDI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Observe the value of processor 1 SWDIO output.
        public var PROC1_SWDO: PROC1_SWDO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Attach processor 0 debug port to syscfg controls, and disconnect it from external SWD pads.
        public var PROC0_ATTACH: PROC0_ATTACH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Directly drive processor 0 SWCLK, if PROC0_ATTACH is set
        public var PROC0_SWCLK: PROC0_SWCLK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Directly drive processor 0 SWDIO input, if PROC0_ATTACH is set
        public var PROC0_SWDI: PROC0_SWDI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Observe the value of processor 0 SWDIO output.
        public var PROC0_SWDO: PROC0_SWDO_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PROC1_ATTACH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum PROC1_SWCLK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum PROC1_SWDI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum PROC1_SWDO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum PROC0_ATTACH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum PROC0_SWCLK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PROC0_SWDI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum PROC0_SWDO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DBGFORCE_Descriptor

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
                public var PROC1_ATTACH: UInt32 {
                @inlinable @inline(__always) get {
                    PROC1_ATTACH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PROC1_ATTACH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PROC1_SWCLK: UInt32 {
                @inlinable @inline(__always) get {
                  PROC1_SWCLK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC1_SWCLK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PROC1_SWDI: UInt32 {
                @inlinable @inline(__always) get {
                  PROC1_SWDI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC1_SWDI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PROC1_SWDO: UInt32 {
                @inlinable @inline(__always) get {
                  PROC1_SWDO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC1_SWDO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PROC0_ATTACH: UInt32 {
                @inlinable @inline(__always) get {
                  PROC0_ATTACH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC0_ATTACH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PROC0_SWCLK: UInt32 {
                @inlinable @inline(__always) get {
                  PROC0_SWCLK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC0_SWCLK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PROC0_SWDI: UInt32 {
                @inlinable @inline(__always) get {
                  PROC0_SWDI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC0_SWDI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PROC0_SWDO: UInt32 {
                @inlinable @inline(__always) get {
                  PROC0_SWDO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC0_SWDO_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = DBGFORCE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var PROC1_ATTACH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PROC1_ATTACH_Field.self, Bool.self)
                    return Bool(storage: self.raw.PROC1_ATTACH)
                }
                }
              public var PROC1_SWCLK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC1_SWCLK_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC1_SWCLK)
                }
              }
              public var PROC1_SWDI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC1_SWDI_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC1_SWDI)
                }
              }
              public var PROC1_SWDO: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC1_SWDO_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC1_SWDO)
                }
              }
              public var PROC0_ATTACH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_ATTACH_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC0_ATTACH)
                }
              }
              public var PROC0_SWCLK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_SWCLK_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC0_SWCLK)
                }
              }
              public var PROC0_SWDI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_SWDI_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC0_SWDI)
                }
              }
              public var PROC0_SWDO: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_SWDO_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC0_SWDO)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = DBGFORCE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var PROC1_ATTACH: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PROC1_ATTACH_Field.self, Bool.self)
                    return Bool(storage: self.raw.PROC1_ATTACH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PROC1_ATTACH_Field.self, Bool.self)
                    self.raw.PROC1_ATTACH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PROC1_SWCLK: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC1_SWCLK_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC1_SWCLK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PROC1_SWCLK_Field.self, Bool.self)
                  self.raw.PROC1_SWCLK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PROC1_SWDI: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC1_SWDI_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC1_SWDI)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PROC1_SWDI_Field.self, Bool.self)
                  self.raw.PROC1_SWDI = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PROC0_ATTACH: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_ATTACH_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC0_ATTACH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PROC0_ATTACH_Field.self, Bool.self)
                  self.raw.PROC0_ATTACH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PROC0_SWCLK: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_SWCLK_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC0_SWCLK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PROC0_SWCLK_Field.self, Bool.self)
                  self.raw.PROC0_SWCLK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PROC0_SWDI: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_SWDI_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC0_SWDI)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PROC0_SWDI_Field.self, Bool.self)
                  self.raw.PROC0_SWDI = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Control power downs to memories. Set high to power down memories.
    /// Use with extreme caution
    public var MEMPOWERDOWN: Register<MEMPOWERDOWN_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct MEMPOWERDOWN_Descriptor {
        @available(*, unavailable)
        public var ROM: ROM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var USB: USB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SRAM5: SRAM5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SRAM4: SRAM4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SRAM3: SRAM3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SRAM2: SRAM2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SRAM1: SRAM1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SRAM0: SRAM0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ROM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum USB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum SRAM5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum SRAM4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum SRAM3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum SRAM2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SRAM1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SRAM0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = MEMPOWERDOWN_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var ROM: UInt32 {
                @inlinable @inline(__always) get {
                    ROM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ROM_Field.insert(newValue, into: &self.storage)
                }
                }
              public var USB: UInt32 {
                @inlinable @inline(__always) get {
                  USB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  USB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SRAM5: UInt32 {
                @inlinable @inline(__always) get {
                  SRAM5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SRAM5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SRAM4: UInt32 {
                @inlinable @inline(__always) get {
                  SRAM4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SRAM4_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SRAM3: UInt32 {
                @inlinable @inline(__always) get {
                  SRAM3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SRAM3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SRAM2: UInt32 {
                @inlinable @inline(__always) get {
                  SRAM2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SRAM2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SRAM1: UInt32 {
                @inlinable @inline(__always) get {
                  SRAM1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SRAM1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SRAM0: UInt32 {
                @inlinable @inline(__always) get {
                  SRAM0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SRAM0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = MEMPOWERDOWN_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var ROM: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ROM_Field.self, Bool.self)
                    return Bool(storage: self.raw.ROM)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ROM_Field.self, Bool.self)
                    self.raw.ROM = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var USB: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(USB_Field.self, Bool.self)
                  return Bool(storage: self.raw.USB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(USB_Field.self, Bool.self)
                  self.raw.USB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SRAM5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SRAM5_Field.self, Bool.self)
                  return Bool(storage: self.raw.SRAM5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SRAM5_Field.self, Bool.self)
                  self.raw.SRAM5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SRAM4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SRAM4_Field.self, Bool.self)
                  return Bool(storage: self.raw.SRAM4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SRAM4_Field.self, Bool.self)
                  self.raw.SRAM4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SRAM3: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SRAM3_Field.self, Bool.self)
                  return Bool(storage: self.raw.SRAM3)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SRAM3_Field.self, Bool.self)
                  self.raw.SRAM3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SRAM2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SRAM2_Field.self, Bool.self)
                  return Bool(storage: self.raw.SRAM2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SRAM2_Field.self, Bool.self)
                  self.raw.SRAM2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SRAM1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SRAM1_Field.self, Bool.self)
                  return Bool(storage: self.raw.SRAM1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SRAM1_Field.self, Bool.self)
                  self.raw.SRAM1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SRAM0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SRAM0_Field.self, Bool.self)
                  return Bool(storage: self.raw.SRAM0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SRAM0_Field.self, Bool.self)
                  self.raw.SRAM0 = newValue.storage(Self.Value.Raw.Storage.self)
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

extension SYSCFG.PROC0_NMI_MASK_Descriptor: RegisterValue {
}

extension SYSCFG.PROC1_NMI_MASK_Descriptor: RegisterValue {
}

extension SYSCFG.PROC_CONFIG_Descriptor: RegisterValue {
}

extension SYSCFG.PROC_IN_SYNC_BYPASS_Descriptor: RegisterValue {
}

extension SYSCFG.PROC_IN_SYNC_BYPASS_HI_Descriptor: RegisterValue {
}

extension SYSCFG.DBGFORCE_Descriptor: RegisterValue {
}

extension SYSCFG.MEMPOWERDOWN_Descriptor: RegisterValue {
}
