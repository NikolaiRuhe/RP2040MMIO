import MMIO
import MMIOExtensions
public struct PADS_QSPI {

    public static var `default`: Self { .init(unsafeAddress: 0x40020000) }

    /// Voltage select. Per bank control
    public var VOLTAGE_SELECT: Register<VOLTAGE_SELECT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct VOLTAGE_SELECT_Descriptor {
        @available(*, unavailable)
        public var VOLTAGE_SELECT: VOLTAGE_SELECT_Field {
            get {
                fatalError()
            }
        }

        public enum VOLTAGE_SELECT_Values: UInt, BitFieldProjectable {
            /// Set voltage to 3.3V (DVDD >= 2V5)
            case VOLTAGE_SELECT_3v3 = 0
            /// Set voltage to 1.8V (DVDD <= 1V8)
            case VOLTAGE_SELECT_1v8 = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum VOLTAGE_SELECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = VOLTAGE_SELECT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var VOLTAGE_SELECT: UInt32 {
                @inlinable @inline(__always) get {
                    VOLTAGE_SELECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    VOLTAGE_SELECT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = VOLTAGE_SELECT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var VOLTAGE_SELECT: VOLTAGE_SELECT_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(VOLTAGE_SELECT_Field.self, VOLTAGE_SELECT_Values.self)
                    return VOLTAGE_SELECT_Values(storage: self.raw.VOLTAGE_SELECT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(VOLTAGE_SELECT_Field.self, VOLTAGE_SELECT_Values.self)
                    self.raw.VOLTAGE_SELECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Pad control register
    public var GPIO_QSPI_SCLK: Register<GPIO_QSPI_SCLK_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct GPIO_QSPI_SCLK_Descriptor {
        @available(*, unavailable)
        /// Output disable. Has priority over output enable from peripherals
        public var OD: OD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Input enable
        public var IE: IE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Drive strength.
        public var DRIVE: DRIVE_Field {
            get {
                fatalError()
            }
        }

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Pull up enable
        public var PUE: PUE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pull down enable
        public var PDE: PDE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable schmitt trigger
        public var SCHMITT: SCHMITT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Slew rate control. 1 = Fast, 0 = Slow
        public var SLEWFAST: SLEWFAST_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum IE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DRIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum PUE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum PDE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SCHMITT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SLEWFAST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SCLK_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OD: UInt32 {
                @inlinable @inline(__always) get {
                    OD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IE: UInt32 {
                @inlinable @inline(__always) get {
                  IE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DRIVE: UInt32 {
                @inlinable @inline(__always) get {
                  DRIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DRIVE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PUE: UInt32 {
                @inlinable @inline(__always) get {
                  PUE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PUE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PDE: UInt32 {
                @inlinable @inline(__always) get {
                  PDE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PDE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SCHMITT: UInt32 {
                @inlinable @inline(__always) get {
                  SCHMITT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SCHMITT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SLEWFAST: UInt32 {
                @inlinable @inline(__always) get {
                  SLEWFAST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLEWFAST_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SCLK_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OD: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    return Bool(storage: self.raw.OD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    self.raw.OD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  return Bool(storage: self.raw.IE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  self.raw.IE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DRIVE: DRIVE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  return DRIVE_Values(storage: self.raw.DRIVE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  self.raw.DRIVE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PUE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PUE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  self.raw.PUE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PDE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PDE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  self.raw.PDE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SCHMITT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  return Bool(storage: self.raw.SCHMITT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  self.raw.SCHMITT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SLEWFAST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  return Bool(storage: self.raw.SLEWFAST)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  self.raw.SLEWFAST = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Pad control register
    public var GPIO_QSPI_SD0: Register<GPIO_QSPI_SD0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct GPIO_QSPI_SD0_Descriptor {
        @available(*, unavailable)
        /// Output disable. Has priority over output enable from peripherals
        public var OD: OD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Input enable
        public var IE: IE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Drive strength.
        public var DRIVE: DRIVE_Field {
            get {
                fatalError()
            }
        }

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Pull up enable
        public var PUE: PUE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pull down enable
        public var PDE: PDE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable schmitt trigger
        public var SCHMITT: SCHMITT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Slew rate control. 1 = Fast, 0 = Slow
        public var SLEWFAST: SLEWFAST_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum IE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DRIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum PUE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum PDE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SCHMITT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SLEWFAST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OD: UInt32 {
                @inlinable @inline(__always) get {
                    OD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IE: UInt32 {
                @inlinable @inline(__always) get {
                  IE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DRIVE: UInt32 {
                @inlinable @inline(__always) get {
                  DRIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DRIVE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PUE: UInt32 {
                @inlinable @inline(__always) get {
                  PUE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PUE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PDE: UInt32 {
                @inlinable @inline(__always) get {
                  PDE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PDE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SCHMITT: UInt32 {
                @inlinable @inline(__always) get {
                  SCHMITT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SCHMITT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SLEWFAST: UInt32 {
                @inlinable @inline(__always) get {
                  SLEWFAST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLEWFAST_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OD: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    return Bool(storage: self.raw.OD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    self.raw.OD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  return Bool(storage: self.raw.IE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  self.raw.IE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DRIVE: DRIVE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  return DRIVE_Values(storage: self.raw.DRIVE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  self.raw.DRIVE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PUE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PUE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  self.raw.PUE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PDE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PDE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  self.raw.PDE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SCHMITT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  return Bool(storage: self.raw.SCHMITT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  self.raw.SCHMITT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SLEWFAST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  return Bool(storage: self.raw.SLEWFAST)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  self.raw.SLEWFAST = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Pad control register
    public var GPIO_QSPI_SD1: Register<GPIO_QSPI_SD1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct GPIO_QSPI_SD1_Descriptor {
        @available(*, unavailable)
        /// Output disable. Has priority over output enable from peripherals
        public var OD: OD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Input enable
        public var IE: IE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Drive strength.
        public var DRIVE: DRIVE_Field {
            get {
                fatalError()
            }
        }

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Pull up enable
        public var PUE: PUE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pull down enable
        public var PDE: PDE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable schmitt trigger
        public var SCHMITT: SCHMITT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Slew rate control. 1 = Fast, 0 = Slow
        public var SLEWFAST: SLEWFAST_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum IE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DRIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum PUE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum PDE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SCHMITT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SLEWFAST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OD: UInt32 {
                @inlinable @inline(__always) get {
                    OD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IE: UInt32 {
                @inlinable @inline(__always) get {
                  IE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DRIVE: UInt32 {
                @inlinable @inline(__always) get {
                  DRIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DRIVE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PUE: UInt32 {
                @inlinable @inline(__always) get {
                  PUE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PUE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PDE: UInt32 {
                @inlinable @inline(__always) get {
                  PDE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PDE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SCHMITT: UInt32 {
                @inlinable @inline(__always) get {
                  SCHMITT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SCHMITT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SLEWFAST: UInt32 {
                @inlinable @inline(__always) get {
                  SLEWFAST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLEWFAST_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OD: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    return Bool(storage: self.raw.OD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    self.raw.OD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  return Bool(storage: self.raw.IE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  self.raw.IE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DRIVE: DRIVE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  return DRIVE_Values(storage: self.raw.DRIVE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  self.raw.DRIVE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PUE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PUE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  self.raw.PUE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PDE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PDE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  self.raw.PDE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SCHMITT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  return Bool(storage: self.raw.SCHMITT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  self.raw.SCHMITT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SLEWFAST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  return Bool(storage: self.raw.SLEWFAST)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  self.raw.SLEWFAST = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Pad control register
    public var GPIO_QSPI_SD2: Register<GPIO_QSPI_SD2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct GPIO_QSPI_SD2_Descriptor {
        @available(*, unavailable)
        /// Output disable. Has priority over output enable from peripherals
        public var OD: OD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Input enable
        public var IE: IE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Drive strength.
        public var DRIVE: DRIVE_Field {
            get {
                fatalError()
            }
        }

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Pull up enable
        public var PUE: PUE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pull down enable
        public var PDE: PDE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable schmitt trigger
        public var SCHMITT: SCHMITT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Slew rate control. 1 = Fast, 0 = Slow
        public var SLEWFAST: SLEWFAST_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum IE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DRIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum PUE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum PDE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SCHMITT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SLEWFAST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD2_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OD: UInt32 {
                @inlinable @inline(__always) get {
                    OD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IE: UInt32 {
                @inlinable @inline(__always) get {
                  IE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DRIVE: UInt32 {
                @inlinable @inline(__always) get {
                  DRIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DRIVE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PUE: UInt32 {
                @inlinable @inline(__always) get {
                  PUE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PUE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PDE: UInt32 {
                @inlinable @inline(__always) get {
                  PDE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PDE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SCHMITT: UInt32 {
                @inlinable @inline(__always) get {
                  SCHMITT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SCHMITT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SLEWFAST: UInt32 {
                @inlinable @inline(__always) get {
                  SLEWFAST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLEWFAST_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OD: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    return Bool(storage: self.raw.OD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    self.raw.OD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  return Bool(storage: self.raw.IE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  self.raw.IE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DRIVE: DRIVE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  return DRIVE_Values(storage: self.raw.DRIVE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  self.raw.DRIVE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PUE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PUE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  self.raw.PUE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PDE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PDE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  self.raw.PDE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SCHMITT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  return Bool(storage: self.raw.SCHMITT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  self.raw.SCHMITT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SLEWFAST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  return Bool(storage: self.raw.SLEWFAST)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  self.raw.SLEWFAST = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Pad control register
    public var GPIO_QSPI_SD3: Register<GPIO_QSPI_SD3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct GPIO_QSPI_SD3_Descriptor {
        @available(*, unavailable)
        /// Output disable. Has priority over output enable from peripherals
        public var OD: OD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Input enable
        public var IE: IE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Drive strength.
        public var DRIVE: DRIVE_Field {
            get {
                fatalError()
            }
        }

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Pull up enable
        public var PUE: PUE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pull down enable
        public var PDE: PDE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable schmitt trigger
        public var SCHMITT: SCHMITT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Slew rate control. 1 = Fast, 0 = Slow
        public var SLEWFAST: SLEWFAST_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum IE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DRIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum PUE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum PDE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SCHMITT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SLEWFAST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD3_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OD: UInt32 {
                @inlinable @inline(__always) get {
                    OD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IE: UInt32 {
                @inlinable @inline(__always) get {
                  IE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DRIVE: UInt32 {
                @inlinable @inline(__always) get {
                  DRIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DRIVE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PUE: UInt32 {
                @inlinable @inline(__always) get {
                  PUE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PUE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PDE: UInt32 {
                @inlinable @inline(__always) get {
                  PDE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PDE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SCHMITT: UInt32 {
                @inlinable @inline(__always) get {
                  SCHMITT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SCHMITT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SLEWFAST: UInt32 {
                @inlinable @inline(__always) get {
                  SLEWFAST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLEWFAST_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OD: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    return Bool(storage: self.raw.OD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    self.raw.OD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  return Bool(storage: self.raw.IE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  self.raw.IE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DRIVE: DRIVE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  return DRIVE_Values(storage: self.raw.DRIVE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  self.raw.DRIVE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PUE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PUE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  self.raw.PUE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PDE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PDE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  self.raw.PDE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SCHMITT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  return Bool(storage: self.raw.SCHMITT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  self.raw.SCHMITT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SLEWFAST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  return Bool(storage: self.raw.SLEWFAST)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  self.raw.SLEWFAST = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Pad control register
    public var GPIO_QSPI_SS: Register<GPIO_QSPI_SS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct GPIO_QSPI_SS_Descriptor {
        @available(*, unavailable)
        /// Output disable. Has priority over output enable from peripherals
        public var OD: OD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Input enable
        public var IE: IE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Drive strength.
        public var DRIVE: DRIVE_Field {
            get {
                fatalError()
            }
        }

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Pull up enable
        public var PUE: PUE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pull down enable
        public var PDE: PDE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable schmitt trigger
        public var SCHMITT: SCHMITT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Slew rate control. 1 = Fast, 0 = Slow
        public var SLEWFAST: SLEWFAST_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum IE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DRIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum PUE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum PDE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SCHMITT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SLEWFAST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SS_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OD: UInt32 {
                @inlinable @inline(__always) get {
                    OD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IE: UInt32 {
                @inlinable @inline(__always) get {
                  IE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DRIVE: UInt32 {
                @inlinable @inline(__always) get {
                  DRIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DRIVE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PUE: UInt32 {
                @inlinable @inline(__always) get {
                  PUE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PUE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PDE: UInt32 {
                @inlinable @inline(__always) get {
                  PDE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PDE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SCHMITT: UInt32 {
                @inlinable @inline(__always) get {
                  SCHMITT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SCHMITT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SLEWFAST: UInt32 {
                @inlinable @inline(__always) get {
                  SLEWFAST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLEWFAST_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SS_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OD: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    return Bool(storage: self.raw.OD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OD_Field.self, Bool.self)
                    self.raw.OD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  return Bool(storage: self.raw.IE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IE_Field.self, Bool.self)
                  self.raw.IE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DRIVE: DRIVE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  return DRIVE_Values(storage: self.raw.DRIVE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DRIVE_Field.self, DRIVE_Values.self)
                  self.raw.DRIVE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PUE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PUE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PUE_Field.self, Bool.self)
                  self.raw.PUE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PDE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PDE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PDE_Field.self, Bool.self)
                  self.raw.PDE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SCHMITT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  return Bool(storage: self.raw.SCHMITT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SCHMITT_Field.self, Bool.self)
                  self.raw.SCHMITT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SLEWFAST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  return Bool(storage: self.raw.SLEWFAST)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SLEWFAST_Field.self, Bool.self)
                  self.raw.SLEWFAST = newValue.storage(Self.Value.Raw.Storage.self)
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

extension PADS_QSPI.VOLTAGE_SELECT_Descriptor: RegisterValue {
}

extension PADS_QSPI.GPIO_QSPI_SCLK_Descriptor: RegisterValue {
}

extension PADS_QSPI.GPIO_QSPI_SD0_Descriptor: RegisterValue {
}

extension PADS_QSPI.GPIO_QSPI_SD1_Descriptor: RegisterValue {
}

extension PADS_QSPI.GPIO_QSPI_SD2_Descriptor: RegisterValue {
}

extension PADS_QSPI.GPIO_QSPI_SD3_Descriptor: RegisterValue {
}

extension PADS_QSPI.GPIO_QSPI_SS_Descriptor: RegisterValue {
}
