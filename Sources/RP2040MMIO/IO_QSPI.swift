import MMIO
import MMIOExtensions
public struct IO_QSPI {

    public static var `default`: Self { .init(unsafeAddress: 0x40018000) }

    /// GPIO status
    public var GPIO_QSPI_SCLK_STATUS: Register<GPIO_QSPI_SCLK_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct GPIO_QSPI_SCLK_STATUS_Descriptor {
        @available(*, unavailable)
        /// interrupt to processors, after override is applied
        public var IRQTOPROC: IRQTOPROC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// interrupt from pad before override is applied
        public var IRQFROMPAD: IRQFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal to peripheral, after override is applied
        public var INTOPERI: INTOPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal from pad, before override is applied
        public var INFROMPAD: INFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable to pad after register override is applied
        public var OETOPAD: OETOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable from selected peripheral, before register override is applied
        public var OEFROMPERI: OEFROMPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal to pad after register override is applied
        public var OUTTOPAD: OUTTOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal from selected peripheral, before register override is applied
        public var OUTFROMPERI: OUTFROMPERI_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQTOPROC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum IRQFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum INTOPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum INFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum OETOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum OEFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum OUTTOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum OUTFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SCLK_STATUS_Descriptor

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
                public var IRQTOPROC: UInt32 {
                @inlinable @inline(__always) get {
                    IRQTOPROC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQTOPROC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IRQFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  IRQFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTOPERI: UInt32 {
                @inlinable @inline(__always) get {
                  INTOPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTOPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  INFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OETOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OETOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OETOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OEFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTTOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OUTTOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTTOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OUTFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_QSPI_SCLK_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IRQTOPROC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQTOPROC_Field.self, Bool.self)
                    return Bool(storage: self.raw.IRQTOPROC)
                }
                }
              public var IRQFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQFROMPAD)
                }
              }
              public var INTOPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTOPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTOPERI)
                }
              }
              public var INFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.INFROMPAD)
                }
              }
              public var OETOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OETOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OETOPAD)
                }
              }
              public var OEFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OEFROMPERI)
                }
              }
              public var OUTTOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTTOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTTOPAD)
                }
              }
              public var OUTFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTFROMPERI)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SCLK_STATUS_Descriptor
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

    /// GPIO control including function select and overrides.
    public var GPIO_QSPI_SCLK_CTRL: Register<GPIO_QSPI_SCLK_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct GPIO_QSPI_SCLK_CTRL_Descriptor {
        @available(*, unavailable)
        public var IRQOVER: IRQOVER_Field {
            get {
                fatalError()
            }
        }

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var INOVER: INOVER_Field {
            get {
                fatalError()
            }
        }

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OEOVER: OEOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OUTOVER: OUTOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        public var FUNCSEL: FUNCSEL_Field {
            get {
                fatalError()
            }
        }

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sclk = 0
            case FUNCSEL_sio_30 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 30
        }

        public enum INOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum OEOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 14
        }

        public enum OUTOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public enum FUNCSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SCLK_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IRQOVER: UInt32 {
                @inlinable @inline(__always) get {
                    IRQOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQOVER_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INOVER: UInt32 {
                @inlinable @inline(__always) get {
                  INOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OEOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OUTOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FUNCSEL: UInt32 {
                @inlinable @inline(__always) get {
                  FUNCSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FUNCSEL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SCLK_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IRQOVER: IRQOVER_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    return IRQOVER_Values(storage: self.raw.IRQOVER)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    self.raw.IRQOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INOVER: INOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  return INOVER_Values(storage: self.raw.INOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  self.raw.INOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OEOVER: OEOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  return OEOVER_Values(storage: self.raw.OEOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  self.raw.OEOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUTOVER: OUTOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  return OUTOVER_Values(storage: self.raw.OUTOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  self.raw.OUTOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FUNCSEL: FUNCSEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  return FUNCSEL_Values(storage: self.raw.FUNCSEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  self.raw.FUNCSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// GPIO status
    public var GPIO_QSPI_SS_STATUS: Register<GPIO_QSPI_SS_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct GPIO_QSPI_SS_STATUS_Descriptor {
        @available(*, unavailable)
        /// interrupt to processors, after override is applied
        public var IRQTOPROC: IRQTOPROC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// interrupt from pad before override is applied
        public var IRQFROMPAD: IRQFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal to peripheral, after override is applied
        public var INTOPERI: INTOPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal from pad, before override is applied
        public var INFROMPAD: INFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable to pad after register override is applied
        public var OETOPAD: OETOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable from selected peripheral, before register override is applied
        public var OEFROMPERI: OEFROMPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal to pad after register override is applied
        public var OUTTOPAD: OUTTOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal from selected peripheral, before register override is applied
        public var OUTFROMPERI: OUTFROMPERI_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQTOPROC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum IRQFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum INTOPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum INFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum OETOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum OEFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum OUTTOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum OUTFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SS_STATUS_Descriptor

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
                public var IRQTOPROC: UInt32 {
                @inlinable @inline(__always) get {
                    IRQTOPROC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQTOPROC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IRQFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  IRQFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTOPERI: UInt32 {
                @inlinable @inline(__always) get {
                  INTOPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTOPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  INFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OETOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OETOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OETOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OEFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTTOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OUTTOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTTOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OUTFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_QSPI_SS_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IRQTOPROC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQTOPROC_Field.self, Bool.self)
                    return Bool(storage: self.raw.IRQTOPROC)
                }
                }
              public var IRQFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQFROMPAD)
                }
              }
              public var INTOPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTOPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTOPERI)
                }
              }
              public var INFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.INFROMPAD)
                }
              }
              public var OETOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OETOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OETOPAD)
                }
              }
              public var OEFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OEFROMPERI)
                }
              }
              public var OUTTOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTTOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTTOPAD)
                }
              }
              public var OUTFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTFROMPERI)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SS_STATUS_Descriptor
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

    /// GPIO control including function select and overrides.
    public var GPIO_QSPI_SS_CTRL: Register<GPIO_QSPI_SS_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct GPIO_QSPI_SS_CTRL_Descriptor {
        @available(*, unavailable)
        public var IRQOVER: IRQOVER_Field {
            get {
                fatalError()
            }
        }

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var INOVER: INOVER_Field {
            get {
                fatalError()
            }
        }

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OEOVER: OEOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OUTOVER: OUTOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        public var FUNCSEL: FUNCSEL_Field {
            get {
                fatalError()
            }
        }

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_ss_n = 0
            case FUNCSEL_sio_31 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 30
        }

        public enum INOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum OEOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 14
        }

        public enum OUTOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public enum FUNCSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SS_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IRQOVER: UInt32 {
                @inlinable @inline(__always) get {
                    IRQOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQOVER_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INOVER: UInt32 {
                @inlinable @inline(__always) get {
                  INOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OEOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OUTOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FUNCSEL: UInt32 {
                @inlinable @inline(__always) get {
                  FUNCSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FUNCSEL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SS_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IRQOVER: IRQOVER_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    return IRQOVER_Values(storage: self.raw.IRQOVER)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    self.raw.IRQOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INOVER: INOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  return INOVER_Values(storage: self.raw.INOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  self.raw.INOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OEOVER: OEOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  return OEOVER_Values(storage: self.raw.OEOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  self.raw.OEOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUTOVER: OUTOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  return OUTOVER_Values(storage: self.raw.OUTOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  self.raw.OUTOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FUNCSEL: FUNCSEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  return FUNCSEL_Values(storage: self.raw.FUNCSEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  self.raw.FUNCSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// GPIO status
    public var GPIO_QSPI_SD0_STATUS: Register<GPIO_QSPI_SD0_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct GPIO_QSPI_SD0_STATUS_Descriptor {
        @available(*, unavailable)
        /// interrupt to processors, after override is applied
        public var IRQTOPROC: IRQTOPROC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// interrupt from pad before override is applied
        public var IRQFROMPAD: IRQFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal to peripheral, after override is applied
        public var INTOPERI: INTOPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal from pad, before override is applied
        public var INFROMPAD: INFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable to pad after register override is applied
        public var OETOPAD: OETOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable from selected peripheral, before register override is applied
        public var OEFROMPERI: OEFROMPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal to pad after register override is applied
        public var OUTTOPAD: OUTTOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal from selected peripheral, before register override is applied
        public var OUTFROMPERI: OUTFROMPERI_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQTOPROC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum IRQFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum INTOPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum INFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum OETOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum OEFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum OUTTOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum OUTFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD0_STATUS_Descriptor

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
                public var IRQTOPROC: UInt32 {
                @inlinable @inline(__always) get {
                    IRQTOPROC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQTOPROC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IRQFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  IRQFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTOPERI: UInt32 {
                @inlinable @inline(__always) get {
                  INTOPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTOPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  INFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OETOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OETOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OETOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OEFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTTOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OUTTOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTTOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OUTFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_QSPI_SD0_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IRQTOPROC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQTOPROC_Field.self, Bool.self)
                    return Bool(storage: self.raw.IRQTOPROC)
                }
                }
              public var IRQFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQFROMPAD)
                }
              }
              public var INTOPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTOPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTOPERI)
                }
              }
              public var INFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.INFROMPAD)
                }
              }
              public var OETOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OETOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OETOPAD)
                }
              }
              public var OEFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OEFROMPERI)
                }
              }
              public var OUTTOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTTOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTTOPAD)
                }
              }
              public var OUTFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTFROMPERI)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD0_STATUS_Descriptor
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

    /// GPIO control including function select and overrides.
    public var GPIO_QSPI_SD0_CTRL: Register<GPIO_QSPI_SD0_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct GPIO_QSPI_SD0_CTRL_Descriptor {
        @available(*, unavailable)
        public var IRQOVER: IRQOVER_Field {
            get {
                fatalError()
            }
        }

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var INOVER: INOVER_Field {
            get {
                fatalError()
            }
        }

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OEOVER: OEOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OUTOVER: OUTOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        public var FUNCSEL: FUNCSEL_Field {
            get {
                fatalError()
            }
        }

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd0 = 0
            case FUNCSEL_sio_32 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 30
        }

        public enum INOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum OEOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 14
        }

        public enum OUTOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public enum FUNCSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD0_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IRQOVER: UInt32 {
                @inlinable @inline(__always) get {
                    IRQOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQOVER_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INOVER: UInt32 {
                @inlinable @inline(__always) get {
                  INOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OEOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OUTOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FUNCSEL: UInt32 {
                @inlinable @inline(__always) get {
                  FUNCSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FUNCSEL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD0_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IRQOVER: IRQOVER_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    return IRQOVER_Values(storage: self.raw.IRQOVER)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    self.raw.IRQOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INOVER: INOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  return INOVER_Values(storage: self.raw.INOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  self.raw.INOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OEOVER: OEOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  return OEOVER_Values(storage: self.raw.OEOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  self.raw.OEOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUTOVER: OUTOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  return OUTOVER_Values(storage: self.raw.OUTOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  self.raw.OUTOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FUNCSEL: FUNCSEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  return FUNCSEL_Values(storage: self.raw.FUNCSEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  self.raw.FUNCSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// GPIO status
    public var GPIO_QSPI_SD1_STATUS: Register<GPIO_QSPI_SD1_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct GPIO_QSPI_SD1_STATUS_Descriptor {
        @available(*, unavailable)
        /// interrupt to processors, after override is applied
        public var IRQTOPROC: IRQTOPROC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// interrupt from pad before override is applied
        public var IRQFROMPAD: IRQFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal to peripheral, after override is applied
        public var INTOPERI: INTOPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal from pad, before override is applied
        public var INFROMPAD: INFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable to pad after register override is applied
        public var OETOPAD: OETOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable from selected peripheral, before register override is applied
        public var OEFROMPERI: OEFROMPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal to pad after register override is applied
        public var OUTTOPAD: OUTTOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal from selected peripheral, before register override is applied
        public var OUTFROMPERI: OUTFROMPERI_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQTOPROC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum IRQFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum INTOPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum INFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum OETOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum OEFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum OUTTOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum OUTFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD1_STATUS_Descriptor

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
                public var IRQTOPROC: UInt32 {
                @inlinable @inline(__always) get {
                    IRQTOPROC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQTOPROC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IRQFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  IRQFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTOPERI: UInt32 {
                @inlinable @inline(__always) get {
                  INTOPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTOPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  INFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OETOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OETOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OETOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OEFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTTOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OUTTOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTTOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OUTFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_QSPI_SD1_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IRQTOPROC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQTOPROC_Field.self, Bool.self)
                    return Bool(storage: self.raw.IRQTOPROC)
                }
                }
              public var IRQFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQFROMPAD)
                }
              }
              public var INTOPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTOPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTOPERI)
                }
              }
              public var INFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.INFROMPAD)
                }
              }
              public var OETOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OETOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OETOPAD)
                }
              }
              public var OEFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OEFROMPERI)
                }
              }
              public var OUTTOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTTOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTTOPAD)
                }
              }
              public var OUTFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTFROMPERI)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD1_STATUS_Descriptor
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

    /// GPIO control including function select and overrides.
    public var GPIO_QSPI_SD1_CTRL: Register<GPIO_QSPI_SD1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct GPIO_QSPI_SD1_CTRL_Descriptor {
        @available(*, unavailable)
        public var IRQOVER: IRQOVER_Field {
            get {
                fatalError()
            }
        }

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var INOVER: INOVER_Field {
            get {
                fatalError()
            }
        }

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OEOVER: OEOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OUTOVER: OUTOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        public var FUNCSEL: FUNCSEL_Field {
            get {
                fatalError()
            }
        }

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd1 = 0
            case FUNCSEL_sio_33 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 30
        }

        public enum INOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum OEOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 14
        }

        public enum OUTOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public enum FUNCSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD1_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IRQOVER: UInt32 {
                @inlinable @inline(__always) get {
                    IRQOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQOVER_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INOVER: UInt32 {
                @inlinable @inline(__always) get {
                  INOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OEOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OUTOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FUNCSEL: UInt32 {
                @inlinable @inline(__always) get {
                  FUNCSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FUNCSEL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IRQOVER: IRQOVER_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    return IRQOVER_Values(storage: self.raw.IRQOVER)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    self.raw.IRQOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INOVER: INOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  return INOVER_Values(storage: self.raw.INOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  self.raw.INOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OEOVER: OEOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  return OEOVER_Values(storage: self.raw.OEOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  self.raw.OEOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUTOVER: OUTOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  return OUTOVER_Values(storage: self.raw.OUTOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  self.raw.OUTOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FUNCSEL: FUNCSEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  return FUNCSEL_Values(storage: self.raw.FUNCSEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  self.raw.FUNCSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// GPIO status
    public var GPIO_QSPI_SD2_STATUS: Register<GPIO_QSPI_SD2_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct GPIO_QSPI_SD2_STATUS_Descriptor {
        @available(*, unavailable)
        /// interrupt to processors, after override is applied
        public var IRQTOPROC: IRQTOPROC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// interrupt from pad before override is applied
        public var IRQFROMPAD: IRQFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal to peripheral, after override is applied
        public var INTOPERI: INTOPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal from pad, before override is applied
        public var INFROMPAD: INFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable to pad after register override is applied
        public var OETOPAD: OETOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable from selected peripheral, before register override is applied
        public var OEFROMPERI: OEFROMPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal to pad after register override is applied
        public var OUTTOPAD: OUTTOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal from selected peripheral, before register override is applied
        public var OUTFROMPERI: OUTFROMPERI_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQTOPROC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum IRQFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum INTOPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum INFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum OETOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum OEFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum OUTTOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum OUTFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD2_STATUS_Descriptor

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
                public var IRQTOPROC: UInt32 {
                @inlinable @inline(__always) get {
                    IRQTOPROC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQTOPROC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IRQFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  IRQFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTOPERI: UInt32 {
                @inlinable @inline(__always) get {
                  INTOPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTOPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  INFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OETOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OETOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OETOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OEFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTTOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OUTTOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTTOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OUTFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_QSPI_SD2_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IRQTOPROC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQTOPROC_Field.self, Bool.self)
                    return Bool(storage: self.raw.IRQTOPROC)
                }
                }
              public var IRQFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQFROMPAD)
                }
              }
              public var INTOPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTOPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTOPERI)
                }
              }
              public var INFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.INFROMPAD)
                }
              }
              public var OETOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OETOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OETOPAD)
                }
              }
              public var OEFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OEFROMPERI)
                }
              }
              public var OUTTOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTTOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTTOPAD)
                }
              }
              public var OUTFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTFROMPERI)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD2_STATUS_Descriptor
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

    /// GPIO control including function select and overrides.
    public var GPIO_QSPI_SD2_CTRL: Register<GPIO_QSPI_SD2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct GPIO_QSPI_SD2_CTRL_Descriptor {
        @available(*, unavailable)
        public var IRQOVER: IRQOVER_Field {
            get {
                fatalError()
            }
        }

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var INOVER: INOVER_Field {
            get {
                fatalError()
            }
        }

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OEOVER: OEOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OUTOVER: OUTOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        public var FUNCSEL: FUNCSEL_Field {
            get {
                fatalError()
            }
        }

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd2 = 0
            case FUNCSEL_sio_34 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 30
        }

        public enum INOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum OEOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 14
        }

        public enum OUTOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public enum FUNCSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD2_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IRQOVER: UInt32 {
                @inlinable @inline(__always) get {
                    IRQOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQOVER_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INOVER: UInt32 {
                @inlinable @inline(__always) get {
                  INOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OEOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OUTOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FUNCSEL: UInt32 {
                @inlinable @inline(__always) get {
                  FUNCSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FUNCSEL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IRQOVER: IRQOVER_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    return IRQOVER_Values(storage: self.raw.IRQOVER)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    self.raw.IRQOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INOVER: INOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  return INOVER_Values(storage: self.raw.INOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  self.raw.INOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OEOVER: OEOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  return OEOVER_Values(storage: self.raw.OEOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  self.raw.OEOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUTOVER: OUTOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  return OUTOVER_Values(storage: self.raw.OUTOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  self.raw.OUTOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FUNCSEL: FUNCSEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  return FUNCSEL_Values(storage: self.raw.FUNCSEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  self.raw.FUNCSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// GPIO status
    public var GPIO_QSPI_SD3_STATUS: Register<GPIO_QSPI_SD3_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct GPIO_QSPI_SD3_STATUS_Descriptor {
        @available(*, unavailable)
        /// interrupt to processors, after override is applied
        public var IRQTOPROC: IRQTOPROC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// interrupt from pad before override is applied
        public var IRQFROMPAD: IRQFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal to peripheral, after override is applied
        public var INTOPERI: INTOPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// input signal from pad, before override is applied
        public var INFROMPAD: INFROMPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable to pad after register override is applied
        public var OETOPAD: OETOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output enable from selected peripheral, before register override is applied
        public var OEFROMPERI: OEFROMPERI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal to pad after register override is applied
        public var OUTTOPAD: OUTTOPAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// output signal from selected peripheral, before register override is applied
        public var OUTFROMPERI: OUTFROMPERI_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQTOPROC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum IRQFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum INTOPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum INFROMPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum OETOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum OEFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum OUTTOPAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum OUTFROMPERI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD3_STATUS_Descriptor

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
                public var IRQTOPROC: UInt32 {
                @inlinable @inline(__always) get {
                    IRQTOPROC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQTOPROC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IRQFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  IRQFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTOPERI: UInt32 {
                @inlinable @inline(__always) get {
                  INTOPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTOPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INFROMPAD: UInt32 {
                @inlinable @inline(__always) get {
                  INFROMPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INFROMPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OETOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OETOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OETOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OEFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTTOPAD: UInt32 {
                @inlinable @inline(__always) get {
                  OUTTOPAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTTOPAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTFROMPERI: UInt32 {
                @inlinable @inline(__always) get {
                  OUTFROMPERI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTFROMPERI_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_QSPI_SD3_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IRQTOPROC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQTOPROC_Field.self, Bool.self)
                    return Bool(storage: self.raw.IRQTOPROC)
                }
                }
              public var IRQFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQFROMPAD)
                }
              }
              public var INTOPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTOPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTOPERI)
                }
              }
              public var INFROMPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INFROMPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.INFROMPAD)
                }
              }
              public var OETOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OETOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OETOPAD)
                }
              }
              public var OEFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OEFROMPERI)
                }
              }
              public var OUTTOPAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTTOPAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTTOPAD)
                }
              }
              public var OUTFROMPERI: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTFROMPERI_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUTFROMPERI)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD3_STATUS_Descriptor
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

    /// GPIO control including function select and overrides.
    public var GPIO_QSPI_SD3_CTRL: Register<GPIO_QSPI_SD3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct GPIO_QSPI_SD3_CTRL_Descriptor {
        @available(*, unavailable)
        public var IRQOVER: IRQOVER_Field {
            get {
                fatalError()
            }
        }

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var INOVER: INOVER_Field {
            get {
                fatalError()
            }
        }

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OEOVER: OEOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)
        public var OUTOVER: OUTOVER_Field {
            get {
                fatalError()
            }
        }

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        public var FUNCSEL: FUNCSEL_Field {
            get {
                fatalError()
            }
        }

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd3 = 0
            case FUNCSEL_sio_35 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 30
        }

        public enum INOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 18
        }

        public enum OEOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 14
        }

        public enum OUTOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public enum FUNCSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_QSPI_SD3_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IRQOVER: UInt32 {
                @inlinable @inline(__always) get {
                    IRQOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQOVER_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INOVER: UInt32 {
                @inlinable @inline(__always) get {
                  INOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OEOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OEOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OEOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUTOVER: UInt32 {
                @inlinable @inline(__always) get {
                  OUTOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUTOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FUNCSEL: UInt32 {
                @inlinable @inline(__always) get {
                  FUNCSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FUNCSEL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_QSPI_SD3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IRQOVER: IRQOVER_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    return IRQOVER_Values(storage: self.raw.IRQOVER)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IRQOVER_Field.self, IRQOVER_Values.self)
                    self.raw.IRQOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INOVER: INOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  return INOVER_Values(storage: self.raw.INOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INOVER_Field.self, INOVER_Values.self)
                  self.raw.INOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OEOVER: OEOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  return OEOVER_Values(storage: self.raw.OEOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OEOVER_Field.self, OEOVER_Values.self)
                  self.raw.OEOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUTOVER: OUTOVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  return OUTOVER_Values(storage: self.raw.OUTOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUTOVER_Field.self, OUTOVER_Values.self)
                  self.raw.OUTOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FUNCSEL: FUNCSEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  return FUNCSEL_Values(storage: self.raw.FUNCSEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FUNCSEL_Field.self, FUNCSEL_Values.self)
                  self.raw.FUNCSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Raw Interrupts
    public var INTR: Register<INTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct INTR_Descriptor {
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_QSPI_SD3_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum GPIO_QSPI_SD3_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum GPIO_QSPI_SD3_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum GPIO_QSPI_SD3_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum GPIO_QSPI_SD2_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum GPIO_QSPI_SD2_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum GPIO_QSPI_SD2_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum GPIO_QSPI_SD2_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum GPIO_QSPI_SD1_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum GPIO_QSPI_SD1_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum GPIO_QSPI_SD1_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum GPIO_QSPI_SD1_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GPIO_QSPI_SD0_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GPIO_QSPI_SD0_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum GPIO_QSPI_SD0_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum GPIO_QSPI_SD0_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum GPIO_QSPI_SS_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum GPIO_QSPI_SS_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum GPIO_QSPI_SS_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum GPIO_QSPI_SS_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum GPIO_QSPI_SCLK_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum GPIO_QSPI_SCLK_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum GPIO_QSPI_SCLK_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum GPIO_QSPI_SCLK_LEVEL_LOW_Field: ContiguousBitField {
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
                public var GPIO_QSPI_SD3_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_LOW)
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
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    self.raw.GPIO_QSPI_SD3_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Enable for proc0
    public var PROC0_INTE: Register<PROC0_INTE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct PROC0_INTE_Descriptor {
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_QSPI_SD3_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum GPIO_QSPI_SD3_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum GPIO_QSPI_SD3_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum GPIO_QSPI_SD3_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum GPIO_QSPI_SD2_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum GPIO_QSPI_SD2_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum GPIO_QSPI_SD2_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum GPIO_QSPI_SD2_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum GPIO_QSPI_SD1_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum GPIO_QSPI_SD1_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum GPIO_QSPI_SD1_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum GPIO_QSPI_SD1_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GPIO_QSPI_SD0_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GPIO_QSPI_SD0_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum GPIO_QSPI_SD0_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum GPIO_QSPI_SD0_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum GPIO_QSPI_SS_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum GPIO_QSPI_SS_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum GPIO_QSPI_SS_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum GPIO_QSPI_SS_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum GPIO_QSPI_SCLK_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum GPIO_QSPI_SCLK_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum GPIO_QSPI_SCLK_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum GPIO_QSPI_SCLK_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC0_INTE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PROC0_INTE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    self.raw.GPIO_QSPI_SD3_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Force for proc0
    public var PROC0_INTF: Register<PROC0_INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct PROC0_INTF_Descriptor {
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_QSPI_SD3_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum GPIO_QSPI_SD3_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum GPIO_QSPI_SD3_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum GPIO_QSPI_SD3_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum GPIO_QSPI_SD2_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum GPIO_QSPI_SD2_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum GPIO_QSPI_SD2_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum GPIO_QSPI_SD2_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum GPIO_QSPI_SD1_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum GPIO_QSPI_SD1_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum GPIO_QSPI_SD1_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum GPIO_QSPI_SD1_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GPIO_QSPI_SD0_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GPIO_QSPI_SD0_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum GPIO_QSPI_SD0_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum GPIO_QSPI_SD0_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum GPIO_QSPI_SS_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum GPIO_QSPI_SS_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum GPIO_QSPI_SS_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum GPIO_QSPI_SS_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum GPIO_QSPI_SCLK_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum GPIO_QSPI_SCLK_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum GPIO_QSPI_SCLK_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum GPIO_QSPI_SCLK_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC0_INTF_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PROC0_INTF_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    self.raw.GPIO_QSPI_SD3_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt status after masking & forcing for proc0
    public var PROC0_INTS: Register<PROC0_INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct PROC0_INTS_Descriptor {
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_QSPI_SD3_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum GPIO_QSPI_SD3_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum GPIO_QSPI_SD3_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum GPIO_QSPI_SD3_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum GPIO_QSPI_SD2_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum GPIO_QSPI_SD2_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum GPIO_QSPI_SD2_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum GPIO_QSPI_SD2_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum GPIO_QSPI_SD1_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum GPIO_QSPI_SD1_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum GPIO_QSPI_SD1_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum GPIO_QSPI_SD1_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GPIO_QSPI_SD0_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GPIO_QSPI_SD0_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum GPIO_QSPI_SD0_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum GPIO_QSPI_SD0_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum GPIO_QSPI_SS_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum GPIO_QSPI_SS_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum GPIO_QSPI_SS_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum GPIO_QSPI_SS_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum GPIO_QSPI_SCLK_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum GPIO_QSPI_SCLK_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum GPIO_QSPI_SCLK_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum GPIO_QSPI_SCLK_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC0_INTS_Descriptor

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
                public var GPIO_QSPI_SD3_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = PROC0_INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_LOW)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = PROC0_INTS_Descriptor
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

    /// Interrupt Enable for proc1
    public var PROC1_INTE: Register<PROC1_INTE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct PROC1_INTE_Descriptor {
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_QSPI_SD3_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum GPIO_QSPI_SD3_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum GPIO_QSPI_SD3_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum GPIO_QSPI_SD3_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum GPIO_QSPI_SD2_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum GPIO_QSPI_SD2_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum GPIO_QSPI_SD2_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum GPIO_QSPI_SD2_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum GPIO_QSPI_SD1_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum GPIO_QSPI_SD1_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum GPIO_QSPI_SD1_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum GPIO_QSPI_SD1_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GPIO_QSPI_SD0_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GPIO_QSPI_SD0_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum GPIO_QSPI_SD0_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum GPIO_QSPI_SD0_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum GPIO_QSPI_SS_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum GPIO_QSPI_SS_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum GPIO_QSPI_SS_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum GPIO_QSPI_SS_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum GPIO_QSPI_SCLK_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum GPIO_QSPI_SCLK_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum GPIO_QSPI_SCLK_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum GPIO_QSPI_SCLK_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC1_INTE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PROC1_INTE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    self.raw.GPIO_QSPI_SD3_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Force for proc1
    public var PROC1_INTF: Register<PROC1_INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct PROC1_INTF_Descriptor {
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_QSPI_SD3_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum GPIO_QSPI_SD3_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum GPIO_QSPI_SD3_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum GPIO_QSPI_SD3_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum GPIO_QSPI_SD2_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum GPIO_QSPI_SD2_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum GPIO_QSPI_SD2_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum GPIO_QSPI_SD2_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum GPIO_QSPI_SD1_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum GPIO_QSPI_SD1_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum GPIO_QSPI_SD1_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum GPIO_QSPI_SD1_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GPIO_QSPI_SD0_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GPIO_QSPI_SD0_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum GPIO_QSPI_SD0_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum GPIO_QSPI_SD0_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum GPIO_QSPI_SS_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum GPIO_QSPI_SS_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum GPIO_QSPI_SS_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum GPIO_QSPI_SS_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum GPIO_QSPI_SCLK_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum GPIO_QSPI_SCLK_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum GPIO_QSPI_SCLK_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum GPIO_QSPI_SCLK_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC1_INTF_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = PROC1_INTF_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    self.raw.GPIO_QSPI_SD3_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt status after masking & forcing for proc1
    public var PROC1_INTS: Register<PROC1_INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct PROC1_INTS_Descriptor {
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_QSPI_SD3_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum GPIO_QSPI_SD3_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum GPIO_QSPI_SD3_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum GPIO_QSPI_SD3_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum GPIO_QSPI_SD2_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum GPIO_QSPI_SD2_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum GPIO_QSPI_SD2_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum GPIO_QSPI_SD2_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum GPIO_QSPI_SD1_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum GPIO_QSPI_SD1_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum GPIO_QSPI_SD1_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum GPIO_QSPI_SD1_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GPIO_QSPI_SD0_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GPIO_QSPI_SD0_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum GPIO_QSPI_SD0_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum GPIO_QSPI_SD0_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum GPIO_QSPI_SS_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum GPIO_QSPI_SS_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum GPIO_QSPI_SS_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum GPIO_QSPI_SS_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum GPIO_QSPI_SCLK_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum GPIO_QSPI_SCLK_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum GPIO_QSPI_SCLK_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum GPIO_QSPI_SCLK_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PROC1_INTS_Descriptor

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
                public var GPIO_QSPI_SD3_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = PROC1_INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_LOW)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = PROC1_INTS_Descriptor
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

    /// Interrupt Enable for dormant_wake
    public var DORMANT_WAKE_INTE: Register<DORMANT_WAKE_INTE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x004c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x004c))
          #endif
        }
    }
    public struct DORMANT_WAKE_INTE_Descriptor {
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_QSPI_SD3_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum GPIO_QSPI_SD3_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum GPIO_QSPI_SD3_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum GPIO_QSPI_SD3_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum GPIO_QSPI_SD2_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum GPIO_QSPI_SD2_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum GPIO_QSPI_SD2_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum GPIO_QSPI_SD2_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum GPIO_QSPI_SD1_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum GPIO_QSPI_SD1_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum GPIO_QSPI_SD1_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum GPIO_QSPI_SD1_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GPIO_QSPI_SD0_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GPIO_QSPI_SD0_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum GPIO_QSPI_SD0_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum GPIO_QSPI_SD0_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum GPIO_QSPI_SS_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum GPIO_QSPI_SS_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum GPIO_QSPI_SS_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum GPIO_QSPI_SS_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum GPIO_QSPI_SCLK_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum GPIO_QSPI_SCLK_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum GPIO_QSPI_SCLK_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum GPIO_QSPI_SCLK_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DORMANT_WAKE_INTE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DORMANT_WAKE_INTE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    self.raw.GPIO_QSPI_SD3_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Force for dormant_wake
    public var DORMANT_WAKE_INTF: Register<DORMANT_WAKE_INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct DORMANT_WAKE_INTF_Descriptor {
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_QSPI_SD3_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum GPIO_QSPI_SD3_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum GPIO_QSPI_SD3_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum GPIO_QSPI_SD3_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum GPIO_QSPI_SD2_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum GPIO_QSPI_SD2_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum GPIO_QSPI_SD2_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum GPIO_QSPI_SD2_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum GPIO_QSPI_SD1_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum GPIO_QSPI_SD1_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum GPIO_QSPI_SD1_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum GPIO_QSPI_SD1_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GPIO_QSPI_SD0_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GPIO_QSPI_SD0_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum GPIO_QSPI_SD0_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum GPIO_QSPI_SD0_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum GPIO_QSPI_SS_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum GPIO_QSPI_SS_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum GPIO_QSPI_SS_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum GPIO_QSPI_SS_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum GPIO_QSPI_SCLK_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum GPIO_QSPI_SCLK_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum GPIO_QSPI_SCLK_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum GPIO_QSPI_SCLK_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DORMANT_WAKE_INTF_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DORMANT_WAKE_INTF_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    self.raw.GPIO_QSPI_SD3_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD3_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD2_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD1_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SD0_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SS_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_EDGE_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_LOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  self.raw.GPIO_QSPI_SCLK_LEVEL_LOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt status after masking & forcing for dormant_wake
    public var DORMANT_WAKE_INTS: Register<DORMANT_WAKE_INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct DORMANT_WAKE_INTS_Descriptor {
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_QSPI_SD3_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum GPIO_QSPI_SD3_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum GPIO_QSPI_SD3_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum GPIO_QSPI_SD3_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum GPIO_QSPI_SD2_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum GPIO_QSPI_SD2_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum GPIO_QSPI_SD2_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum GPIO_QSPI_SD2_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum GPIO_QSPI_SD1_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum GPIO_QSPI_SD1_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum GPIO_QSPI_SD1_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum GPIO_QSPI_SD1_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GPIO_QSPI_SD0_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GPIO_QSPI_SD0_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum GPIO_QSPI_SD0_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum GPIO_QSPI_SD0_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum GPIO_QSPI_SS_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum GPIO_QSPI_SS_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum GPIO_QSPI_SS_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum GPIO_QSPI_SS_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum GPIO_QSPI_SCLK_EDGE_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum GPIO_QSPI_SCLK_EDGE_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum GPIO_QSPI_SCLK_LEVEL_HIGH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum GPIO_QSPI_SCLK_LEVEL_LOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DORMANT_WAKE_INTS_Descriptor

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
                public var GPIO_QSPI_SD3_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_QSPI_SD3_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD3_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD2_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD1_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SD0_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SS_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_EDGE_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_HIGH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: UInt32 {
                @inlinable @inline(__always) get {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GPIO_QSPI_SCLK_LEVEL_LOW_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = DORMANT_WAKE_INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var GPIO_QSPI_SD3_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_HIGH_Field.self, Bool.self)
                    return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_HIGH)
                }
                }
              public var GPIO_QSPI_SD3_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD3_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD3_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD3_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD2_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD2_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD2_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD2_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD1_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD1_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD1_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD1_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SD0_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SD0_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SD0_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SD0_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SS_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SS_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SS_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SS_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SS_LEVEL_LOW)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_HIGH)
                }
              }
              public var GPIO_QSPI_SCLK_EDGE_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_EDGE_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_EDGE_LOW)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_HIGH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_HIGH_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_HIGH)
                }
              }
              public var GPIO_QSPI_SCLK_LEVEL_LOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GPIO_QSPI_SCLK_LEVEL_LOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.GPIO_QSPI_SCLK_LEVEL_LOW)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = DORMANT_WAKE_INTS_Descriptor
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

extension IO_QSPI.GPIO_QSPI_SCLK_STATUS_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SCLK_CTRL_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SS_STATUS_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SS_CTRL_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SD0_STATUS_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SD0_CTRL_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SD1_STATUS_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SD1_CTRL_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SD2_STATUS_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SD2_CTRL_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SD3_STATUS_Descriptor: RegisterValue {
}

extension IO_QSPI.GPIO_QSPI_SD3_CTRL_Descriptor: RegisterValue {
}

extension IO_QSPI.INTR_Descriptor: RegisterValue {
}

extension IO_QSPI.PROC0_INTE_Descriptor: RegisterValue {
}

extension IO_QSPI.PROC0_INTF_Descriptor: RegisterValue {
}

extension IO_QSPI.PROC0_INTS_Descriptor: RegisterValue {
}

extension IO_QSPI.PROC1_INTE_Descriptor: RegisterValue {
}

extension IO_QSPI.PROC1_INTF_Descriptor: RegisterValue {
}

extension IO_QSPI.PROC1_INTS_Descriptor: RegisterValue {
}

extension IO_QSPI.DORMANT_WAKE_INTE_Descriptor: RegisterValue {
}

extension IO_QSPI.DORMANT_WAKE_INTF_Descriptor: RegisterValue {
}

extension IO_QSPI.DORMANT_WAKE_INTS_Descriptor: RegisterValue {
}
