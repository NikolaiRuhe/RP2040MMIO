import MMIO
import MMIOExtensions

/// USB FS/LS controller device registers
public struct USBCTRL_REGS {

    public static var `default`: Self { .init(unsafeAddress: 0x50110000) }

    /// Device address and endpoint control
    public var ADDR_ENDP: Register<ADDR_ENDP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct ADDR_ENDP_Descriptor {
        @available(*, unavailable)
        /// Device endpoint to send data to. Only valid for HOST mode.
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In device mode, the address that the device should respond to. Set in response to a SET_ADDR setup packet from the host. In host mode set to the address of the device to communicate with.
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                    ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                    self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 1. Only valid for HOST mode.
    public var ADDR_ENDP1: Register<ADDR_ENDP1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct ADDR_ENDP1_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 2. Only valid for HOST mode.
    public var ADDR_ENDP2: Register<ADDR_ENDP2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct ADDR_ENDP2_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP2_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 3. Only valid for HOST mode.
    public var ADDR_ENDP3: Register<ADDR_ENDP3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct ADDR_ENDP3_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP3_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 4. Only valid for HOST mode.
    public var ADDR_ENDP4: Register<ADDR_ENDP4_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct ADDR_ENDP4_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP4_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP4_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 5. Only valid for HOST mode.
    public var ADDR_ENDP5: Register<ADDR_ENDP5_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct ADDR_ENDP5_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP5_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP5_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 6. Only valid for HOST mode.
    public var ADDR_ENDP6: Register<ADDR_ENDP6_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct ADDR_ENDP6_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP6_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP6_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 7. Only valid for HOST mode.
    public var ADDR_ENDP7: Register<ADDR_ENDP7_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct ADDR_ENDP7_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP7_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP7_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 8. Only valid for HOST mode.
    public var ADDR_ENDP8: Register<ADDR_ENDP8_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct ADDR_ENDP8_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP8_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP8_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 9. Only valid for HOST mode.
    public var ADDR_ENDP9: Register<ADDR_ENDP9_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct ADDR_ENDP9_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP9_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP9_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 10. Only valid for HOST mode.
    public var ADDR_ENDP10: Register<ADDR_ENDP10_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct ADDR_ENDP10_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP10_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP10_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 11. Only valid for HOST mode.
    public var ADDR_ENDP11: Register<ADDR_ENDP11_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct ADDR_ENDP11_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP11_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP11_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 12. Only valid for HOST mode.
    public var ADDR_ENDP12: Register<ADDR_ENDP12_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct ADDR_ENDP12_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP12_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP12_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 13. Only valid for HOST mode.
    public var ADDR_ENDP13: Register<ADDR_ENDP13_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct ADDR_ENDP13_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP13_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP13_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 14. Only valid for HOST mode.
    public var ADDR_ENDP14: Register<ADDR_ENDP14_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct ADDR_ENDP14_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP14_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP14_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt endpoint 15. Only valid for HOST mode.
    public var ADDR_ENDP15: Register<ADDR_ENDP15_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct ADDR_ENDP15_Descriptor {
        @available(*, unavailable)
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        public var INTEP_PREAMBLE: INTEP_PREAMBLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direction of the interrupt endpoint. In=0, Out=1
        public var INTEP_DIR: INTEP_DIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Endpoint number of the interrupt endpoint
        public var ENDPOINT: ENDPOINT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device address
        public var ADDRESS: ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTEP_PREAMBLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum INTEP_DIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum ENDPOINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 7
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ADDR_ENDP15_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: UInt32 {
                @inlinable @inline(__always) get {
                    INTEP_PREAMBLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTEP_PREAMBLE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var INTEP_DIR: UInt32 {
                @inlinable @inline(__always) get {
                  INTEP_DIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTEP_DIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = ADDR_ENDP15_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTEP_PREAMBLE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    return Bool(storage: self.raw.INTEP_PREAMBLE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTEP_PREAMBLE_Field.self, Bool.self)
                    self.raw.INTEP_PREAMBLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var INTEP_DIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTEP_DIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTEP_DIR_Field.self, Bool.self)
                  self.raw.INTEP_DIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ENDPOINT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_Field.self, BitField4.self)
                  self.raw.ENDPOINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDRESS: BitField7 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  return BitField7(storage: self.raw.ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDRESS_Field.self, BitField7.self)
                  self.raw.ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Main control register
    public var MAIN_CTRL: Register<MAIN_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct MAIN_CTRL_Descriptor {
        @available(*, unavailable)
        /// Reduced timings for simulation
        public var SIM_TIMING: SIM_TIMING_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device mode = 0, Host mode = 1
        public var HOST_NDEVICE: HOST_NDEVICE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable controller
        public var CONTROLLER_EN: CONTROLLER_EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SIM_TIMING_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum HOST_NDEVICE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum CONTROLLER_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = MAIN_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SIM_TIMING: UInt32 {
                @inlinable @inline(__always) get {
                    SIM_TIMING_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SIM_TIMING_Field.insert(newValue, into: &self.storage)
                }
                }
              public var HOST_NDEVICE: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_NDEVICE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_NDEVICE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CONTROLLER_EN: UInt32 {
                @inlinable @inline(__always) get {
                  CONTROLLER_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CONTROLLER_EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = MAIN_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SIM_TIMING: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SIM_TIMING_Field.self, Bool.self)
                    return Bool(storage: self.raw.SIM_TIMING)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SIM_TIMING_Field.self, Bool.self)
                    self.raw.SIM_TIMING = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var HOST_NDEVICE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_NDEVICE_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_NDEVICE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HOST_NDEVICE_Field.self, Bool.self)
                  self.raw.HOST_NDEVICE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CONTROLLER_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CONTROLLER_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.CONTROLLER_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CONTROLLER_EN_Field.self, Bool.self)
                  self.raw.CONTROLLER_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Set the SOF (Start of Frame) frame number in the host controller. The SOF packet is sent every 1ms and the host will increment the frame number by 1 each time.
    public var SOF_WR: Register<SOF_WR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct SOF_WR_Descriptor {
        @available(*, unavailable)
        public var COUNT: COUNT_Field {
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
          public static let bitRange = 0 ..< 11
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SOF_WR_Descriptor

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
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SOF_WR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SOF_WR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var COUNT: BitField11 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(COUNT_Field.self, BitField11.self)
                    return BitField11(storage: self.raw.COUNT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(COUNT_Field.self, BitField11.self)
                    self.raw.COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read the last SOF (Start of Frame) frame number seen. In device mode the last SOF received from the host. In host mode the last SOF sent by the host.
    public var SOF_RD: Register<SOF_RD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct SOF_RD_Descriptor {
        @available(*, unavailable)
        public var COUNT: COUNT_Field {
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
          public static let bitRange = 0 ..< 11
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SOF_RD_Descriptor

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
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SOF_RD_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var COUNT: BitField11 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(COUNT_Field.self, BitField11.self)
                    return BitField11(storage: self.raw.COUNT)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SOF_RD_Descriptor
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

    /// SIE control register
    public var SIE_CTRL: Register<SIE_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x004c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x004c))
          #endif
        }
    }
    public struct SIE_CTRL_Descriptor {
        @available(*, unavailable)
        /// Device: Set bit in EP_STATUS_STALL_NAK when EP0 sends a STALL
        public var EP0_INT_STALL: EP0_INT_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: EP0 single buffered = 0, double buffered = 1
        public var EP0_DOUBLE_BUF: EP0_DOUBLE_BUF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: Set bit in BUFF_STATUS for every buffer completed on EP0
        public var EP0_INT_1BUF: EP0_INT_1BUF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: Set bit in BUFF_STATUS for every 2 buffers completed on EP0
        public var EP0_INT_2BUF: EP0_INT_2BUF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: Set bit in EP_STATUS_STALL_NAK when EP0 sends a NAK
        public var EP0_INT_NAK: EP0_INT_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direct bus drive enable
        public var DIRECT_EN: DIRECT_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direct control of DP
        public var DIRECT_DP: DIRECT_DP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Direct control of DM
        public var DIRECT_DM: DIRECT_DM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Power down bus transceiver
        public var TRANSCEIVER_PD: TRANSCEIVER_PD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: Pull-up strength (0=1K2, 1=2k3)
        public var RPU_OPT: RPU_OPT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: Enable pull up resistor
        public var PULLUP_EN: PULLUP_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Enable pull down resistors
        public var PULLDOWN_EN: PULLDOWN_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Reset bus
        public var RESET_BUS: RESET_BUS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: Remote wakeup. Device can initiate its own resume after suspend.
        public var RESUME: RESUME_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Enable VBUS
        public var VBUS_EN: VBUS_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Enable keep alive packet (for low speed bus)
        public var KEEP_ALIVE_EN: KEEP_ALIVE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Enable SOF generation (for full speed bus)
        public var SOF_EN: SOF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Delay packet(s) until after SOF
        public var SOF_SYNC: SOF_SYNC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Preable enable for LS device on FS hub
        public var PREAMBLE_EN: PREAMBLE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Stop transaction
        public var STOP_TRANS: STOP_TRANS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Receive transaction (IN to host)
        public var RECEIVE_DATA: RECEIVE_DATA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Send transaction (OUT from host)
        public var SEND_DATA: SEND_DATA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Send Setup packet
        public var SEND_SETUP: SEND_SETUP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Start transaction
        public var START_TRANS: START_TRANS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP0_INT_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum EP0_DOUBLE_BUF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum EP0_INT_1BUF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum EP0_INT_2BUF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum EP0_INT_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum DIRECT_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum DIRECT_DP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum DIRECT_DM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum TRANSCEIVER_PD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum RPU_OPT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum PULLUP_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum PULLDOWN_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum RESET_BUS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESUME_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum VBUS_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum KEEP_ALIVE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum SOF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum SOF_SYNC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum PREAMBLE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum STOP_TRANS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum RECEIVE_DATA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum SEND_DATA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SEND_SETUP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum START_TRANS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SIE_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var EP0_INT_STALL: UInt32 {
                @inlinable @inline(__always) get {
                    EP0_INT_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP0_INT_STALL_Field.insert(newValue, into: &self.storage)
                }
                }
              public var EP0_DOUBLE_BUF: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_DOUBLE_BUF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_DOUBLE_BUF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_INT_1BUF: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_INT_1BUF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_INT_1BUF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_INT_2BUF: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_INT_2BUF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_INT_2BUF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_INT_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_INT_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_INT_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIRECT_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DIRECT_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIRECT_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIRECT_DP: UInt32 {
                @inlinable @inline(__always) get {
                  DIRECT_DP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIRECT_DP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIRECT_DM: UInt32 {
                @inlinable @inline(__always) get {
                  DIRECT_DM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIRECT_DM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TRANSCEIVER_PD: UInt32 {
                @inlinable @inline(__always) get {
                  TRANSCEIVER_PD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TRANSCEIVER_PD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RPU_OPT: UInt32 {
                @inlinable @inline(__always) get {
                  RPU_OPT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RPU_OPT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PULLUP_EN: UInt32 {
                @inlinable @inline(__always) get {
                  PULLUP_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PULLUP_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PULLDOWN_EN: UInt32 {
                @inlinable @inline(__always) get {
                  PULLDOWN_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PULLDOWN_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET_BUS: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_BUS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_BUS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESUME: UInt32 {
                @inlinable @inline(__always) get {
                  RESUME_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESUME_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_EN: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var KEEP_ALIVE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  KEEP_ALIVE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  KEEP_ALIVE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SOF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SOF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SOF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SOF_SYNC: UInt32 {
                @inlinable @inline(__always) get {
                  SOF_SYNC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SOF_SYNC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PREAMBLE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  PREAMBLE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PREAMBLE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STOP_TRANS: UInt32 {
                @inlinable @inline(__always) get {
                  STOP_TRANS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STOP_TRANS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RECEIVE_DATA: UInt32 {
                @inlinable @inline(__always) get {
                  RECEIVE_DATA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RECEIVE_DATA_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SEND_DATA: UInt32 {
                @inlinable @inline(__always) get {
                  SEND_DATA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SEND_DATA_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SEND_SETUP: UInt32 {
                @inlinable @inline(__always) get {
                  SEND_SETUP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SEND_SETUP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var START_TRANS: UInt32 {
                @inlinable @inline(__always) get {
                  START_TRANS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  START_TRANS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SIE_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var EP0_INT_STALL: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP0_INT_STALL_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP0_INT_STALL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(EP0_INT_STALL_Field.self, Bool.self)
                    self.raw.EP0_INT_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var EP0_DOUBLE_BUF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_DOUBLE_BUF_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_DOUBLE_BUF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_DOUBLE_BUF_Field.self, Bool.self)
                  self.raw.EP0_DOUBLE_BUF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_INT_1BUF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_INT_1BUF_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_INT_1BUF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_INT_1BUF_Field.self, Bool.self)
                  self.raw.EP0_INT_1BUF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_INT_2BUF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_INT_2BUF_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_INT_2BUF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_INT_2BUF_Field.self, Bool.self)
                  self.raw.EP0_INT_2BUF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_INT_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_INT_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_INT_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_INT_NAK_Field.self, Bool.self)
                  self.raw.EP0_INT_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIRECT_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIRECT_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DIRECT_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIRECT_EN_Field.self, Bool.self)
                  self.raw.DIRECT_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIRECT_DP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIRECT_DP_Field.self, Bool.self)
                  return Bool(storage: self.raw.DIRECT_DP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIRECT_DP_Field.self, Bool.self)
                  self.raw.DIRECT_DP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIRECT_DM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIRECT_DM_Field.self, Bool.self)
                  return Bool(storage: self.raw.DIRECT_DM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIRECT_DM_Field.self, Bool.self)
                  self.raw.DIRECT_DM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TRANSCEIVER_PD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TRANSCEIVER_PD_Field.self, Bool.self)
                  return Bool(storage: self.raw.TRANSCEIVER_PD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TRANSCEIVER_PD_Field.self, Bool.self)
                  self.raw.TRANSCEIVER_PD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RPU_OPT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RPU_OPT_Field.self, Bool.self)
                  return Bool(storage: self.raw.RPU_OPT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RPU_OPT_Field.self, Bool.self)
                  self.raw.RPU_OPT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PULLUP_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PULLUP_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.PULLUP_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PULLUP_EN_Field.self, Bool.self)
                  self.raw.PULLUP_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PULLDOWN_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PULLDOWN_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.PULLDOWN_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PULLDOWN_EN_Field.self, Bool.self)
                  self.raw.PULLDOWN_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET_BUS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_BUS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET_BUS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_BUS_Field.self, Bool.self)
                  self.raw.RESET_BUS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESUME: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESUME_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESUME)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESUME_Field.self, Bool.self)
                  self.raw.RESUME = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var VBUS_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(VBUS_EN_Field.self, Bool.self)
                  self.raw.VBUS_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var KEEP_ALIVE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(KEEP_ALIVE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.KEEP_ALIVE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(KEEP_ALIVE_EN_Field.self, Bool.self)
                  self.raw.KEEP_ALIVE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SOF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SOF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SOF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SOF_EN_Field.self, Bool.self)
                  self.raw.SOF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SOF_SYNC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SOF_SYNC_Field.self, Bool.self)
                  return Bool(storage: self.raw.SOF_SYNC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SOF_SYNC_Field.self, Bool.self)
                  self.raw.SOF_SYNC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PREAMBLE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PREAMBLE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.PREAMBLE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PREAMBLE_EN_Field.self, Bool.self)
                  self.raw.PREAMBLE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STOP_TRANS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STOP_TRANS_Field.self, Bool.self)
                  return Bool(storage: self.raw.STOP_TRANS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STOP_TRANS_Field.self, Bool.self)
                  self.raw.STOP_TRANS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RECEIVE_DATA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RECEIVE_DATA_Field.self, Bool.self)
                  return Bool(storage: self.raw.RECEIVE_DATA)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RECEIVE_DATA_Field.self, Bool.self)
                  self.raw.RECEIVE_DATA = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SEND_DATA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SEND_DATA_Field.self, Bool.self)
                  return Bool(storage: self.raw.SEND_DATA)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SEND_DATA_Field.self, Bool.self)
                  self.raw.SEND_DATA = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SEND_SETUP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SEND_SETUP_Field.self, Bool.self)
                  return Bool(storage: self.raw.SEND_SETUP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SEND_SETUP_Field.self, Bool.self)
                  self.raw.SEND_SETUP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var START_TRANS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(START_TRANS_Field.self, Bool.self)
                  return Bool(storage: self.raw.START_TRANS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(START_TRANS_Field.self, Bool.self)
                  self.raw.START_TRANS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// SIE status register
    public var SIE_STATUS: Register<SIE_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct SIE_STATUS_Descriptor {
        @available(*, unavailable)
        /// Data Sequence Error.
        /// The device can raise a sequence error in the following conditions:
        /// * A SETUP packet is received followed by a DATA1 packet (data phase should always be DATA0) * An OUT packet is received from the host but doesn't match the data pid in the buffer control register read from DPSRAM
        /// The host can raise a data sequence error in the following conditions:
        /// * An IN packet from the device has the wrong data PID
        public var DATA_SEQ_ERROR: DATA_SEQ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// ACK received. Raised by both host and device.
        public var ACK_REC: ACK_REC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: STALL received
        public var STALL_REC: STALL_REC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: NAK received
        public var NAK_REC: NAK_REC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// RX timeout is raised by both the host and device if an ACK is not received in the maximum time specified by the USB spec.
        public var RX_TIMEOUT: RX_TIMEOUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// RX overflow is raised by the Serial RX engine if the incoming data is too fast.
        public var RX_OVERFLOW: RX_OVERFLOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Bit Stuff Error. Raised by the Serial RX engine.
        public var BIT_STUFF_ERROR: BIT_STUFF_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// CRC Error. Raised by the Serial RX engine.
        public var CRC_ERROR: CRC_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: bus reset received
        public var BUS_RESET: BUS_RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transaction complete.
        /// Raised by device if:
        /// * An IN or OUT packet is sent with the `LAST_BUFF` bit set in the buffer control register
        /// Raised by host if:
        /// * A setup packet is sent when no data in or data out transaction follows * An IN packet is received and the `LAST_BUFF` bit is set in the buffer control register * An IN packet is received with zero length * An OUT packet is sent and the `LAST_BUFF` bit is set
        public var TRANS_COMPLETE: TRANS_COMPLETE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: Setup packet received
        public var SETUP_REC: SETUP_REC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: connected
        public var CONNECTED: CONNECTED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: Device has initiated a remote resume. Device: host has initiated a resume.
        public var RESUME: RESUME_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// VBUS over current detected
        public var VBUS_OVER_CURR: VBUS_OVER_CURR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: device speed. Disconnected = 00, LS = 01, FS = 10
        public var SPEED: SPEED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Bus in suspended state. Valid for device and host. Host and device will go into suspend if neither Keep Alive / SOF frames are enabled.
        public var SUSPENDED: SUSPENDED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// USB bus line state
        public var LINE_STATE: LINE_STATE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device: VBUS Detected
        public var VBUS_DETECTED: VBUS_DETECTED_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DATA_SEQ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum ACK_REC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum STALL_REC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum NAK_REC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum RX_TIMEOUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum RX_OVERFLOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum BIT_STUFF_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum CRC_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum BUS_RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum TRANS_COMPLETE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum SETUP_REC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum CONNECTED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum RESUME_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum VBUS_OVER_CURR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum SPEED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public enum SUSPENDED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum LINE_STATE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum VBUS_DETECTED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SIE_STATUS_Descriptor

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
                public var DATA_SEQ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    DATA_SEQ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DATA_SEQ_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ACK_REC: UInt32 {
                @inlinable @inline(__always) get {
                  ACK_REC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ACK_REC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STALL_REC: UInt32 {
                @inlinable @inline(__always) get {
                  STALL_REC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STALL_REC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var NAK_REC: UInt32 {
                @inlinable @inline(__always) get {
                  NAK_REC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  NAK_REC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_TIMEOUT: UInt32 {
                @inlinable @inline(__always) get {
                  RX_TIMEOUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_TIMEOUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_OVERFLOW: UInt32 {
                @inlinable @inline(__always) get {
                  RX_OVERFLOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_OVERFLOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BIT_STUFF_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  BIT_STUFF_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BIT_STUFF_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CRC_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  CRC_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CRC_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUS_RESET: UInt32 {
                @inlinable @inline(__always) get {
                  BUS_RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUS_RESET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TRANS_COMPLETE: UInt32 {
                @inlinable @inline(__always) get {
                  TRANS_COMPLETE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TRANS_COMPLETE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SETUP_REC: UInt32 {
                @inlinable @inline(__always) get {
                  SETUP_REC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SETUP_REC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CONNECTED: UInt32 {
                @inlinable @inline(__always) get {
                  CONNECTED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CONNECTED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESUME: UInt32 {
                @inlinable @inline(__always) get {
                  RESUME_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESUME_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_OVER_CURR: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_OVER_CURR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_OVER_CURR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SPEED: UInt32 {
                @inlinable @inline(__always) get {
                  SPEED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SPEED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SUSPENDED: UInt32 {
                @inlinable @inline(__always) get {
                  SUSPENDED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SUSPENDED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LINE_STATE: UInt32 {
                @inlinable @inline(__always) get {
                  LINE_STATE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LINE_STATE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_DETECTED: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_DETECTED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_DETECTED_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SIE_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var DATA_SEQ_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DATA_SEQ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.DATA_SEQ_ERROR)
                }
                }
              public var ACK_REC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ACK_REC_Field.self, Bool.self)
                  return Bool(storage: self.raw.ACK_REC)
                }
              }
              public var STALL_REC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STALL_REC_Field.self, Bool.self)
                  return Bool(storage: self.raw.STALL_REC)
                }
              }
              public var NAK_REC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(NAK_REC_Field.self, Bool.self)
                  return Bool(storage: self.raw.NAK_REC)
                }
              }
              public var RX_TIMEOUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_TIMEOUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.RX_TIMEOUT)
                }
              }
              public var RX_OVERFLOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_OVERFLOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.RX_OVERFLOW)
                }
              }
              public var BIT_STUFF_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BIT_STUFF_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.BIT_STUFF_ERROR)
                }
              }
              public var CRC_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CRC_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.CRC_ERROR)
                }
              }
              public var BUS_RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUS_RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUS_RESET)
                }
              }
              public var TRANS_COMPLETE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TRANS_COMPLETE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TRANS_COMPLETE)
                }
              }
              public var SETUP_REC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SETUP_REC_Field.self, Bool.self)
                  return Bool(storage: self.raw.SETUP_REC)
                }
              }
              public var CONNECTED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CONNECTED_Field.self, Bool.self)
                  return Bool(storage: self.raw.CONNECTED)
                }
              }
              public var RESUME: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESUME_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESUME)
                }
              }
              public var VBUS_OVER_CURR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_OVER_CURR_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_OVER_CURR)
                }
              }
              public var SPEED: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SPEED_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.SPEED)
                }
              }
              public var SUSPENDED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SUSPENDED_Field.self, Bool.self)
                  return Bool(storage: self.raw.SUSPENDED)
                }
              }
              public var LINE_STATE: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LINE_STATE_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.LINE_STATE)
                }
              }
              public var VBUS_DETECTED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_DETECTED_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_DETECTED)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SIE_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var DATA_SEQ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DATA_SEQ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.DATA_SEQ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DATA_SEQ_ERROR_Field.self, Bool.self)
                    self.raw.DATA_SEQ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ACK_REC: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ACK_REC_Field.self, Bool.self)
                  return Bool(storage: self.raw.ACK_REC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ACK_REC_Field.self, Bool.self)
                  self.raw.ACK_REC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STALL_REC: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STALL_REC_Field.self, Bool.self)
                  return Bool(storage: self.raw.STALL_REC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STALL_REC_Field.self, Bool.self)
                  self.raw.STALL_REC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var NAK_REC: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(NAK_REC_Field.self, Bool.self)
                  return Bool(storage: self.raw.NAK_REC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(NAK_REC_Field.self, Bool.self)
                  self.raw.NAK_REC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RX_TIMEOUT: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_TIMEOUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.RX_TIMEOUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RX_TIMEOUT_Field.self, Bool.self)
                  self.raw.RX_TIMEOUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RX_OVERFLOW: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_OVERFLOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.RX_OVERFLOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RX_OVERFLOW_Field.self, Bool.self)
                  self.raw.RX_OVERFLOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BIT_STUFF_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BIT_STUFF_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.BIT_STUFF_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BIT_STUFF_ERROR_Field.self, Bool.self)
                  self.raw.BIT_STUFF_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CRC_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CRC_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.CRC_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CRC_ERROR_Field.self, Bool.self)
                  self.raw.CRC_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUS_RESET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUS_RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUS_RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUS_RESET_Field.self, Bool.self)
                  self.raw.BUS_RESET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TRANS_COMPLETE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TRANS_COMPLETE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TRANS_COMPLETE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TRANS_COMPLETE_Field.self, Bool.self)
                  self.raw.TRANS_COMPLETE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SETUP_REC: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SETUP_REC_Field.self, Bool.self)
                  return Bool(storage: self.raw.SETUP_REC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SETUP_REC_Field.self, Bool.self)
                  self.raw.SETUP_REC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CONNECTED: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CONNECTED_Field.self, Bool.self)
                  return Bool(storage: self.raw.CONNECTED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CONNECTED_Field.self, Bool.self)
                  self.raw.CONNECTED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESUME: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESUME_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESUME)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESUME_Field.self, Bool.self)
                  self.raw.RESUME = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SPEED: BitField2 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SPEED_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.SPEED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SPEED_Field.self, BitField2.self)
                  self.raw.SPEED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SUSPENDED: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SUSPENDED_Field.self, Bool.self)
                  return Bool(storage: self.raw.SUSPENDED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SUSPENDED_Field.self, Bool.self)
                  self.raw.SUSPENDED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// interrupt endpoint control register
    public var INT_EP_CTRL: Register<INT_EP_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct INT_EP_CTRL_Descriptor {
        @available(*, unavailable)
        /// Host: Enable interrupt endpoint 1 -> 15
        public var INT_EP_ACTIVE: INT_EP_ACTIVE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_EP_ACTIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INT_EP_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT_EP_ACTIVE: UInt32 {
                @inlinable @inline(__always) get {
                    INT_EP_ACTIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_EP_ACTIVE_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INT_EP_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT_EP_ACTIVE: BitField15 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_EP_ACTIVE_Field.self, BitField15.self)
                    return BitField15(storage: self.raw.INT_EP_ACTIVE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_EP_ACTIVE_Field.self, BitField15.self)
                    self.raw.INT_EP_ACTIVE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Buffer status register. A bit set here indicates that a buffer has completed on the endpoint (if the buffer interrupt is enabled). It is possible for 2 buffers to be completed, so clearing the buffer status bit may instantly re set it on the next clock cycle.
    public var BUFF_STATUS: Register<BUFF_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0058), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0058))
          #endif
        }
    }
    public struct BUFF_STATUS_Descriptor {
        @available(*, unavailable)
        public var EP15_OUT: EP15_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP15_IN: EP15_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP14_OUT: EP14_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP14_IN: EP14_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP13_OUT: EP13_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP13_IN: EP13_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP12_OUT: EP12_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP12_IN: EP12_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP11_OUT: EP11_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP11_IN: EP11_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP10_OUT: EP10_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP10_IN: EP10_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP9_OUT: EP9_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP9_IN: EP9_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP8_OUT: EP8_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP8_IN: EP8_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP7_OUT: EP7_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP7_IN: EP7_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP6_OUT: EP6_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP6_IN: EP6_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP5_OUT: EP5_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP5_IN: EP5_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP4_OUT: EP4_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP4_IN: EP4_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP3_OUT: EP3_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP3_IN: EP3_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP2_OUT: EP2_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP2_IN: EP2_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP1_OUT: EP1_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP1_IN: EP1_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_OUT: EP0_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_IN: EP0_IN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP15_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum EP15_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum EP14_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum EP14_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum EP13_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum EP13_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum EP12_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum EP12_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum EP11_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum EP11_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum EP10_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum EP10_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum EP9_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum EP9_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum EP8_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum EP8_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum EP7_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum EP7_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum EP6_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum EP6_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum EP5_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum EP5_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum EP4_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum EP4_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum EP3_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum EP3_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum EP2_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum EP2_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum EP1_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum EP1_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum EP0_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EP0_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = BUFF_STATUS_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var EP15_OUT: UInt32 {
                @inlinable @inline(__always) get {
                    EP15_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP15_OUT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var EP15_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP15_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP15_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP14_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP14_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP14_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP14_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP14_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP14_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP13_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP13_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP13_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP13_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP13_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP13_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP12_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP12_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP12_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP12_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP12_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP12_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP11_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP11_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP11_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP11_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP11_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP11_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP10_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP10_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP10_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP10_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP10_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP10_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP9_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP9_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP9_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP9_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP9_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP9_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP8_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP8_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP8_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP8_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP8_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP8_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP7_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP7_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP7_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP7_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP7_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP7_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP6_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP6_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP6_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP6_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP6_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP6_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP5_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP5_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP5_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP5_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP5_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP5_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP4_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP4_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP4_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP4_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP4_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP4_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP3_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP3_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP3_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP3_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP3_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP3_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP2_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP2_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP2_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP2_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP2_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP2_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP1_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP1_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP1_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP1_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP1_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP1_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_IN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = BUFF_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var EP15_OUT: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP15_OUT_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP15_OUT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(EP15_OUT_Field.self, Bool.self)
                    self.raw.EP15_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var EP15_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP15_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP15_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP15_IN_Field.self, Bool.self)
                  self.raw.EP15_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP14_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP14_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP14_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP14_OUT_Field.self, Bool.self)
                  self.raw.EP14_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP14_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP14_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP14_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP14_IN_Field.self, Bool.self)
                  self.raw.EP14_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP13_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP13_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP13_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP13_OUT_Field.self, Bool.self)
                  self.raw.EP13_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP13_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP13_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP13_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP13_IN_Field.self, Bool.self)
                  self.raw.EP13_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP12_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP12_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP12_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP12_OUT_Field.self, Bool.self)
                  self.raw.EP12_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP12_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP12_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP12_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP12_IN_Field.self, Bool.self)
                  self.raw.EP12_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP11_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP11_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP11_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP11_OUT_Field.self, Bool.self)
                  self.raw.EP11_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP11_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP11_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP11_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP11_IN_Field.self, Bool.self)
                  self.raw.EP11_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP10_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP10_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP10_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP10_OUT_Field.self, Bool.self)
                  self.raw.EP10_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP10_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP10_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP10_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP10_IN_Field.self, Bool.self)
                  self.raw.EP10_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP9_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP9_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP9_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP9_OUT_Field.self, Bool.self)
                  self.raw.EP9_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP9_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP9_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP9_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP9_IN_Field.self, Bool.self)
                  self.raw.EP9_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP8_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP8_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP8_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP8_OUT_Field.self, Bool.self)
                  self.raw.EP8_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP8_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP8_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP8_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP8_IN_Field.self, Bool.self)
                  self.raw.EP8_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP7_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP7_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP7_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP7_OUT_Field.self, Bool.self)
                  self.raw.EP7_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP7_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP7_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP7_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP7_IN_Field.self, Bool.self)
                  self.raw.EP7_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP6_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP6_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP6_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP6_OUT_Field.self, Bool.self)
                  self.raw.EP6_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP6_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP6_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP6_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP6_IN_Field.self, Bool.self)
                  self.raw.EP6_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP5_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP5_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP5_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP5_OUT_Field.self, Bool.self)
                  self.raw.EP5_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP5_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP5_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP5_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP5_IN_Field.self, Bool.self)
                  self.raw.EP5_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP4_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP4_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP4_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP4_OUT_Field.self, Bool.self)
                  self.raw.EP4_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP4_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP4_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP4_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP4_IN_Field.self, Bool.self)
                  self.raw.EP4_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP3_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP3_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP3_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP3_OUT_Field.self, Bool.self)
                  self.raw.EP3_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP3_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP3_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP3_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP3_IN_Field.self, Bool.self)
                  self.raw.EP3_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP2_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP2_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP2_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP2_OUT_Field.self, Bool.self)
                  self.raw.EP2_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP2_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP2_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP2_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP2_IN_Field.self, Bool.self)
                  self.raw.EP2_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP1_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP1_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP1_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP1_OUT_Field.self, Bool.self)
                  self.raw.EP1_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP1_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP1_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP1_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP1_IN_Field.self, Bool.self)
                  self.raw.EP1_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                  self.raw.EP0_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  self.raw.EP0_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Which of the double buffers should be handled. Only valid if using an interrupt per buffer (i.e. not per 2 buffers). Not valid for host interrupt endpoint polling because they are only single buffered.
    public var BUFF_CPU_SHOULD_HANDLE: Register<BUFF_CPU_SHOULD_HANDLE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x005c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x005c))
          #endif
        }
    }
    public struct BUFF_CPU_SHOULD_HANDLE_Descriptor {
        @available(*, unavailable)
        public var EP15_OUT: EP15_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP15_IN: EP15_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP14_OUT: EP14_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP14_IN: EP14_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP13_OUT: EP13_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP13_IN: EP13_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP12_OUT: EP12_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP12_IN: EP12_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP11_OUT: EP11_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP11_IN: EP11_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP10_OUT: EP10_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP10_IN: EP10_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP9_OUT: EP9_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP9_IN: EP9_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP8_OUT: EP8_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP8_IN: EP8_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP7_OUT: EP7_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP7_IN: EP7_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP6_OUT: EP6_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP6_IN: EP6_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP5_OUT: EP5_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP5_IN: EP5_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP4_OUT: EP4_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP4_IN: EP4_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP3_OUT: EP3_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP3_IN: EP3_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP2_OUT: EP2_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP2_IN: EP2_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP1_OUT: EP1_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP1_IN: EP1_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_OUT: EP0_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_IN: EP0_IN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP15_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum EP15_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum EP14_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum EP14_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum EP13_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum EP13_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum EP12_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum EP12_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum EP11_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum EP11_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum EP10_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum EP10_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum EP9_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum EP9_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum EP8_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum EP8_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum EP7_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum EP7_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum EP6_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum EP6_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum EP5_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum EP5_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum EP4_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum EP4_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum EP3_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum EP3_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum EP2_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum EP2_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum EP1_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum EP1_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum EP0_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EP0_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = BUFF_CPU_SHOULD_HANDLE_Descriptor

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
                public var EP15_OUT: UInt32 {
                @inlinable @inline(__always) get {
                    EP15_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP15_OUT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var EP15_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP15_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP15_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP14_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP14_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP14_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP14_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP14_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP14_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP13_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP13_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP13_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP13_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP13_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP13_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP12_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP12_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP12_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP12_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP12_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP12_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP11_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP11_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP11_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP11_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP11_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP11_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP10_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP10_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP10_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP10_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP10_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP10_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP9_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP9_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP9_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP9_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP9_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP9_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP8_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP8_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP8_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP8_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP8_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP8_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP7_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP7_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP7_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP7_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP7_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP7_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP6_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP6_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP6_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP6_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP6_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP6_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP5_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP5_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP5_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP5_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP5_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP5_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP4_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP4_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP4_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP4_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP4_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP4_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP3_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP3_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP3_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP3_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP3_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP3_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP2_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP2_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP2_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP2_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP2_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP2_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP1_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP1_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP1_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP1_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP1_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP1_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_IN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = BUFF_CPU_SHOULD_HANDLE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var EP15_OUT: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP15_OUT_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP15_OUT)
                }
                }
              public var EP15_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP15_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP15_IN)
                }
              }
              public var EP14_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP14_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP14_OUT)
                }
              }
              public var EP14_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP14_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP14_IN)
                }
              }
              public var EP13_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP13_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP13_OUT)
                }
              }
              public var EP13_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP13_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP13_IN)
                }
              }
              public var EP12_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP12_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP12_OUT)
                }
              }
              public var EP12_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP12_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP12_IN)
                }
              }
              public var EP11_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP11_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP11_OUT)
                }
              }
              public var EP11_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP11_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP11_IN)
                }
              }
              public var EP10_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP10_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP10_OUT)
                }
              }
              public var EP10_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP10_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP10_IN)
                }
              }
              public var EP9_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP9_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP9_OUT)
                }
              }
              public var EP9_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP9_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP9_IN)
                }
              }
              public var EP8_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP8_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP8_OUT)
                }
              }
              public var EP8_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP8_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP8_IN)
                }
              }
              public var EP7_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP7_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP7_OUT)
                }
              }
              public var EP7_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP7_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP7_IN)
                }
              }
              public var EP6_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP6_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP6_OUT)
                }
              }
              public var EP6_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP6_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP6_IN)
                }
              }
              public var EP5_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP5_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP5_OUT)
                }
              }
              public var EP5_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP5_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP5_IN)
                }
              }
              public var EP4_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP4_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP4_OUT)
                }
              }
              public var EP4_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP4_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP4_IN)
                }
              }
              public var EP3_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP3_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP3_OUT)
                }
              }
              public var EP3_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP3_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP3_IN)
                }
              }
              public var EP2_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP2_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP2_OUT)
                }
              }
              public var EP2_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP2_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP2_IN)
                }
              }
              public var EP1_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP1_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP1_OUT)
                }
              }
              public var EP1_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP1_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP1_IN)
                }
              }
              public var EP0_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_OUT)
                }
              }
              public var EP0_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_IN)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = BUFF_CPU_SHOULD_HANDLE_Descriptor
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

    /// Device only: Can be set to ignore the buffer control register for this endpoint in case you would like to revoke a buffer. A NAK will be sent for every access to the endpoint until this bit is cleared. A corresponding bit in `EP_ABORT_DONE` is set when it is safe to modify the buffer control register.
    public var EP_ABORT: Register<EP_ABORT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0060), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0060))
          #endif
        }
    }
    public struct EP_ABORT_Descriptor {
        @available(*, unavailable)
        public var EP15_OUT: EP15_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP15_IN: EP15_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP14_OUT: EP14_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP14_IN: EP14_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP13_OUT: EP13_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP13_IN: EP13_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP12_OUT: EP12_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP12_IN: EP12_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP11_OUT: EP11_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP11_IN: EP11_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP10_OUT: EP10_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP10_IN: EP10_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP9_OUT: EP9_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP9_IN: EP9_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP8_OUT: EP8_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP8_IN: EP8_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP7_OUT: EP7_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP7_IN: EP7_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP6_OUT: EP6_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP6_IN: EP6_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP5_OUT: EP5_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP5_IN: EP5_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP4_OUT: EP4_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP4_IN: EP4_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP3_OUT: EP3_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP3_IN: EP3_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP2_OUT: EP2_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP2_IN: EP2_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP1_OUT: EP1_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP1_IN: EP1_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_OUT: EP0_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_IN: EP0_IN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP15_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum EP15_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum EP14_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum EP14_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum EP13_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum EP13_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum EP12_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum EP12_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum EP11_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum EP11_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum EP10_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum EP10_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum EP9_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum EP9_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum EP8_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum EP8_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum EP7_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum EP7_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum EP6_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum EP6_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum EP5_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum EP5_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum EP4_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum EP4_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum EP3_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum EP3_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum EP2_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum EP2_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum EP1_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum EP1_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum EP0_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EP0_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP_ABORT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var EP15_OUT: UInt32 {
                @inlinable @inline(__always) get {
                    EP15_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP15_OUT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var EP15_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP15_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP15_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP14_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP14_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP14_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP14_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP14_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP14_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP13_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP13_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP13_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP13_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP13_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP13_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP12_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP12_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP12_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP12_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP12_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP12_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP11_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP11_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP11_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP11_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP11_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP11_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP10_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP10_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP10_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP10_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP10_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP10_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP9_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP9_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP9_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP9_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP9_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP9_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP8_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP8_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP8_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP8_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP8_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP8_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP7_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP7_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP7_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP7_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP7_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP7_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP6_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP6_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP6_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP6_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP6_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP6_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP5_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP5_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP5_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP5_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP5_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP5_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP4_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP4_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP4_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP4_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP4_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP4_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP3_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP3_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP3_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP3_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP3_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP3_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP2_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP2_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP2_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP2_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP2_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP2_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP1_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP1_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP1_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP1_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP1_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP1_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_IN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP_ABORT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var EP15_OUT: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP15_OUT_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP15_OUT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(EP15_OUT_Field.self, Bool.self)
                    self.raw.EP15_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var EP15_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP15_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP15_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP15_IN_Field.self, Bool.self)
                  self.raw.EP15_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP14_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP14_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP14_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP14_OUT_Field.self, Bool.self)
                  self.raw.EP14_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP14_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP14_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP14_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP14_IN_Field.self, Bool.self)
                  self.raw.EP14_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP13_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP13_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP13_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP13_OUT_Field.self, Bool.self)
                  self.raw.EP13_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP13_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP13_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP13_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP13_IN_Field.self, Bool.self)
                  self.raw.EP13_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP12_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP12_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP12_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP12_OUT_Field.self, Bool.self)
                  self.raw.EP12_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP12_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP12_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP12_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP12_IN_Field.self, Bool.self)
                  self.raw.EP12_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP11_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP11_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP11_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP11_OUT_Field.self, Bool.self)
                  self.raw.EP11_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP11_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP11_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP11_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP11_IN_Field.self, Bool.self)
                  self.raw.EP11_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP10_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP10_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP10_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP10_OUT_Field.self, Bool.self)
                  self.raw.EP10_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP10_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP10_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP10_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP10_IN_Field.self, Bool.self)
                  self.raw.EP10_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP9_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP9_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP9_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP9_OUT_Field.self, Bool.self)
                  self.raw.EP9_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP9_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP9_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP9_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP9_IN_Field.self, Bool.self)
                  self.raw.EP9_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP8_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP8_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP8_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP8_OUT_Field.self, Bool.self)
                  self.raw.EP8_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP8_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP8_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP8_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP8_IN_Field.self, Bool.self)
                  self.raw.EP8_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP7_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP7_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP7_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP7_OUT_Field.self, Bool.self)
                  self.raw.EP7_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP7_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP7_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP7_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP7_IN_Field.self, Bool.self)
                  self.raw.EP7_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP6_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP6_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP6_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP6_OUT_Field.self, Bool.self)
                  self.raw.EP6_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP6_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP6_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP6_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP6_IN_Field.self, Bool.self)
                  self.raw.EP6_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP5_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP5_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP5_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP5_OUT_Field.self, Bool.self)
                  self.raw.EP5_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP5_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP5_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP5_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP5_IN_Field.self, Bool.self)
                  self.raw.EP5_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP4_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP4_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP4_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP4_OUT_Field.self, Bool.self)
                  self.raw.EP4_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP4_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP4_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP4_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP4_IN_Field.self, Bool.self)
                  self.raw.EP4_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP3_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP3_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP3_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP3_OUT_Field.self, Bool.self)
                  self.raw.EP3_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP3_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP3_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP3_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP3_IN_Field.self, Bool.self)
                  self.raw.EP3_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP2_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP2_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP2_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP2_OUT_Field.self, Bool.self)
                  self.raw.EP2_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP2_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP2_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP2_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP2_IN_Field.self, Bool.self)
                  self.raw.EP2_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP1_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP1_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP1_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP1_OUT_Field.self, Bool.self)
                  self.raw.EP1_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP1_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP1_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP1_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP1_IN_Field.self, Bool.self)
                  self.raw.EP1_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                  self.raw.EP0_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  self.raw.EP0_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Device only: Used in conjunction with `EP_ABORT`. Set once an endpoint is idle so the programmer knows it is safe to modify the buffer control register.
    public var EP_ABORT_DONE: Register<EP_ABORT_DONE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0064), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0064))
          #endif
        }
    }
    public struct EP_ABORT_DONE_Descriptor {
        @available(*, unavailable)
        public var EP15_OUT: EP15_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP15_IN: EP15_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP14_OUT: EP14_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP14_IN: EP14_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP13_OUT: EP13_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP13_IN: EP13_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP12_OUT: EP12_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP12_IN: EP12_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP11_OUT: EP11_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP11_IN: EP11_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP10_OUT: EP10_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP10_IN: EP10_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP9_OUT: EP9_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP9_IN: EP9_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP8_OUT: EP8_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP8_IN: EP8_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP7_OUT: EP7_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP7_IN: EP7_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP6_OUT: EP6_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP6_IN: EP6_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP5_OUT: EP5_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP5_IN: EP5_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP4_OUT: EP4_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP4_IN: EP4_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP3_OUT: EP3_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP3_IN: EP3_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP2_OUT: EP2_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP2_IN: EP2_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP1_OUT: EP1_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP1_IN: EP1_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_OUT: EP0_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_IN: EP0_IN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP15_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum EP15_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum EP14_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum EP14_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum EP13_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum EP13_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum EP12_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum EP12_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum EP11_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum EP11_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum EP10_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum EP10_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum EP9_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum EP9_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum EP8_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum EP8_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum EP7_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum EP7_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum EP6_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum EP6_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum EP5_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum EP5_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum EP4_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum EP4_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum EP3_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum EP3_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum EP2_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum EP2_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum EP1_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum EP1_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum EP0_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EP0_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP_ABORT_DONE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var EP15_OUT: UInt32 {
                @inlinable @inline(__always) get {
                    EP15_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP15_OUT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var EP15_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP15_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP15_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP14_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP14_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP14_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP14_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP14_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP14_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP13_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP13_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP13_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP13_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP13_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP13_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP12_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP12_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP12_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP12_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP12_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP12_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP11_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP11_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP11_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP11_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP11_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP11_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP10_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP10_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP10_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP10_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP10_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP10_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP9_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP9_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP9_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP9_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP9_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP9_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP8_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP8_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP8_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP8_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP8_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP8_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP7_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP7_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP7_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP7_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP7_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP7_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP6_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP6_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP6_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP6_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP6_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP6_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP5_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP5_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP5_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP5_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP5_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP5_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP4_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP4_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP4_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP4_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP4_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP4_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP3_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP3_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP3_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP3_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP3_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP3_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP2_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP2_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP2_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP2_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP2_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP2_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP1_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP1_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP1_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP1_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP1_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP1_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_IN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP_ABORT_DONE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var EP15_OUT: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP15_OUT_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP15_OUT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(EP15_OUT_Field.self, Bool.self)
                    self.raw.EP15_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var EP15_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP15_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP15_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP15_IN_Field.self, Bool.self)
                  self.raw.EP15_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP14_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP14_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP14_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP14_OUT_Field.self, Bool.self)
                  self.raw.EP14_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP14_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP14_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP14_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP14_IN_Field.self, Bool.self)
                  self.raw.EP14_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP13_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP13_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP13_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP13_OUT_Field.self, Bool.self)
                  self.raw.EP13_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP13_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP13_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP13_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP13_IN_Field.self, Bool.self)
                  self.raw.EP13_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP12_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP12_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP12_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP12_OUT_Field.self, Bool.self)
                  self.raw.EP12_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP12_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP12_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP12_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP12_IN_Field.self, Bool.self)
                  self.raw.EP12_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP11_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP11_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP11_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP11_OUT_Field.self, Bool.self)
                  self.raw.EP11_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP11_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP11_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP11_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP11_IN_Field.self, Bool.self)
                  self.raw.EP11_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP10_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP10_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP10_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP10_OUT_Field.self, Bool.self)
                  self.raw.EP10_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP10_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP10_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP10_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP10_IN_Field.self, Bool.self)
                  self.raw.EP10_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP9_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP9_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP9_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP9_OUT_Field.self, Bool.self)
                  self.raw.EP9_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP9_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP9_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP9_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP9_IN_Field.self, Bool.self)
                  self.raw.EP9_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP8_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP8_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP8_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP8_OUT_Field.self, Bool.self)
                  self.raw.EP8_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP8_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP8_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP8_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP8_IN_Field.self, Bool.self)
                  self.raw.EP8_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP7_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP7_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP7_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP7_OUT_Field.self, Bool.self)
                  self.raw.EP7_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP7_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP7_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP7_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP7_IN_Field.self, Bool.self)
                  self.raw.EP7_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP6_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP6_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP6_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP6_OUT_Field.self, Bool.self)
                  self.raw.EP6_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP6_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP6_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP6_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP6_IN_Field.self, Bool.self)
                  self.raw.EP6_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP5_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP5_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP5_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP5_OUT_Field.self, Bool.self)
                  self.raw.EP5_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP5_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP5_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP5_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP5_IN_Field.self, Bool.self)
                  self.raw.EP5_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP4_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP4_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP4_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP4_OUT_Field.self, Bool.self)
                  self.raw.EP4_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP4_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP4_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP4_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP4_IN_Field.self, Bool.self)
                  self.raw.EP4_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP3_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP3_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP3_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP3_OUT_Field.self, Bool.self)
                  self.raw.EP3_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP3_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP3_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP3_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP3_IN_Field.self, Bool.self)
                  self.raw.EP3_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP2_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP2_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP2_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP2_OUT_Field.self, Bool.self)
                  self.raw.EP2_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP2_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP2_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP2_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP2_IN_Field.self, Bool.self)
                  self.raw.EP2_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP1_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP1_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP1_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP1_OUT_Field.self, Bool.self)
                  self.raw.EP1_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP1_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP1_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP1_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP1_IN_Field.self, Bool.self)
                  self.raw.EP1_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                  self.raw.EP0_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  self.raw.EP0_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Device: this bit must be set in conjunction with the `STALL` bit in the buffer control register to send a STALL on EP0. The device controller clears these bits when a SETUP packet is received because the USB spec requires that a STALL condition is cleared when a SETUP packet is received.
    public var EP_STALL_ARM: Register<EP_STALL_ARM_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0068), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0068))
          #endif
        }
    }
    public struct EP_STALL_ARM_Descriptor {
        @available(*, unavailable)
        public var EP0_OUT: EP0_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_IN: EP0_IN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP0_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EP0_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP_STALL_ARM_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var EP0_OUT: UInt32 {
                @inlinable @inline(__always) get {
                    EP0_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP0_OUT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var EP0_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_IN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP_STALL_ARM_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var EP0_OUT: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP0_OUT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                    self.raw.EP0_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var EP0_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  self.raw.EP0_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Used by the host controller. Sets the wait time in microseconds before trying again if the device replies with a NAK.
    public var NAK_POLL: Register<NAK_POLL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x006c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x006c))
          #endif
        }
    }
    public struct NAK_POLL_Descriptor {
        @available(*, unavailable)
        /// NAK polling interval for a full speed device
        public var DELAY_FS: DELAY_FS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// NAK polling interval for a low speed device
        public var DELAY_LS: DELAY_LS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DELAY_FS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum DELAY_LS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = NAK_POLL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DELAY_FS: UInt32 {
                @inlinable @inline(__always) get {
                    DELAY_FS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DELAY_FS_Field.insert(newValue, into: &self.storage)
                }
                }
              public var DELAY_LS: UInt32 {
                @inlinable @inline(__always) get {
                  DELAY_LS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DELAY_LS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = NAK_POLL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DELAY_FS: BitField10 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DELAY_FS_Field.self, BitField10.self)
                    return BitField10(storage: self.raw.DELAY_FS)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DELAY_FS_Field.self, BitField10.self)
                    self.raw.DELAY_FS = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var DELAY_LS: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DELAY_LS_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.DELAY_LS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DELAY_LS_Field.self, BitField10.self)
                  self.raw.DELAY_LS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Device: bits are set when the `IRQ_ON_NAK` or `IRQ_ON_STALL` bits are set. For EP0 this comes from `SIE_CTRL`. For all other endpoints it comes from the endpoint control register.
    public var EP_STATUS_STALL_NAK: Register<EP_STATUS_STALL_NAK_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0070), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0070))
          #endif
        }
    }
    public struct EP_STATUS_STALL_NAK_Descriptor {
        @available(*, unavailable)
        public var EP15_OUT: EP15_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP15_IN: EP15_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP14_OUT: EP14_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP14_IN: EP14_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP13_OUT: EP13_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP13_IN: EP13_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP12_OUT: EP12_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP12_IN: EP12_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP11_OUT: EP11_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP11_IN: EP11_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP10_OUT: EP10_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP10_IN: EP10_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP9_OUT: EP9_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP9_IN: EP9_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP8_OUT: EP8_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP8_IN: EP8_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP7_OUT: EP7_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP7_IN: EP7_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP6_OUT: EP6_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP6_IN: EP6_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP5_OUT: EP5_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP5_IN: EP5_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP4_OUT: EP4_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP4_IN: EP4_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP3_OUT: EP3_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP3_IN: EP3_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP2_OUT: EP2_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP2_IN: EP2_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP1_OUT: EP1_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP1_IN: EP1_IN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_OUT: EP0_OUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EP0_IN: EP0_IN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP15_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum EP15_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum EP14_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum EP14_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum EP13_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 28
        }

        public enum EP13_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum EP12_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum EP12_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum EP11_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum EP11_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum EP10_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum EP10_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum EP9_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum EP9_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum EP8_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum EP8_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum EP7_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum EP7_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum EP6_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum EP6_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum EP5_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum EP5_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum EP4_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum EP4_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum EP3_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum EP3_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum EP2_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum EP2_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum EP1_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum EP1_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum EP0_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EP0_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP_STATUS_STALL_NAK_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var EP15_OUT: UInt32 {
                @inlinable @inline(__always) get {
                    EP15_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP15_OUT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var EP15_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP15_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP15_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP14_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP14_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP14_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP14_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP14_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP14_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP13_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP13_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP13_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP13_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP13_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP13_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP12_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP12_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP12_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP12_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP12_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP12_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP11_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP11_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP11_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP11_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP11_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP11_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP10_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP10_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP10_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP10_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP10_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP10_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP9_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP9_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP9_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP9_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP9_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP9_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP8_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP8_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP8_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP8_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP8_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP8_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP7_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP7_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP7_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP7_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP7_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP7_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP6_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP6_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP6_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP6_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP6_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP6_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP5_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP5_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP5_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP5_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP5_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP5_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP4_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP4_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP4_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP4_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP4_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP4_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP3_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP3_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP3_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP3_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP3_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP3_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP2_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP2_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP2_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP2_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP2_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP2_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP1_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP1_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP1_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP1_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP1_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP1_IN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_OUT: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_OUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EP0_IN: UInt32 {
                @inlinable @inline(__always) get {
                  EP0_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EP0_IN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP_STATUS_STALL_NAK_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var EP15_OUT: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP15_OUT_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP15_OUT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(EP15_OUT_Field.self, Bool.self)
                    self.raw.EP15_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var EP15_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP15_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP15_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP15_IN_Field.self, Bool.self)
                  self.raw.EP15_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP14_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP14_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP14_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP14_OUT_Field.self, Bool.self)
                  self.raw.EP14_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP14_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP14_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP14_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP14_IN_Field.self, Bool.self)
                  self.raw.EP14_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP13_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP13_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP13_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP13_OUT_Field.self, Bool.self)
                  self.raw.EP13_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP13_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP13_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP13_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP13_IN_Field.self, Bool.self)
                  self.raw.EP13_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP12_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP12_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP12_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP12_OUT_Field.self, Bool.self)
                  self.raw.EP12_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP12_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP12_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP12_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP12_IN_Field.self, Bool.self)
                  self.raw.EP12_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP11_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP11_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP11_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP11_OUT_Field.self, Bool.self)
                  self.raw.EP11_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP11_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP11_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP11_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP11_IN_Field.self, Bool.self)
                  self.raw.EP11_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP10_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP10_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP10_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP10_OUT_Field.self, Bool.self)
                  self.raw.EP10_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP10_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP10_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP10_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP10_IN_Field.self, Bool.self)
                  self.raw.EP10_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP9_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP9_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP9_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP9_OUT_Field.self, Bool.self)
                  self.raw.EP9_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP9_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP9_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP9_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP9_IN_Field.self, Bool.self)
                  self.raw.EP9_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP8_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP8_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP8_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP8_OUT_Field.self, Bool.self)
                  self.raw.EP8_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP8_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP8_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP8_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP8_IN_Field.self, Bool.self)
                  self.raw.EP8_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP7_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP7_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP7_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP7_OUT_Field.self, Bool.self)
                  self.raw.EP7_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP7_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP7_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP7_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP7_IN_Field.self, Bool.self)
                  self.raw.EP7_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP6_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP6_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP6_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP6_OUT_Field.self, Bool.self)
                  self.raw.EP6_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP6_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP6_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP6_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP6_IN_Field.self, Bool.self)
                  self.raw.EP6_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP5_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP5_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP5_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP5_OUT_Field.self, Bool.self)
                  self.raw.EP5_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP5_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP5_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP5_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP5_IN_Field.self, Bool.self)
                  self.raw.EP5_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP4_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP4_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP4_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP4_OUT_Field.self, Bool.self)
                  self.raw.EP4_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP4_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP4_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP4_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP4_IN_Field.self, Bool.self)
                  self.raw.EP4_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP3_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP3_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP3_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP3_OUT_Field.self, Bool.self)
                  self.raw.EP3_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP3_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP3_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP3_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP3_IN_Field.self, Bool.self)
                  self.raw.EP3_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP2_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP2_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP2_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP2_OUT_Field.self, Bool.self)
                  self.raw.EP2_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP2_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP2_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP2_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP2_IN_Field.self, Bool.self)
                  self.raw.EP2_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP1_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP1_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP1_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP1_OUT_Field.self, Bool.self)
                  self.raw.EP1_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP1_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP1_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP1_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP1_IN_Field.self, Bool.self)
                  self.raw.EP1_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_OUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_OUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_OUT_Field.self, Bool.self)
                  self.raw.EP0_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EP0_IN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EP0_IN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EP0_IN_Field.self, Bool.self)
                  self.raw.EP0_IN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Where to connect the USB controller. Should be to_phy by default.
    public var USB_MUXING: Register<USB_MUXING_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0074), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0074))
          #endif
        }
    }
    public struct USB_MUXING_Descriptor {
        @available(*, unavailable)
        public var SOFTCON: SOFTCON_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TO_DIGITAL_PAD: TO_DIGITAL_PAD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TO_EXTPHY: TO_EXTPHY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TO_PHY: TO_PHY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SOFTCON_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum TO_DIGITAL_PAD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum TO_EXTPHY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum TO_PHY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = USB_MUXING_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SOFTCON: UInt32 {
                @inlinable @inline(__always) get {
                    SOFTCON_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SOFTCON_Field.insert(newValue, into: &self.storage)
                }
                }
              public var TO_DIGITAL_PAD: UInt32 {
                @inlinable @inline(__always) get {
                  TO_DIGITAL_PAD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TO_DIGITAL_PAD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TO_EXTPHY: UInt32 {
                @inlinable @inline(__always) get {
                  TO_EXTPHY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TO_EXTPHY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TO_PHY: UInt32 {
                @inlinable @inline(__always) get {
                  TO_PHY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TO_PHY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = USB_MUXING_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SOFTCON: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SOFTCON_Field.self, Bool.self)
                    return Bool(storage: self.raw.SOFTCON)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SOFTCON_Field.self, Bool.self)
                    self.raw.SOFTCON = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var TO_DIGITAL_PAD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TO_DIGITAL_PAD_Field.self, Bool.self)
                  return Bool(storage: self.raw.TO_DIGITAL_PAD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TO_DIGITAL_PAD_Field.self, Bool.self)
                  self.raw.TO_DIGITAL_PAD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TO_EXTPHY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TO_EXTPHY_Field.self, Bool.self)
                  return Bool(storage: self.raw.TO_EXTPHY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TO_EXTPHY_Field.self, Bool.self)
                  self.raw.TO_EXTPHY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TO_PHY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TO_PHY_Field.self, Bool.self)
                  return Bool(storage: self.raw.TO_PHY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TO_PHY_Field.self, Bool.self)
                  self.raw.TO_PHY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Overrides for the power signals in the event that the VBUS signals are not hooked up to GPIO. Set the value of the override and then the override enable to switch over to the override value.
    public var USB_PWR: Register<USB_PWR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0078), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0078))
          #endif
        }
    }
    public struct USB_PWR_Descriptor {
        @available(*, unavailable)
        public var OVERCURR_DETECT_EN: OVERCURR_DETECT_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var OVERCURR_DETECT: OVERCURR_DETECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var VBUS_DETECT_OVERRIDE_EN: VBUS_DETECT_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var VBUS_DETECT: VBUS_DETECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var VBUS_EN_OVERRIDE_EN: VBUS_EN_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var VBUS_EN: VBUS_EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OVERCURR_DETECT_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum OVERCURR_DETECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum VBUS_DETECT_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum VBUS_DETECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum VBUS_EN_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum VBUS_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = USB_PWR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OVERCURR_DETECT_EN: UInt32 {
                @inlinable @inline(__always) get {
                    OVERCURR_DETECT_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OVERCURR_DETECT_EN_Field.insert(newValue, into: &self.storage)
                }
                }
              public var OVERCURR_DETECT: UInt32 {
                @inlinable @inline(__always) get {
                  OVERCURR_DETECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OVERCURR_DETECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_DETECT_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_DETECT_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_DETECT_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_DETECT: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_DETECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_DETECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_EN_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_EN_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_EN_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_EN: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = USB_PWR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OVERCURR_DETECT_EN: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OVERCURR_DETECT_EN_Field.self, Bool.self)
                    return Bool(storage: self.raw.OVERCURR_DETECT_EN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OVERCURR_DETECT_EN_Field.self, Bool.self)
                    self.raw.OVERCURR_DETECT_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var OVERCURR_DETECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OVERCURR_DETECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.OVERCURR_DETECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OVERCURR_DETECT_Field.self, Bool.self)
                  self.raw.OVERCURR_DETECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var VBUS_DETECT_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_DETECT_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_DETECT_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(VBUS_DETECT_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.VBUS_DETECT_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var VBUS_DETECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_DETECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_DETECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(VBUS_DETECT_Field.self, Bool.self)
                  self.raw.VBUS_DETECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var VBUS_EN_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_EN_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_EN_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(VBUS_EN_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.VBUS_EN_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var VBUS_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(VBUS_EN_Field.self, Bool.self)
                  self.raw.VBUS_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// This register allows for direct control of the USB phy. Use in conjunction with usbphy_direct_override register to enable each override bit.
    public var USBPHY_DIRECT: Register<USBPHY_DIRECT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x007c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x007c))
          #endif
        }
    }
    public struct USBPHY_DIRECT_Descriptor {
        @available(*, unavailable)
        /// DM over voltage
        public var DM_OVV: DM_OVV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DP over voltage
        public var DP_OVV: DP_OVV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DM overcurrent
        public var DM_OVCN: DM_OVCN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DP overcurrent
        public var DP_OVCN: DP_OVCN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DPM pin state
        public var RX_DM: RX_DM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DPP pin state
        public var RX_DP: RX_DP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Differential RX
        public var RX_DD: RX_DD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// TX_DIFFMODE=0: Single ended mode
        /// TX_DIFFMODE=1: Differential drive mode (TX_DM, TX_DM_OE ignored)
        public var TX_DIFFMODE: TX_DIFFMODE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// TX_FSSLEW=0: Low speed slew rate
        /// TX_FSSLEW=1: Full speed slew rate
        public var TX_FSSLEW: TX_FSSLEW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// TX power down override (if override enable is set). 1 = powered down.
        public var TX_PD: TX_PD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// RX power down override (if override enable is set). 1 = powered down.
        public var RX_PD: RX_PD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Output data. TX_DIFFMODE=1, Ignored
        /// TX_DIFFMODE=0, Drives DPM only. TX_DM_OE=1 to enable drive. DPM=TX_DM
        public var TX_DM: TX_DM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Output data. If TX_DIFFMODE=1, Drives DPP/DPM diff pair. TX_DP_OE=1 to enable drive. DPP=TX_DP, DPM=~TX_DP
        /// If TX_DIFFMODE=0, Drives DPP only. TX_DP_OE=1 to enable drive. DPP=TX_DP
        public var TX_DP: TX_DP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Output enable. If TX_DIFFMODE=1, Ignored.
        /// If TX_DIFFMODE=0, OE for DPM only. 0 - DPM in Hi-Z state; 1 - DPM driving
        public var TX_DM_OE: TX_DM_OE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Output enable. If TX_DIFFMODE=1, OE for DPP/DPM diff pair. 0 - DPP/DPM in Hi-Z state; 1 - DPP/DPM driving
        /// If TX_DIFFMODE=0, OE for DPP only. 0 - DPP in Hi-Z state; 1 - DPP driving
        public var TX_DP_OE: TX_DP_OE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DM pull down enable
        public var DM_PULLDN_EN: DM_PULLDN_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DM pull up enable
        public var DM_PULLUP_EN: DM_PULLUP_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable the second DM pull up resistor. 0 - Pull = Rpu2; 1 - Pull = Rpu1 + Rpu2
        public var DM_PULLUP_HISEL: DM_PULLUP_HISEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DP pull down enable
        public var DP_PULLDN_EN: DP_PULLDN_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DP pull up enable
        public var DP_PULLUP_EN: DP_PULLUP_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable the second DP pull up resistor. 0 - Pull = Rpu2; 1 - Pull = Rpu1 + Rpu2
        public var DP_PULLUP_HISEL: DP_PULLUP_HISEL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DM_OVV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum DP_OVV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum DM_OVCN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum DP_OVCN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum RX_DM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum RX_DP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum RX_DD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum TX_DIFFMODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum TX_FSSLEW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum TX_PD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RX_PD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum TX_DM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum TX_DP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum TX_DM_OE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum TX_DP_OE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum DM_PULLDN_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DM_PULLUP_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum DM_PULLUP_HISEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DP_PULLDN_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum DP_PULLUP_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum DP_PULLUP_HISEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = USBPHY_DIRECT_Descriptor

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
                public var DM_OVV: UInt32 {
                @inlinable @inline(__always) get {
                    DM_OVV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DM_OVV_Field.insert(newValue, into: &self.storage)
                }
                }
              public var DP_OVV: UInt32 {
                @inlinable @inline(__always) get {
                  DP_OVV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DP_OVV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DM_OVCN: UInt32 {
                @inlinable @inline(__always) get {
                  DM_OVCN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DM_OVCN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DP_OVCN: UInt32 {
                @inlinable @inline(__always) get {
                  DP_OVCN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DP_OVCN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_DM: UInt32 {
                @inlinable @inline(__always) get {
                  RX_DM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_DM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_DP: UInt32 {
                @inlinable @inline(__always) get {
                  RX_DP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_DP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_DD: UInt32 {
                @inlinable @inline(__always) get {
                  RX_DD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_DD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_DIFFMODE: UInt32 {
                @inlinable @inline(__always) get {
                  TX_DIFFMODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_DIFFMODE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_FSSLEW: UInt32 {
                @inlinable @inline(__always) get {
                  TX_FSSLEW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_FSSLEW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_PD: UInt32 {
                @inlinable @inline(__always) get {
                  TX_PD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_PD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_PD: UInt32 {
                @inlinable @inline(__always) get {
                  RX_PD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_PD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_DM: UInt32 {
                @inlinable @inline(__always) get {
                  TX_DM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_DM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_DP: UInt32 {
                @inlinable @inline(__always) get {
                  TX_DP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_DP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_DM_OE: UInt32 {
                @inlinable @inline(__always) get {
                  TX_DM_OE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_DM_OE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_DP_OE: UInt32 {
                @inlinable @inline(__always) get {
                  TX_DP_OE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_DP_OE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DM_PULLDN_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DM_PULLDN_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DM_PULLDN_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DM_PULLUP_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DM_PULLUP_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DM_PULLUP_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DM_PULLUP_HISEL: UInt32 {
                @inlinable @inline(__always) get {
                  DM_PULLUP_HISEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DM_PULLUP_HISEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DP_PULLDN_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DP_PULLDN_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DP_PULLDN_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DP_PULLUP_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DP_PULLUP_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DP_PULLUP_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DP_PULLUP_HISEL: UInt32 {
                @inlinable @inline(__always) get {
                  DP_PULLUP_HISEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DP_PULLUP_HISEL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = USBPHY_DIRECT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var DM_OVV: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DM_OVV_Field.self, Bool.self)
                    return Bool(storage: self.raw.DM_OVV)
                }
                }
              public var DP_OVV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_OVV_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_OVV)
                }
              }
              public var DM_OVCN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DM_OVCN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DM_OVCN)
                }
              }
              public var DP_OVCN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_OVCN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_OVCN)
                }
              }
              public var RX_DM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_DM_Field.self, Bool.self)
                  return Bool(storage: self.raw.RX_DM)
                }
              }
              public var RX_DP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_DP_Field.self, Bool.self)
                  return Bool(storage: self.raw.RX_DP)
                }
              }
              public var RX_DD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_DD_Field.self, Bool.self)
                  return Bool(storage: self.raw.RX_DD)
                }
              }
              public var TX_DIFFMODE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DIFFMODE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DIFFMODE)
                }
              }
              public var TX_FSSLEW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_FSSLEW_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_FSSLEW)
                }
              }
              public var TX_PD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_PD_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_PD)
                }
              }
              public var RX_PD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_PD_Field.self, Bool.self)
                  return Bool(storage: self.raw.RX_PD)
                }
              }
              public var TX_DM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DM_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DM)
                }
              }
              public var TX_DP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DP_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DP)
                }
              }
              public var TX_DM_OE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DM_OE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DM_OE)
                }
              }
              public var TX_DP_OE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DP_OE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DP_OE)
                }
              }
              public var DM_PULLDN_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DM_PULLDN_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DM_PULLDN_EN)
                }
              }
              public var DM_PULLUP_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DM_PULLUP_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DM_PULLUP_EN)
                }
              }
              public var DM_PULLUP_HISEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DM_PULLUP_HISEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.DM_PULLUP_HISEL)
                }
              }
              public var DP_PULLDN_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_PULLDN_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_PULLDN_EN)
                }
              }
              public var DP_PULLUP_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_PULLUP_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_PULLUP_EN)
                }
              }
              public var DP_PULLUP_HISEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_PULLUP_HISEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_PULLUP_HISEL)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = USBPHY_DIRECT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var TX_DIFFMODE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TX_DIFFMODE_Field.self, Bool.self)
                    return Bool(storage: self.raw.TX_DIFFMODE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TX_DIFFMODE_Field.self, Bool.self)
                    self.raw.TX_DIFFMODE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var TX_FSSLEW: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_FSSLEW_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_FSSLEW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_FSSLEW_Field.self, Bool.self)
                  self.raw.TX_FSSLEW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_PD: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_PD_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_PD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_PD_Field.self, Bool.self)
                  self.raw.TX_PD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RX_PD: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_PD_Field.self, Bool.self)
                  return Bool(storage: self.raw.RX_PD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RX_PD_Field.self, Bool.self)
                  self.raw.RX_PD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_DM: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DM_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_DM_Field.self, Bool.self)
                  self.raw.TX_DM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_DP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DP_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_DP_Field.self, Bool.self)
                  self.raw.TX_DP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_DM_OE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DM_OE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DM_OE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_DM_OE_Field.self, Bool.self)
                  self.raw.TX_DM_OE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_DP_OE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DP_OE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DP_OE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_DP_OE_Field.self, Bool.self)
                  self.raw.TX_DP_OE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DM_PULLDN_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DM_PULLDN_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DM_PULLDN_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DM_PULLDN_EN_Field.self, Bool.self)
                  self.raw.DM_PULLDN_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DM_PULLUP_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DM_PULLUP_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DM_PULLUP_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DM_PULLUP_EN_Field.self, Bool.self)
                  self.raw.DM_PULLUP_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DM_PULLUP_HISEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DM_PULLUP_HISEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.DM_PULLUP_HISEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DM_PULLUP_HISEL_Field.self, Bool.self)
                  self.raw.DM_PULLUP_HISEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DP_PULLDN_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_PULLDN_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_PULLDN_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DP_PULLDN_EN_Field.self, Bool.self)
                  self.raw.DP_PULLDN_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DP_PULLUP_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_PULLUP_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_PULLUP_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DP_PULLUP_EN_Field.self, Bool.self)
                  self.raw.DP_PULLUP_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DP_PULLUP_HISEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_PULLUP_HISEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_PULLUP_HISEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DP_PULLUP_HISEL_Field.self, Bool.self)
                  self.raw.DP_PULLUP_HISEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Override enable for each control in usbphy_direct
    public var USBPHY_DIRECT_OVERRIDE: Register<USBPHY_DIRECT_OVERRIDE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0080), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0080))
          #endif
        }
    }
    public struct USBPHY_DIRECT_OVERRIDE_Descriptor {
        @available(*, unavailable)
        public var TX_DIFFMODE_OVERRIDE_EN: TX_DIFFMODE_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DM_PULLUP_OVERRIDE_EN: DM_PULLUP_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TX_FSSLEW_OVERRIDE_EN: TX_FSSLEW_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TX_PD_OVERRIDE_EN: TX_PD_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var RX_PD_OVERRIDE_EN: RX_PD_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TX_DM_OVERRIDE_EN: TX_DM_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TX_DP_OVERRIDE_EN: TX_DP_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TX_DM_OE_OVERRIDE_EN: TX_DM_OE_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TX_DP_OE_OVERRIDE_EN: TX_DP_OE_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DM_PULLDN_EN_OVERRIDE_EN: DM_PULLDN_EN_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DP_PULLDN_EN_OVERRIDE_EN: DP_PULLDN_EN_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DP_PULLUP_EN_OVERRIDE_EN: DP_PULLUP_EN_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DM_PULLUP_HISEL_OVERRIDE_EN: DM_PULLUP_HISEL_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DP_PULLUP_HISEL_OVERRIDE_EN: DP_PULLUP_HISEL_OVERRIDE_EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TX_DIFFMODE_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum DM_PULLUP_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum TX_FSSLEW_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum TX_PD_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RX_PD_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum TX_DM_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum TX_DP_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum TX_DM_OE_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum TX_DP_OE_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum DM_PULLDN_EN_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DP_PULLDN_EN_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum DP_PULLUP_EN_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum DM_PULLUP_HISEL_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum DP_PULLUP_HISEL_OVERRIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = USBPHY_DIRECT_OVERRIDE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TX_DIFFMODE_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                    TX_DIFFMODE_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TX_DIFFMODE_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
                }
              public var DM_PULLUP_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DM_PULLUP_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DM_PULLUP_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_FSSLEW_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  TX_FSSLEW_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_FSSLEW_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_PD_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  TX_PD_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_PD_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_PD_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  RX_PD_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_PD_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_DM_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  TX_DM_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_DM_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_DP_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  TX_DP_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_DP_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_DM_OE_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  TX_DM_OE_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_DM_OE_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_DP_OE_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  TX_DP_OE_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_DP_OE_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DM_PULLDN_EN_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DM_PULLDN_EN_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DM_PULLDN_EN_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DP_PULLDN_EN_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DP_PULLDN_EN_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DP_PULLDN_EN_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DP_PULLUP_EN_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DP_PULLUP_EN_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DP_PULLUP_EN_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DM_PULLUP_HISEL_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DM_PULLUP_HISEL_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DM_PULLUP_HISEL_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DP_PULLUP_HISEL_OVERRIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DP_PULLUP_HISEL_OVERRIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DP_PULLUP_HISEL_OVERRIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = USBPHY_DIRECT_OVERRIDE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TX_DIFFMODE_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TX_DIFFMODE_OVERRIDE_EN_Field.self, Bool.self)
                    return Bool(storage: self.raw.TX_DIFFMODE_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TX_DIFFMODE_OVERRIDE_EN_Field.self, Bool.self)
                    self.raw.TX_DIFFMODE_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var DM_PULLUP_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DM_PULLUP_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DM_PULLUP_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DM_PULLUP_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.DM_PULLUP_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_FSSLEW_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_FSSLEW_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_FSSLEW_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_FSSLEW_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.TX_FSSLEW_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_PD_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_PD_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_PD_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_PD_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.TX_PD_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RX_PD_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_PD_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.RX_PD_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RX_PD_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.RX_PD_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_DM_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DM_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DM_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_DM_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.TX_DM_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_DP_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DP_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DP_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_DP_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.TX_DP_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_DM_OE_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DM_OE_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DM_OE_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_DM_OE_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.TX_DM_OE_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TX_DP_OE_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_DP_OE_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.TX_DP_OE_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_DP_OE_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.TX_DP_OE_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DM_PULLDN_EN_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DM_PULLDN_EN_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DM_PULLDN_EN_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DM_PULLDN_EN_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.DM_PULLDN_EN_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DP_PULLDN_EN_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_PULLDN_EN_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_PULLDN_EN_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DP_PULLDN_EN_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.DP_PULLDN_EN_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DP_PULLUP_EN_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_PULLUP_EN_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_PULLUP_EN_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DP_PULLUP_EN_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.DP_PULLUP_EN_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DM_PULLUP_HISEL_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DM_PULLUP_HISEL_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DM_PULLUP_HISEL_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DM_PULLUP_HISEL_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.DM_PULLUP_HISEL_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DP_PULLUP_HISEL_OVERRIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_PULLUP_HISEL_OVERRIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DP_PULLUP_HISEL_OVERRIDE_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DP_PULLUP_HISEL_OVERRIDE_EN_Field.self, Bool.self)
                  self.raw.DP_PULLUP_HISEL_OVERRIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Used to adjust trim values of USB phy pull down resistors.
    public var USBPHY_TRIM: Register<USBPHY_TRIM_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0084), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0084))
          #endif
        }
    }
    public struct USBPHY_TRIM_Descriptor {
        @available(*, unavailable)
        /// Value to drive to USB PHY
        /// DM pulldown resistor trim control
        /// Experimental data suggests that the reset value will work, but this register allows adjustment if required
        public var DM_PULLDN_TRIM: DM_PULLDN_TRIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Value to drive to USB PHY
        /// DP pulldown resistor trim control
        /// Experimental data suggests that the reset value will work, but this register allows adjustment if required
        public var DP_PULLDN_TRIM: DP_PULLDN_TRIM_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DM_PULLDN_TRIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 13
        }

        public enum DP_PULLDN_TRIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = USBPHY_TRIM_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DM_PULLDN_TRIM: UInt32 {
                @inlinable @inline(__always) get {
                    DM_PULLDN_TRIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DM_PULLDN_TRIM_Field.insert(newValue, into: &self.storage)
                }
                }
              public var DP_PULLDN_TRIM: UInt32 {
                @inlinable @inline(__always) get {
                  DP_PULLDN_TRIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DP_PULLDN_TRIM_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = USBPHY_TRIM_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DM_PULLDN_TRIM: BitField5 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DM_PULLDN_TRIM_Field.self, BitField5.self)
                    return BitField5(storage: self.raw.DM_PULLDN_TRIM)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DM_PULLDN_TRIM_Field.self, BitField5.self)
                    self.raw.DM_PULLDN_TRIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var DP_PULLDN_TRIM: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DP_PULLDN_TRIM_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.DP_PULLDN_TRIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DP_PULLDN_TRIM_Field.self, BitField5.self)
                  self.raw.DP_PULLDN_TRIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Raw Interrupts
    public var INTR: Register<INTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x008c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x008c))
          #endif
        }
    }
    public struct INTR_Descriptor {
        @available(*, unavailable)
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        public var EP_STALL_NAK: EP_STALL_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        public var ABORT_DONE: ABORT_DONE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        public var DEV_SOF: DEV_SOF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device. Source: SIE_STATUS.SETUP_REC
        public var SETUP_REQ: SETUP_REQ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME
        public var DEV_RESUME_FROM_HOST: DEV_RESUME_FROM_HOST_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        public var DEV_SUSPEND: DEV_SUSPEND_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        public var DEV_CONN_DIS: DEV_CONN_DIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.BUS_RESET
        public var BUS_RESET: BUS_RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.VBUS_DETECTED
        public var VBUS_DETECT: VBUS_DETECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.STALL_REC
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.CRC_ERROR
        public var ERROR_CRC: ERROR_CRC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        public var ERROR_BIT_STUFF: ERROR_BIT_STUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.RX_OVERFLOW
        public var ERROR_RX_OVERFLOW: ERROR_RX_OVERFLOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.RX_TIMEOUT
        public var ERROR_RX_TIMEOUT: ERROR_RX_TIMEOUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        public var ERROR_DATA_SEQ: ERROR_DATA_SEQ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        public var BUFF_STATUS: BUFF_STATUS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        public var TRANS_COMPLETE: TRANS_COMPLETE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        public var HOST_SOF: HOST_SOF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME
        public var HOST_RESUME: HOST_RESUME_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        public var HOST_CONN_DIS: HOST_CONN_DIS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP_STALL_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum ABORT_DONE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum DEV_SOF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum SETUP_REQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum DEV_RESUME_FROM_HOST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum DEV_SUSPEND_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum DEV_CONN_DIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum BUS_RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum VBUS_DETECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum ERROR_CRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum ERROR_BIT_STUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum ERROR_RX_OVERFLOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum ERROR_RX_TIMEOUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum ERROR_DATA_SEQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum BUFF_STATUS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum TRANS_COMPLETE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum HOST_SOF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum HOST_RESUME_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum HOST_CONN_DIS_Field: ContiguousBitField {
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
                public var EP_STALL_NAK: UInt32 {
                @inlinable @inline(__always) get {
                    EP_STALL_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP_STALL_NAK_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ABORT_DONE: UInt32 {
                @inlinable @inline(__always) get {
                  ABORT_DONE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABORT_DONE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_SOF: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_SOF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_SOF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SETUP_REQ: UInt32 {
                @inlinable @inline(__always) get {
                  SETUP_REQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SETUP_REQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_RESUME_FROM_HOST: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_RESUME_FROM_HOST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_RESUME_FROM_HOST_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_SUSPEND: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_SUSPEND_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_SUSPEND_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_CONN_DIS: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_CONN_DIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_CONN_DIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUS_RESET: UInt32 {
                @inlinable @inline(__always) get {
                  BUS_RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUS_RESET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_DETECT: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_DETECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_DETECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STALL: UInt32 {
                @inlinable @inline(__always) get {
                  STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_CRC: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_CRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_CRC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_BIT_STUFF: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_BIT_STUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_BIT_STUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_RX_OVERFLOW: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_RX_OVERFLOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_RX_OVERFLOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_RX_TIMEOUT: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_RX_TIMEOUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_RX_TIMEOUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_DATA_SEQ: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_DATA_SEQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_DATA_SEQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFF_STATUS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFF_STATUS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFF_STATUS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TRANS_COMPLETE: UInt32 {
                @inlinable @inline(__always) get {
                  TRANS_COMPLETE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TRANS_COMPLETE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_SOF: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_SOF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_SOF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_RESUME: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_RESUME_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_RESUME_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_CONN_DIS: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_CONN_DIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_CONN_DIS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var EP_STALL_NAK: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP_STALL_NAK_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP_STALL_NAK)
                }
                }
              public var ABORT_DONE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABORT_DONE_Field.self, Bool.self)
                  return Bool(storage: self.raw.ABORT_DONE)
                }
              }
              public var DEV_SOF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_SOF_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_SOF)
                }
              }
              public var SETUP_REQ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SETUP_REQ_Field.self, Bool.self)
                  return Bool(storage: self.raw.SETUP_REQ)
                }
              }
              public var DEV_RESUME_FROM_HOST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_RESUME_FROM_HOST_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_RESUME_FROM_HOST)
                }
              }
              public var DEV_SUSPEND: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_SUSPEND_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_SUSPEND)
                }
              }
              public var DEV_CONN_DIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_CONN_DIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_CONN_DIS)
                }
              }
              public var BUS_RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUS_RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUS_RESET)
                }
              }
              public var VBUS_DETECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_DETECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_DETECT)
                }
              }
              public var STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.STALL)
                }
              }
              public var ERROR_CRC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_CRC_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_CRC)
                }
              }
              public var ERROR_BIT_STUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_BIT_STUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_BIT_STUFF)
                }
              }
              public var ERROR_RX_OVERFLOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_RX_OVERFLOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_RX_OVERFLOW)
                }
              }
              public var ERROR_RX_TIMEOUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_RX_TIMEOUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_RX_TIMEOUT)
                }
              }
              public var ERROR_DATA_SEQ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_DATA_SEQ_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_DATA_SEQ)
                }
              }
              public var BUFF_STATUS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFF_STATUS_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUFF_STATUS)
                }
              }
              public var TRANS_COMPLETE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TRANS_COMPLETE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TRANS_COMPLETE)
                }
              }
              public var HOST_SOF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_SOF_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_SOF)
                }
              }
              public var HOST_RESUME: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_RESUME_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_RESUME)
                }
              }
              public var HOST_CONN_DIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_CONN_DIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_CONN_DIS)
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
          return .init(unsafeAddress: self.unsafeAddress + (0x0090), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0090))
          #endif
        }
    }
    public struct INTE_Descriptor {
        @available(*, unavailable)
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        public var EP_STALL_NAK: EP_STALL_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        public var ABORT_DONE: ABORT_DONE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        public var DEV_SOF: DEV_SOF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device. Source: SIE_STATUS.SETUP_REC
        public var SETUP_REQ: SETUP_REQ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME
        public var DEV_RESUME_FROM_HOST: DEV_RESUME_FROM_HOST_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        public var DEV_SUSPEND: DEV_SUSPEND_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        public var DEV_CONN_DIS: DEV_CONN_DIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.BUS_RESET
        public var BUS_RESET: BUS_RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.VBUS_DETECTED
        public var VBUS_DETECT: VBUS_DETECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.STALL_REC
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.CRC_ERROR
        public var ERROR_CRC: ERROR_CRC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        public var ERROR_BIT_STUFF: ERROR_BIT_STUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.RX_OVERFLOW
        public var ERROR_RX_OVERFLOW: ERROR_RX_OVERFLOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.RX_TIMEOUT
        public var ERROR_RX_TIMEOUT: ERROR_RX_TIMEOUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        public var ERROR_DATA_SEQ: ERROR_DATA_SEQ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        public var BUFF_STATUS: BUFF_STATUS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        public var TRANS_COMPLETE: TRANS_COMPLETE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        public var HOST_SOF: HOST_SOF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME
        public var HOST_RESUME: HOST_RESUME_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        public var HOST_CONN_DIS: HOST_CONN_DIS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP_STALL_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum ABORT_DONE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum DEV_SOF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum SETUP_REQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum DEV_RESUME_FROM_HOST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum DEV_SUSPEND_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum DEV_CONN_DIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum BUS_RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum VBUS_DETECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum ERROR_CRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum ERROR_BIT_STUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum ERROR_RX_OVERFLOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum ERROR_RX_TIMEOUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum ERROR_DATA_SEQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum BUFF_STATUS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum TRANS_COMPLETE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum HOST_SOF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum HOST_RESUME_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum HOST_CONN_DIS_Field: ContiguousBitField {
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
                public var EP_STALL_NAK: UInt32 {
                @inlinable @inline(__always) get {
                    EP_STALL_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP_STALL_NAK_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ABORT_DONE: UInt32 {
                @inlinable @inline(__always) get {
                  ABORT_DONE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABORT_DONE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_SOF: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_SOF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_SOF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SETUP_REQ: UInt32 {
                @inlinable @inline(__always) get {
                  SETUP_REQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SETUP_REQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_RESUME_FROM_HOST: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_RESUME_FROM_HOST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_RESUME_FROM_HOST_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_SUSPEND: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_SUSPEND_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_SUSPEND_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_CONN_DIS: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_CONN_DIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_CONN_DIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUS_RESET: UInt32 {
                @inlinable @inline(__always) get {
                  BUS_RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUS_RESET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_DETECT: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_DETECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_DETECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STALL: UInt32 {
                @inlinable @inline(__always) get {
                  STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_CRC: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_CRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_CRC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_BIT_STUFF: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_BIT_STUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_BIT_STUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_RX_OVERFLOW: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_RX_OVERFLOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_RX_OVERFLOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_RX_TIMEOUT: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_RX_TIMEOUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_RX_TIMEOUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_DATA_SEQ: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_DATA_SEQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_DATA_SEQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFF_STATUS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFF_STATUS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFF_STATUS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TRANS_COMPLETE: UInt32 {
                @inlinable @inline(__always) get {
                  TRANS_COMPLETE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TRANS_COMPLETE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_SOF: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_SOF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_SOF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_RESUME: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_RESUME_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_RESUME_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_CONN_DIS: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_CONN_DIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_CONN_DIS_Field.insert(newValue, into: &self.storage)
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
                public var EP_STALL_NAK: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP_STALL_NAK_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP_STALL_NAK)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(EP_STALL_NAK_Field.self, Bool.self)
                    self.raw.EP_STALL_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ABORT_DONE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABORT_DONE_Field.self, Bool.self)
                  return Bool(storage: self.raw.ABORT_DONE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ABORT_DONE_Field.self, Bool.self)
                  self.raw.ABORT_DONE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DEV_SOF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_SOF_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_SOF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DEV_SOF_Field.self, Bool.self)
                  self.raw.DEV_SOF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SETUP_REQ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SETUP_REQ_Field.self, Bool.self)
                  return Bool(storage: self.raw.SETUP_REQ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SETUP_REQ_Field.self, Bool.self)
                  self.raw.SETUP_REQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DEV_RESUME_FROM_HOST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_RESUME_FROM_HOST_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_RESUME_FROM_HOST)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DEV_RESUME_FROM_HOST_Field.self, Bool.self)
                  self.raw.DEV_RESUME_FROM_HOST = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DEV_SUSPEND: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_SUSPEND_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_SUSPEND)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DEV_SUSPEND_Field.self, Bool.self)
                  self.raw.DEV_SUSPEND = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DEV_CONN_DIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_CONN_DIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_CONN_DIS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DEV_CONN_DIS_Field.self, Bool.self)
                  self.raw.DEV_CONN_DIS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUS_RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUS_RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUS_RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUS_RESET_Field.self, Bool.self)
                  self.raw.BUS_RESET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var VBUS_DETECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_DETECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_DETECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(VBUS_DETECT_Field.self, Bool.self)
                  self.raw.VBUS_DETECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STALL_Field.self, Bool.self)
                  self.raw.STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERROR_CRC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_CRC_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_CRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERROR_CRC_Field.self, Bool.self)
                  self.raw.ERROR_CRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERROR_BIT_STUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_BIT_STUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_BIT_STUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERROR_BIT_STUFF_Field.self, Bool.self)
                  self.raw.ERROR_BIT_STUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERROR_RX_OVERFLOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_RX_OVERFLOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_RX_OVERFLOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERROR_RX_OVERFLOW_Field.self, Bool.self)
                  self.raw.ERROR_RX_OVERFLOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERROR_RX_TIMEOUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_RX_TIMEOUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_RX_TIMEOUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERROR_RX_TIMEOUT_Field.self, Bool.self)
                  self.raw.ERROR_RX_TIMEOUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERROR_DATA_SEQ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_DATA_SEQ_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_DATA_SEQ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERROR_DATA_SEQ_Field.self, Bool.self)
                  self.raw.ERROR_DATA_SEQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFF_STATUS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFF_STATUS_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUFF_STATUS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFF_STATUS_Field.self, Bool.self)
                  self.raw.BUFF_STATUS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TRANS_COMPLETE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TRANS_COMPLETE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TRANS_COMPLETE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TRANS_COMPLETE_Field.self, Bool.self)
                  self.raw.TRANS_COMPLETE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HOST_SOF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_SOF_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_SOF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HOST_SOF_Field.self, Bool.self)
                  self.raw.HOST_SOF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HOST_RESUME: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_RESUME_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_RESUME)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HOST_RESUME_Field.self, Bool.self)
                  self.raw.HOST_RESUME = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HOST_CONN_DIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_CONN_DIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_CONN_DIS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HOST_CONN_DIS_Field.self, Bool.self)
                  self.raw.HOST_CONN_DIS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Force
    public var INTF: Register<INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0094), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0094))
          #endif
        }
    }
    public struct INTF_Descriptor {
        @available(*, unavailable)
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        public var EP_STALL_NAK: EP_STALL_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        public var ABORT_DONE: ABORT_DONE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        public var DEV_SOF: DEV_SOF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device. Source: SIE_STATUS.SETUP_REC
        public var SETUP_REQ: SETUP_REQ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME
        public var DEV_RESUME_FROM_HOST: DEV_RESUME_FROM_HOST_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        public var DEV_SUSPEND: DEV_SUSPEND_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        public var DEV_CONN_DIS: DEV_CONN_DIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.BUS_RESET
        public var BUS_RESET: BUS_RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.VBUS_DETECTED
        public var VBUS_DETECT: VBUS_DETECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.STALL_REC
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.CRC_ERROR
        public var ERROR_CRC: ERROR_CRC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        public var ERROR_BIT_STUFF: ERROR_BIT_STUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.RX_OVERFLOW
        public var ERROR_RX_OVERFLOW: ERROR_RX_OVERFLOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.RX_TIMEOUT
        public var ERROR_RX_TIMEOUT: ERROR_RX_TIMEOUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        public var ERROR_DATA_SEQ: ERROR_DATA_SEQ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        public var BUFF_STATUS: BUFF_STATUS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        public var TRANS_COMPLETE: TRANS_COMPLETE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        public var HOST_SOF: HOST_SOF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME
        public var HOST_RESUME: HOST_RESUME_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        public var HOST_CONN_DIS: HOST_CONN_DIS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP_STALL_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum ABORT_DONE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum DEV_SOF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum SETUP_REQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum DEV_RESUME_FROM_HOST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum DEV_SUSPEND_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum DEV_CONN_DIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum BUS_RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum VBUS_DETECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum ERROR_CRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum ERROR_BIT_STUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum ERROR_RX_OVERFLOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum ERROR_RX_TIMEOUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum ERROR_DATA_SEQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum BUFF_STATUS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum TRANS_COMPLETE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum HOST_SOF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum HOST_RESUME_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum HOST_CONN_DIS_Field: ContiguousBitField {
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
                public var EP_STALL_NAK: UInt32 {
                @inlinable @inline(__always) get {
                    EP_STALL_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP_STALL_NAK_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ABORT_DONE: UInt32 {
                @inlinable @inline(__always) get {
                  ABORT_DONE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABORT_DONE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_SOF: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_SOF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_SOF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SETUP_REQ: UInt32 {
                @inlinable @inline(__always) get {
                  SETUP_REQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SETUP_REQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_RESUME_FROM_HOST: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_RESUME_FROM_HOST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_RESUME_FROM_HOST_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_SUSPEND: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_SUSPEND_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_SUSPEND_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_CONN_DIS: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_CONN_DIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_CONN_DIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUS_RESET: UInt32 {
                @inlinable @inline(__always) get {
                  BUS_RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUS_RESET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_DETECT: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_DETECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_DETECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STALL: UInt32 {
                @inlinable @inline(__always) get {
                  STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_CRC: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_CRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_CRC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_BIT_STUFF: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_BIT_STUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_BIT_STUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_RX_OVERFLOW: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_RX_OVERFLOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_RX_OVERFLOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_RX_TIMEOUT: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_RX_TIMEOUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_RX_TIMEOUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_DATA_SEQ: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_DATA_SEQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_DATA_SEQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFF_STATUS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFF_STATUS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFF_STATUS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TRANS_COMPLETE: UInt32 {
                @inlinable @inline(__always) get {
                  TRANS_COMPLETE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TRANS_COMPLETE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_SOF: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_SOF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_SOF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_RESUME: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_RESUME_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_RESUME_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_CONN_DIS: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_CONN_DIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_CONN_DIS_Field.insert(newValue, into: &self.storage)
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
                public var EP_STALL_NAK: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP_STALL_NAK_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP_STALL_NAK)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(EP_STALL_NAK_Field.self, Bool.self)
                    self.raw.EP_STALL_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ABORT_DONE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABORT_DONE_Field.self, Bool.self)
                  return Bool(storage: self.raw.ABORT_DONE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ABORT_DONE_Field.self, Bool.self)
                  self.raw.ABORT_DONE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DEV_SOF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_SOF_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_SOF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DEV_SOF_Field.self, Bool.self)
                  self.raw.DEV_SOF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SETUP_REQ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SETUP_REQ_Field.self, Bool.self)
                  return Bool(storage: self.raw.SETUP_REQ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SETUP_REQ_Field.self, Bool.self)
                  self.raw.SETUP_REQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DEV_RESUME_FROM_HOST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_RESUME_FROM_HOST_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_RESUME_FROM_HOST)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DEV_RESUME_FROM_HOST_Field.self, Bool.self)
                  self.raw.DEV_RESUME_FROM_HOST = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DEV_SUSPEND: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_SUSPEND_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_SUSPEND)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DEV_SUSPEND_Field.self, Bool.self)
                  self.raw.DEV_SUSPEND = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DEV_CONN_DIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_CONN_DIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_CONN_DIS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DEV_CONN_DIS_Field.self, Bool.self)
                  self.raw.DEV_CONN_DIS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUS_RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUS_RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUS_RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUS_RESET_Field.self, Bool.self)
                  self.raw.BUS_RESET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var VBUS_DETECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_DETECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_DETECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(VBUS_DETECT_Field.self, Bool.self)
                  self.raw.VBUS_DETECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STALL_Field.self, Bool.self)
                  self.raw.STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERROR_CRC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_CRC_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_CRC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERROR_CRC_Field.self, Bool.self)
                  self.raw.ERROR_CRC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERROR_BIT_STUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_BIT_STUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_BIT_STUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERROR_BIT_STUFF_Field.self, Bool.self)
                  self.raw.ERROR_BIT_STUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERROR_RX_OVERFLOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_RX_OVERFLOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_RX_OVERFLOW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERROR_RX_OVERFLOW_Field.self, Bool.self)
                  self.raw.ERROR_RX_OVERFLOW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERROR_RX_TIMEOUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_RX_TIMEOUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_RX_TIMEOUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERROR_RX_TIMEOUT_Field.self, Bool.self)
                  self.raw.ERROR_RX_TIMEOUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERROR_DATA_SEQ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_DATA_SEQ_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_DATA_SEQ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERROR_DATA_SEQ_Field.self, Bool.self)
                  self.raw.ERROR_DATA_SEQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFF_STATUS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFF_STATUS_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUFF_STATUS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFF_STATUS_Field.self, Bool.self)
                  self.raw.BUFF_STATUS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TRANS_COMPLETE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TRANS_COMPLETE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TRANS_COMPLETE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TRANS_COMPLETE_Field.self, Bool.self)
                  self.raw.TRANS_COMPLETE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HOST_SOF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_SOF_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_SOF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HOST_SOF_Field.self, Bool.self)
                  self.raw.HOST_SOF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HOST_RESUME: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_RESUME_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_RESUME)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HOST_RESUME_Field.self, Bool.self)
                  self.raw.HOST_RESUME = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HOST_CONN_DIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_CONN_DIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_CONN_DIS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HOST_CONN_DIS_Field.self, Bool.self)
                  self.raw.HOST_CONN_DIS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt status after masking & forcing
    public var INTS: Register<INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0098), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0098))
          #endif
        }
    }
    public struct INTS_Descriptor {
        @available(*, unavailable)
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        public var EP_STALL_NAK: EP_STALL_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        public var ABORT_DONE: ABORT_DONE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        public var DEV_SOF: DEV_SOF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Device. Source: SIE_STATUS.SETUP_REC
        public var SETUP_REQ: SETUP_REQ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME
        public var DEV_RESUME_FROM_HOST: DEV_RESUME_FROM_HOST_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        public var DEV_SUSPEND: DEV_SUSPEND_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        public var DEV_CONN_DIS: DEV_CONN_DIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.BUS_RESET
        public var BUS_RESET: BUS_RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.VBUS_DETECTED
        public var VBUS_DETECT: VBUS_DETECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.STALL_REC
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.CRC_ERROR
        public var ERROR_CRC: ERROR_CRC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        public var ERROR_BIT_STUFF: ERROR_BIT_STUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.RX_OVERFLOW
        public var ERROR_RX_OVERFLOW: ERROR_RX_OVERFLOW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.RX_TIMEOUT
        public var ERROR_RX_TIMEOUT: ERROR_RX_TIMEOUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        public var ERROR_DATA_SEQ: ERROR_DATA_SEQ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        public var BUFF_STATUS: BUFF_STATUS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        public var TRANS_COMPLETE: TRANS_COMPLETE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        public var HOST_SOF: HOST_SOF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME
        public var HOST_RESUME: HOST_RESUME_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        public var HOST_CONN_DIS: HOST_CONN_DIS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EP_STALL_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum ABORT_DONE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum DEV_SOF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum SETUP_REQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum DEV_RESUME_FROM_HOST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum DEV_SUSPEND_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum DEV_CONN_DIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum BUS_RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum VBUS_DETECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum ERROR_CRC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum ERROR_BIT_STUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum ERROR_RX_OVERFLOW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum ERROR_RX_TIMEOUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum ERROR_DATA_SEQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum BUFF_STATUS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum TRANS_COMPLETE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum HOST_SOF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum HOST_RESUME_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum HOST_CONN_DIS_Field: ContiguousBitField {
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
                public var EP_STALL_NAK: UInt32 {
                @inlinable @inline(__always) get {
                    EP_STALL_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EP_STALL_NAK_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ABORT_DONE: UInt32 {
                @inlinable @inline(__always) get {
                  ABORT_DONE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABORT_DONE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_SOF: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_SOF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_SOF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SETUP_REQ: UInt32 {
                @inlinable @inline(__always) get {
                  SETUP_REQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SETUP_REQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_RESUME_FROM_HOST: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_RESUME_FROM_HOST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_RESUME_FROM_HOST_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_SUSPEND: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_SUSPEND_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_SUSPEND_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DEV_CONN_DIS: UInt32 {
                @inlinable @inline(__always) get {
                  DEV_CONN_DIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DEV_CONN_DIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUS_RESET: UInt32 {
                @inlinable @inline(__always) get {
                  BUS_RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUS_RESET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VBUS_DETECT: UInt32 {
                @inlinable @inline(__always) get {
                  VBUS_DETECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VBUS_DETECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STALL: UInt32 {
                @inlinable @inline(__always) get {
                  STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_CRC: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_CRC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_CRC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_BIT_STUFF: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_BIT_STUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_BIT_STUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_RX_OVERFLOW: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_RX_OVERFLOW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_RX_OVERFLOW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_RX_TIMEOUT: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_RX_TIMEOUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_RX_TIMEOUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERROR_DATA_SEQ: UInt32 {
                @inlinable @inline(__always) get {
                  ERROR_DATA_SEQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERROR_DATA_SEQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFF_STATUS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFF_STATUS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFF_STATUS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TRANS_COMPLETE: UInt32 {
                @inlinable @inline(__always) get {
                  TRANS_COMPLETE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TRANS_COMPLETE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_SOF: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_SOF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_SOF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_RESUME: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_RESUME_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_RESUME_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HOST_CONN_DIS: UInt32 {
                @inlinable @inline(__always) get {
                  HOST_CONN_DIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HOST_CONN_DIS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var EP_STALL_NAK: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EP_STALL_NAK_Field.self, Bool.self)
                    return Bool(storage: self.raw.EP_STALL_NAK)
                }
                }
              public var ABORT_DONE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABORT_DONE_Field.self, Bool.self)
                  return Bool(storage: self.raw.ABORT_DONE)
                }
              }
              public var DEV_SOF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_SOF_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_SOF)
                }
              }
              public var SETUP_REQ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SETUP_REQ_Field.self, Bool.self)
                  return Bool(storage: self.raw.SETUP_REQ)
                }
              }
              public var DEV_RESUME_FROM_HOST: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_RESUME_FROM_HOST_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_RESUME_FROM_HOST)
                }
              }
              public var DEV_SUSPEND: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_SUSPEND_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_SUSPEND)
                }
              }
              public var DEV_CONN_DIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DEV_CONN_DIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.DEV_CONN_DIS)
                }
              }
              public var BUS_RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUS_RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUS_RESET)
                }
              }
              public var VBUS_DETECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VBUS_DETECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.VBUS_DETECT)
                }
              }
              public var STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.STALL)
                }
              }
              public var ERROR_CRC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_CRC_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_CRC)
                }
              }
              public var ERROR_BIT_STUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_BIT_STUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_BIT_STUFF)
                }
              }
              public var ERROR_RX_OVERFLOW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_RX_OVERFLOW_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_RX_OVERFLOW)
                }
              }
              public var ERROR_RX_TIMEOUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_RX_TIMEOUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_RX_TIMEOUT)
                }
              }
              public var ERROR_DATA_SEQ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERROR_DATA_SEQ_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERROR_DATA_SEQ)
                }
              }
              public var BUFF_STATUS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFF_STATUS_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUFF_STATUS)
                }
              }
              public var TRANS_COMPLETE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TRANS_COMPLETE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TRANS_COMPLETE)
                }
              }
              public var HOST_SOF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_SOF_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_SOF)
                }
              }
              public var HOST_RESUME: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_RESUME_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_RESUME)
                }
              }
              public var HOST_CONN_DIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HOST_CONN_DIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.HOST_CONN_DIS)
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

extension USBCTRL_REGS.ADDR_ENDP_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP1_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP2_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP3_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP4_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP5_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP6_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP7_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP8_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP9_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP10_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP11_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP12_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP13_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP14_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.ADDR_ENDP15_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.MAIN_CTRL_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.SOF_WR_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.SOF_RD_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.SIE_CTRL_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.SIE_STATUS_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.INT_EP_CTRL_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.BUFF_STATUS_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.BUFF_CPU_SHOULD_HANDLE_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.EP_ABORT_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.EP_ABORT_DONE_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.EP_STALL_ARM_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.NAK_POLL_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.EP_STATUS_STALL_NAK_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.USB_MUXING_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.USB_PWR_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.USBPHY_DIRECT_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.USBPHY_DIRECT_OVERRIDE_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.USBPHY_TRIM_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.INTR_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.INTE_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.INTF_Descriptor: RegisterValue {
}

extension USBCTRL_REGS.INTS_Descriptor: RegisterValue {
}
