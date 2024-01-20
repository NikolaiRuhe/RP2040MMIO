import MMIO
import MMIOExtensions
public struct PADS_BANK0 {

    public static var `default`: Self { .init(unsafeAddress: 0x4001c000) }

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
    public var GPIO0: Register<GPIO0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct GPIO0_Descriptor {
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

                    public  typealias Value = GPIO0_Descriptor

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

                    public  typealias Value = GPIO0_Descriptor
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
    public var GPIO1: Register<GPIO1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct GPIO1_Descriptor {
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

                    public  typealias Value = GPIO1_Descriptor

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

                    public  typealias Value = GPIO1_Descriptor
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
    public var GPIO2: Register<GPIO2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct GPIO2_Descriptor {
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

                    public  typealias Value = GPIO2_Descriptor

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

                    public  typealias Value = GPIO2_Descriptor
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
    public var GPIO3: Register<GPIO3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct GPIO3_Descriptor {
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

                    public  typealias Value = GPIO3_Descriptor

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

                    public  typealias Value = GPIO3_Descriptor
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
    public var GPIO4: Register<GPIO4_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct GPIO4_Descriptor {
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

                    public  typealias Value = GPIO4_Descriptor

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

                    public  typealias Value = GPIO4_Descriptor
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
    public var GPIO5: Register<GPIO5_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct GPIO5_Descriptor {
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

                    public  typealias Value = GPIO5_Descriptor

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

                    public  typealias Value = GPIO5_Descriptor
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
    public var GPIO6: Register<GPIO6_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct GPIO6_Descriptor {
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

                    public  typealias Value = GPIO6_Descriptor

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

                    public  typealias Value = GPIO6_Descriptor
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
    public var GPIO7: Register<GPIO7_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct GPIO7_Descriptor {
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

                    public  typealias Value = GPIO7_Descriptor

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

                    public  typealias Value = GPIO7_Descriptor
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
    public var GPIO8: Register<GPIO8_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct GPIO8_Descriptor {
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

                    public  typealias Value = GPIO8_Descriptor

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

                    public  typealias Value = GPIO8_Descriptor
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
    public var GPIO9: Register<GPIO9_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct GPIO9_Descriptor {
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

                    public  typealias Value = GPIO9_Descriptor

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

                    public  typealias Value = GPIO9_Descriptor
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
    public var GPIO10: Register<GPIO10_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct GPIO10_Descriptor {
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

                    public  typealias Value = GPIO10_Descriptor

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

                    public  typealias Value = GPIO10_Descriptor
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
    public var GPIO11: Register<GPIO11_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct GPIO11_Descriptor {
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

                    public  typealias Value = GPIO11_Descriptor

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

                    public  typealias Value = GPIO11_Descriptor
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
    public var GPIO12: Register<GPIO12_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct GPIO12_Descriptor {
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

                    public  typealias Value = GPIO12_Descriptor

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

                    public  typealias Value = GPIO12_Descriptor
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
    public var GPIO13: Register<GPIO13_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct GPIO13_Descriptor {
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

                    public  typealias Value = GPIO13_Descriptor

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

                    public  typealias Value = GPIO13_Descriptor
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
    public var GPIO14: Register<GPIO14_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct GPIO14_Descriptor {
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

                    public  typealias Value = GPIO14_Descriptor

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

                    public  typealias Value = GPIO14_Descriptor
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
    public var GPIO15: Register<GPIO15_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct GPIO15_Descriptor {
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

                    public  typealias Value = GPIO15_Descriptor

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

                    public  typealias Value = GPIO15_Descriptor
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
    public var GPIO16: Register<GPIO16_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct GPIO16_Descriptor {
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

                    public  typealias Value = GPIO16_Descriptor

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

                    public  typealias Value = GPIO16_Descriptor
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
    public var GPIO17: Register<GPIO17_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct GPIO17_Descriptor {
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

                    public  typealias Value = GPIO17_Descriptor

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

                    public  typealias Value = GPIO17_Descriptor
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
    public var GPIO18: Register<GPIO18_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x004c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x004c))
          #endif
        }
    }
    public struct GPIO18_Descriptor {
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

                    public  typealias Value = GPIO18_Descriptor

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

                    public  typealias Value = GPIO18_Descriptor
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
    public var GPIO19: Register<GPIO19_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct GPIO19_Descriptor {
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

                    public  typealias Value = GPIO19_Descriptor

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

                    public  typealias Value = GPIO19_Descriptor
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
    public var GPIO20: Register<GPIO20_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct GPIO20_Descriptor {
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

                    public  typealias Value = GPIO20_Descriptor

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

                    public  typealias Value = GPIO20_Descriptor
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
    public var GPIO21: Register<GPIO21_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0058), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0058))
          #endif
        }
    }
    public struct GPIO21_Descriptor {
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

                    public  typealias Value = GPIO21_Descriptor

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

                    public  typealias Value = GPIO21_Descriptor
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
    public var GPIO22: Register<GPIO22_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x005c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x005c))
          #endif
        }
    }
    public struct GPIO22_Descriptor {
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

                    public  typealias Value = GPIO22_Descriptor

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

                    public  typealias Value = GPIO22_Descriptor
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
    public var GPIO23: Register<GPIO23_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0060), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0060))
          #endif
        }
    }
    public struct GPIO23_Descriptor {
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

                    public  typealias Value = GPIO23_Descriptor

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

                    public  typealias Value = GPIO23_Descriptor
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
    public var GPIO24: Register<GPIO24_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0064), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0064))
          #endif
        }
    }
    public struct GPIO24_Descriptor {
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

                    public  typealias Value = GPIO24_Descriptor

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

                    public  typealias Value = GPIO24_Descriptor
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
    public var GPIO25: Register<GPIO25_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0068), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0068))
          #endif
        }
    }
    public struct GPIO25_Descriptor {
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

                    public  typealias Value = GPIO25_Descriptor

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

                    public  typealias Value = GPIO25_Descriptor
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
    public var GPIO26: Register<GPIO26_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x006c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x006c))
          #endif
        }
    }
    public struct GPIO26_Descriptor {
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

                    public  typealias Value = GPIO26_Descriptor

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

                    public  typealias Value = GPIO26_Descriptor
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
    public var GPIO27: Register<GPIO27_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0070), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0070))
          #endif
        }
    }
    public struct GPIO27_Descriptor {
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

                    public  typealias Value = GPIO27_Descriptor

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

                    public  typealias Value = GPIO27_Descriptor
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
    public var GPIO28: Register<GPIO28_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0074), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0074))
          #endif
        }
    }
    public struct GPIO28_Descriptor {
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

                    public  typealias Value = GPIO28_Descriptor

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

                    public  typealias Value = GPIO28_Descriptor
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
    public var GPIO29: Register<GPIO29_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0078), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0078))
          #endif
        }
    }
    public struct GPIO29_Descriptor {
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

                    public  typealias Value = GPIO29_Descriptor

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

                    public  typealias Value = GPIO29_Descriptor
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
    public var SWCLK: Register<SWCLK_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x007c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x007c))
          #endif
        }
    }
    public struct SWCLK_Descriptor {
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

                    public  typealias Value = SWCLK_Descriptor

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

                    public  typealias Value = SWCLK_Descriptor
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
    public var SWD: Register<SWD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0080), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0080))
          #endif
        }
    }
    public struct SWD_Descriptor {
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

                    public  typealias Value = SWD_Descriptor

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

                    public  typealias Value = SWD_Descriptor
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

extension PADS_BANK0.VOLTAGE_SELECT_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO0_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO1_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO2_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO3_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO4_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO5_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO6_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO7_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO8_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO9_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO10_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO11_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO12_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO13_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO14_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO15_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO16_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO17_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO18_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO19_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO20_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO21_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO22_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO23_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO24_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO25_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO26_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO27_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO28_Descriptor: RegisterValue {
}

extension PADS_BANK0.GPIO29_Descriptor: RegisterValue {
}

extension PADS_BANK0.SWCLK_Descriptor: RegisterValue {
}

extension PADS_BANK0.SWD_Descriptor: RegisterValue {
}
