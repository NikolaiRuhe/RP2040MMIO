import MMIO
import MMIOExtensions

/// Register block for busfabric control signals and performance counters
public struct BUSCTRL {

    public static var `default`: Self { .init(unsafeAddress: 0x40030000) }

    /// Set the priority of each master for bus arbitration.
    public var BUS_PRIORITY: Register<BUS_PRIORITY_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct BUS_PRIORITY_Descriptor {
        @available(*, unavailable)
        /// 0 - low priority, 1 - high priority
        public var DMA_W: DMA_W_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 0 - low priority, 1 - high priority
        public var DMA_R: DMA_R_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 0 - low priority, 1 - high priority
        public var PROC1: PROC1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 0 - low priority, 1 - high priority
        public var PROC0: PROC0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DMA_W_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum DMA_R_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum PROC1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum PROC0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = BUS_PRIORITY_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DMA_W: UInt32 {
                @inlinable @inline(__always) get {
                    DMA_W_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DMA_W_Field.insert(newValue, into: &self.storage)
                }
                }
              public var DMA_R: UInt32 {
                @inlinable @inline(__always) get {
                  DMA_R_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DMA_R_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PROC1: UInt32 {
                @inlinable @inline(__always) get {
                  PROC1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PROC0: UInt32 {
                @inlinable @inline(__always) get {
                  PROC0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PROC0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = BUS_PRIORITY_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DMA_W: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DMA_W_Field.self, Bool.self)
                    return Bool(storage: self.raw.DMA_W)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DMA_W_Field.self, Bool.self)
                    self.raw.DMA_W = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var DMA_R: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DMA_R_Field.self, Bool.self)
                  return Bool(storage: self.raw.DMA_R)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DMA_R_Field.self, Bool.self)
                  self.raw.DMA_R = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PROC1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PROC1_Field.self, Bool.self)
                  self.raw.PROC1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PROC0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PROC0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PROC0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PROC0_Field.self, Bool.self)
                  self.raw.PROC0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Bus priority acknowledge
    public var BUS_PRIORITY_ACK: Register<BUS_PRIORITY_ACK_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct BUS_PRIORITY_ACK_Descriptor {
        @available(*, unavailable)
        /// Goes to 1 once all arbiters have registered the new global priority levels.
        /// Arbiters update their local priority when servicing a new nonsequential access.
        /// In normal circumstances this will happen almost immediately.
        public var BUS_PRIORITY_ACK: BUS_PRIORITY_ACK_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum BUS_PRIORITY_ACK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = BUS_PRIORITY_ACK_Descriptor

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
                public var BUS_PRIORITY_ACK: UInt32 {
                @inlinable @inline(__always) get {
                    BUS_PRIORITY_ACK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    BUS_PRIORITY_ACK_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = BUS_PRIORITY_ACK_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var BUS_PRIORITY_ACK: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(BUS_PRIORITY_ACK_Field.self, Bool.self)
                    return Bool(storage: self.raw.BUS_PRIORITY_ACK)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = BUS_PRIORITY_ACK_Descriptor
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

    /// Bus fabric performance counter 0
    public var PERFCTR0: Register<PERFCTR0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct PERFCTR0_Descriptor {
        @available(*, unavailable)
        /// Busfabric saturating performance counter 0
        /// Count some event signal from the busfabric arbiters.
        /// Write any value to clear. Select an event to count using PERFSEL0
        public var PERFCTR0: PERFCTR0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PERFCTR0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PERFCTR0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PERFCTR0: UInt32 {
                @inlinable @inline(__always) get {
                    PERFCTR0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PERFCTR0_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PERFCTR0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PERFCTR0: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PERFCTR0_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.PERFCTR0)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PERFCTR0_Field.self, BitField24.self)
                    self.raw.PERFCTR0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Bus fabric performance event select for PERFCTR0
    public var PERFSEL0: Register<PERFSEL0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct PERFSEL0_Descriptor {
        @available(*, unavailable)
        /// Select an event for PERFCTR0. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        public var PERFSEL0: PERFSEL0_Field {
            get {
                fatalError()
            }
        }

        public enum PERFSEL0_Values: UInt, BitFieldProjectable {
            case PERFSEL0_apb_contested = 0
            case PERFSEL0_apb = 1
            case PERFSEL0_fastperi_contested = 2
            case PERFSEL0_fastperi = 3
            case PERFSEL0_sram5_contested = 4
            case PERFSEL0_sram5 = 5
            case PERFSEL0_sram4_contested = 6
            case PERFSEL0_sram4 = 7
            case PERFSEL0_sram3_contested = 8
            case PERFSEL0_sram3 = 9
            case PERFSEL0_sram2_contested = 10
            case PERFSEL0_sram2 = 11
            case PERFSEL0_sram1_contested = 12
            case PERFSEL0_sram1 = 13
            case PERFSEL0_sram0_contested = 14
            case PERFSEL0_sram0 = 15
            case PERFSEL0_xip_main_contested = 16
            case PERFSEL0_xip_main = 17
            case PERFSEL0_rom_contested = 18
            case PERFSEL0_rom = 19

            public static var bitWidth: Int { 5 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PERFSEL0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PERFSEL0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PERFSEL0: UInt32 {
                @inlinable @inline(__always) get {
                    PERFSEL0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PERFSEL0_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PERFSEL0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PERFSEL0: PERFSEL0_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PERFSEL0_Field.self, PERFSEL0_Values.self)
                    return PERFSEL0_Values(storage: self.raw.PERFSEL0)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PERFSEL0_Field.self, PERFSEL0_Values.self)
                    self.raw.PERFSEL0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Bus fabric performance counter 1
    public var PERFCTR1: Register<PERFCTR1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct PERFCTR1_Descriptor {
        @available(*, unavailable)
        /// Busfabric saturating performance counter 1
        /// Count some event signal from the busfabric arbiters.
        /// Write any value to clear. Select an event to count using PERFSEL1
        public var PERFCTR1: PERFCTR1_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PERFCTR1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PERFCTR1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PERFCTR1: UInt32 {
                @inlinable @inline(__always) get {
                    PERFCTR1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PERFCTR1_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PERFCTR1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PERFCTR1: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PERFCTR1_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.PERFCTR1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PERFCTR1_Field.self, BitField24.self)
                    self.raw.PERFCTR1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Bus fabric performance event select for PERFCTR1
    public var PERFSEL1: Register<PERFSEL1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct PERFSEL1_Descriptor {
        @available(*, unavailable)
        /// Select an event for PERFCTR1. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        public var PERFSEL1: PERFSEL1_Field {
            get {
                fatalError()
            }
        }

        public enum PERFSEL1_Values: UInt, BitFieldProjectable {
            case PERFSEL1_apb_contested = 0
            case PERFSEL1_apb = 1
            case PERFSEL1_fastperi_contested = 2
            case PERFSEL1_fastperi = 3
            case PERFSEL1_sram5_contested = 4
            case PERFSEL1_sram5 = 5
            case PERFSEL1_sram4_contested = 6
            case PERFSEL1_sram4 = 7
            case PERFSEL1_sram3_contested = 8
            case PERFSEL1_sram3 = 9
            case PERFSEL1_sram2_contested = 10
            case PERFSEL1_sram2 = 11
            case PERFSEL1_sram1_contested = 12
            case PERFSEL1_sram1 = 13
            case PERFSEL1_sram0_contested = 14
            case PERFSEL1_sram0 = 15
            case PERFSEL1_xip_main_contested = 16
            case PERFSEL1_xip_main = 17
            case PERFSEL1_rom_contested = 18
            case PERFSEL1_rom = 19

            public static var bitWidth: Int { 5 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PERFSEL1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PERFSEL1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PERFSEL1: UInt32 {
                @inlinable @inline(__always) get {
                    PERFSEL1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PERFSEL1_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PERFSEL1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PERFSEL1: PERFSEL1_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PERFSEL1_Field.self, PERFSEL1_Values.self)
                    return PERFSEL1_Values(storage: self.raw.PERFSEL1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PERFSEL1_Field.self, PERFSEL1_Values.self)
                    self.raw.PERFSEL1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Bus fabric performance counter 2
    public var PERFCTR2: Register<PERFCTR2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct PERFCTR2_Descriptor {
        @available(*, unavailable)
        /// Busfabric saturating performance counter 2
        /// Count some event signal from the busfabric arbiters.
        /// Write any value to clear. Select an event to count using PERFSEL2
        public var PERFCTR2: PERFCTR2_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PERFCTR2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PERFCTR2_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PERFCTR2: UInt32 {
                @inlinable @inline(__always) get {
                    PERFCTR2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PERFCTR2_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PERFCTR2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PERFCTR2: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PERFCTR2_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.PERFCTR2)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PERFCTR2_Field.self, BitField24.self)
                    self.raw.PERFCTR2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Bus fabric performance event select for PERFCTR2
    public var PERFSEL2: Register<PERFSEL2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct PERFSEL2_Descriptor {
        @available(*, unavailable)
        /// Select an event for PERFCTR2. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        public var PERFSEL2: PERFSEL2_Field {
            get {
                fatalError()
            }
        }

        public enum PERFSEL2_Values: UInt, BitFieldProjectable {
            case PERFSEL2_apb_contested = 0
            case PERFSEL2_apb = 1
            case PERFSEL2_fastperi_contested = 2
            case PERFSEL2_fastperi = 3
            case PERFSEL2_sram5_contested = 4
            case PERFSEL2_sram5 = 5
            case PERFSEL2_sram4_contested = 6
            case PERFSEL2_sram4 = 7
            case PERFSEL2_sram3_contested = 8
            case PERFSEL2_sram3 = 9
            case PERFSEL2_sram2_contested = 10
            case PERFSEL2_sram2 = 11
            case PERFSEL2_sram1_contested = 12
            case PERFSEL2_sram1 = 13
            case PERFSEL2_sram0_contested = 14
            case PERFSEL2_sram0 = 15
            case PERFSEL2_xip_main_contested = 16
            case PERFSEL2_xip_main = 17
            case PERFSEL2_rom_contested = 18
            case PERFSEL2_rom = 19

            public static var bitWidth: Int { 5 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PERFSEL2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PERFSEL2_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PERFSEL2: UInt32 {
                @inlinable @inline(__always) get {
                    PERFSEL2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PERFSEL2_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PERFSEL2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PERFSEL2: PERFSEL2_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PERFSEL2_Field.self, PERFSEL2_Values.self)
                    return PERFSEL2_Values(storage: self.raw.PERFSEL2)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PERFSEL2_Field.self, PERFSEL2_Values.self)
                    self.raw.PERFSEL2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Bus fabric performance counter 3
    public var PERFCTR3: Register<PERFCTR3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct PERFCTR3_Descriptor {
        @available(*, unavailable)
        /// Busfabric saturating performance counter 3
        /// Count some event signal from the busfabric arbiters.
        /// Write any value to clear. Select an event to count using PERFSEL3
        public var PERFCTR3: PERFCTR3_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PERFCTR3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PERFCTR3_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PERFCTR3: UInt32 {
                @inlinable @inline(__always) get {
                    PERFCTR3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PERFCTR3_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PERFCTR3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PERFCTR3: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PERFCTR3_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.PERFCTR3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PERFCTR3_Field.self, BitField24.self)
                    self.raw.PERFCTR3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Bus fabric performance event select for PERFCTR3
    public var PERFSEL3: Register<PERFSEL3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct PERFSEL3_Descriptor {
        @available(*, unavailable)
        /// Select an event for PERFCTR3. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        public var PERFSEL3: PERFSEL3_Field {
            get {
                fatalError()
            }
        }

        public enum PERFSEL3_Values: UInt, BitFieldProjectable {
            case PERFSEL3_apb_contested = 0
            case PERFSEL3_apb = 1
            case PERFSEL3_fastperi_contested = 2
            case PERFSEL3_fastperi = 3
            case PERFSEL3_sram5_contested = 4
            case PERFSEL3_sram5 = 5
            case PERFSEL3_sram4_contested = 6
            case PERFSEL3_sram4 = 7
            case PERFSEL3_sram3_contested = 8
            case PERFSEL3_sram3 = 9
            case PERFSEL3_sram2_contested = 10
            case PERFSEL3_sram2 = 11
            case PERFSEL3_sram1_contested = 12
            case PERFSEL3_sram1 = 13
            case PERFSEL3_sram0_contested = 14
            case PERFSEL3_sram0 = 15
            case PERFSEL3_xip_main_contested = 16
            case PERFSEL3_xip_main = 17
            case PERFSEL3_rom_contested = 18
            case PERFSEL3_rom = 19

            public static var bitWidth: Int { 5 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PERFSEL3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PERFSEL3_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PERFSEL3: UInt32 {
                @inlinable @inline(__always) get {
                    PERFSEL3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PERFSEL3_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PERFSEL3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PERFSEL3: PERFSEL3_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PERFSEL3_Field.self, PERFSEL3_Values.self)
                    return PERFSEL3_Values(storage: self.raw.PERFSEL3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PERFSEL3_Field.self, PERFSEL3_Values.self)
                    self.raw.PERFSEL3 = newValue.storage(Self.Value.Raw.Storage.self)
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

extension BUSCTRL.BUS_PRIORITY_Descriptor: RegisterValue {
}

extension BUSCTRL.BUS_PRIORITY_ACK_Descriptor: RegisterValue {
}

extension BUSCTRL.PERFCTR0_Descriptor: RegisterValue {
}

extension BUSCTRL.PERFSEL0_Descriptor: RegisterValue {
}

extension BUSCTRL.PERFCTR1_Descriptor: RegisterValue {
}

extension BUSCTRL.PERFSEL1_Descriptor: RegisterValue {
}

extension BUSCTRL.PERFCTR2_Descriptor: RegisterValue {
}

extension BUSCTRL.PERFSEL2_Descriptor: RegisterValue {
}

extension BUSCTRL.PERFCTR3_Descriptor: RegisterValue {
}

extension BUSCTRL.PERFSEL3_Descriptor: RegisterValue {
}
