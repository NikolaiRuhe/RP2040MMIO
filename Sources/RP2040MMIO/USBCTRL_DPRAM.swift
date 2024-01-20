import MMIO
import MMIOExtensions

/// DPRAM layout for USB device.
public struct USBCTRL_DPRAM {

    public static var `default`: Self { .init(unsafeAddress: 0x50100000) }

    /// Bytes 0-3 of the SETUP packet from the host.
    public var SETUP_PACKET_LOW: Register<SETUP_PACKET_LOW_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct SETUP_PACKET_LOW_Descriptor {
        @available(*, unavailable)
        public var WVALUE: WVALUE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var BREQUEST: BREQUEST_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var BMREQUESTTYPE: BMREQUESTTYPE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum WVALUE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum BREQUEST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 16
        }

        public enum BMREQUESTTYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SETUP_PACKET_LOW_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var WVALUE: UInt32 {
                @inlinable @inline(__always) get {
                    WVALUE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    WVALUE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var BREQUEST: UInt32 {
                @inlinable @inline(__always) get {
                  BREQUEST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BREQUEST_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BMREQUESTTYPE: UInt32 {
                @inlinable @inline(__always) get {
                  BMREQUESTTYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BMREQUESTTYPE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SETUP_PACKET_LOW_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var WVALUE: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(WVALUE_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.WVALUE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(WVALUE_Field.self, BitField16.self)
                    self.raw.WVALUE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var BREQUEST: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BREQUEST_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.BREQUEST)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BREQUEST_Field.self, BitField8.self)
                  self.raw.BREQUEST = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BMREQUESTTYPE: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BMREQUESTTYPE_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.BMREQUESTTYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BMREQUESTTYPE_Field.self, BitField8.self)
                  self.raw.BMREQUESTTYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Bytes 4-7 of the setup packet from the host.
    public var SETUP_PACKET_HIGH: Register<SETUP_PACKET_HIGH_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct SETUP_PACKET_HIGH_Descriptor {
        @available(*, unavailable)
        public var WLENGTH: WLENGTH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var WINDEX: WINDEX_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum WLENGTH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum WINDEX_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SETUP_PACKET_HIGH_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var WLENGTH: UInt32 {
                @inlinable @inline(__always) get {
                    WLENGTH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    WLENGTH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var WINDEX: UInt32 {
                @inlinable @inline(__always) get {
                  WINDEX_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WINDEX_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SETUP_PACKET_HIGH_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var WLENGTH: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(WLENGTH_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.WLENGTH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(WLENGTH_Field.self, BitField16.self)
                    self.raw.WLENGTH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WINDEX: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WINDEX_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.WINDEX)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WINDEX_Field.self, BitField16.self)
                  self.raw.WINDEX = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP1_IN_CONTROL: Register<EP1_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct EP1_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP1_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP1_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP1_OUT_CONTROL: Register<EP1_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct EP1_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP1_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP1_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP2_IN_CONTROL: Register<EP2_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct EP2_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP2_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP2_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP2_OUT_CONTROL: Register<EP2_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct EP2_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP2_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP2_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP3_IN_CONTROL: Register<EP3_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct EP3_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP3_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP3_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP3_OUT_CONTROL: Register<EP3_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct EP3_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP3_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP3_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP4_IN_CONTROL: Register<EP4_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct EP4_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP4_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP4_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP4_OUT_CONTROL: Register<EP4_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct EP4_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP4_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP4_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP5_IN_CONTROL: Register<EP5_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct EP5_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP5_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP5_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP5_OUT_CONTROL: Register<EP5_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct EP5_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP5_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP5_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP6_IN_CONTROL: Register<EP6_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct EP6_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP6_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP6_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP6_OUT_CONTROL: Register<EP6_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct EP6_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP6_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP6_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP7_IN_CONTROL: Register<EP7_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct EP7_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP7_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP7_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP7_OUT_CONTROL: Register<EP7_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct EP7_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP7_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP7_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP8_IN_CONTROL: Register<EP8_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct EP8_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP8_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP8_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP8_OUT_CONTROL: Register<EP8_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct EP8_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP8_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP8_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP9_IN_CONTROL: Register<EP9_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct EP9_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP9_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP9_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP9_OUT_CONTROL: Register<EP9_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x004c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x004c))
          #endif
        }
    }
    public struct EP9_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP9_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP9_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP10_IN_CONTROL: Register<EP10_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct EP10_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP10_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP10_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP10_OUT_CONTROL: Register<EP10_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct EP10_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP10_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP10_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP11_IN_CONTROL: Register<EP11_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0058), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0058))
          #endif
        }
    }
    public struct EP11_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP11_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP11_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP11_OUT_CONTROL: Register<EP11_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x005c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x005c))
          #endif
        }
    }
    public struct EP11_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP11_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP11_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP12_IN_CONTROL: Register<EP12_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0060), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0060))
          #endif
        }
    }
    public struct EP12_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP12_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP12_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP12_OUT_CONTROL: Register<EP12_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0064), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0064))
          #endif
        }
    }
    public struct EP12_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP12_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP12_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP13_IN_CONTROL: Register<EP13_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0068), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0068))
          #endif
        }
    }
    public struct EP13_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP13_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP13_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP13_OUT_CONTROL: Register<EP13_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x006c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x006c))
          #endif
        }
    }
    public struct EP13_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP13_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP13_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP14_IN_CONTROL: Register<EP14_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0070), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0070))
          #endif
        }
    }
    public struct EP14_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP14_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP14_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP14_OUT_CONTROL: Register<EP14_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0074), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0074))
          #endif
        }
    }
    public struct EP14_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP14_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP14_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP15_IN_CONTROL: Register<EP15_IN_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0078), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0078))
          #endif
        }
    }
    public struct EP15_IN_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP15_IN_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP15_IN_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }
    public var EP15_OUT_CONTROL: Register<EP15_OUT_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x007c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x007c))
          #endif
        }
    }
    public struct EP15_OUT_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This endpoint is double buffered.
        public var DOUBLE_BUFFERED: DOUBLE_BUFFERED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time a buffer is done.
        public var INTERRUPT_PER_BUFF: INTERRUPT_PER_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        public var INTERRUPT_PER_DOUBLE_BUFF: INTERRUPT_PER_DOUBLE_BUFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var ENDPOINT_TYPE: ENDPOINT_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        public var INTERRUPT_ON_STALL: INTERRUPT_ON_STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        public var INTERRUPT_ON_NAK: INTERRUPT_ON_NAK_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        public var BUFFER_ADDRESS: BUFFER_ADDRESS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum DOUBLE_BUFFERED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum INTERRUPT_PER_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum INTERRUPT_PER_DOUBLE_BUFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 29
        }

        public enum ENDPOINT_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 28
        }

        public enum INTERRUPT_ON_STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum INTERRUPT_ON_NAK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum BUFFER_ADDRESS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP15_OUT_CONTROL_Descriptor

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
              public var DOUBLE_BUFFERED: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFERED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFERED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_PER_DOUBLE_BUFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENDPOINT_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  ENDPOINT_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENDPOINT_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_STALL: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_STALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_STALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTERRUPT_ON_NAK: UInt32 {
                @inlinable @inline(__always) get {
                  INTERRUPT_ON_NAK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTERRUPT_ON_NAK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUFFER_ADDRESS: UInt32 {
                @inlinable @inline(__always) get {
                  BUFFER_ADDRESS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUFFER_ADDRESS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP15_OUT_CONTROL_Descriptor
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
              public var DOUBLE_BUFFERED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  return Bool(storage: self.raw.DOUBLE_BUFFERED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFERED_Field.self, Bool.self)
                  self.raw.DOUBLE_BUFFERED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_PER_DOUBLE_BUFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_PER_DOUBLE_BUFF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_PER_DOUBLE_BUFF_Field.self, Bool.self)
                  self.raw.INTERRUPT_PER_DOUBLE_BUFF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENDPOINT_TYPE: ENDPOINT_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  return ENDPOINT_TYPE_Values(storage: self.raw.ENDPOINT_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENDPOINT_TYPE_Field.self, ENDPOINT_TYPE_Values.self)
                  self.raw.ENDPOINT_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_STALL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_STALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_STALL_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_STALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INTERRUPT_ON_NAK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTERRUPT_ON_NAK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INTERRUPT_ON_NAK_Field.self, Bool.self)
                  self.raw.INTERRUPT_ON_NAK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BUFFER_ADDRESS: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.BUFFER_ADDRESS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BUFFER_ADDRESS_Field.self, BitField16.self)
                  self.raw.BUFFER_ADDRESS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP0_IN_BUFFER_CONTROL: Register<EP0_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0080), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0080))
          #endif
        }
    }
    public struct EP0_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP0_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP0_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP0_OUT_BUFFER_CONTROL: Register<EP0_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0084), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0084))
          #endif
        }
    }
    public struct EP0_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP0_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP0_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP1_IN_BUFFER_CONTROL: Register<EP1_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0088), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0088))
          #endif
        }
    }
    public struct EP1_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP1_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP1_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP1_OUT_BUFFER_CONTROL: Register<EP1_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x008c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x008c))
          #endif
        }
    }
    public struct EP1_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP1_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP1_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP2_IN_BUFFER_CONTROL: Register<EP2_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0090), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0090))
          #endif
        }
    }
    public struct EP2_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP2_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP2_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP2_OUT_BUFFER_CONTROL: Register<EP2_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0094), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0094))
          #endif
        }
    }
    public struct EP2_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP2_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP2_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP3_IN_BUFFER_CONTROL: Register<EP3_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0098), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0098))
          #endif
        }
    }
    public struct EP3_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP3_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP3_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP3_OUT_BUFFER_CONTROL: Register<EP3_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x009c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x009c))
          #endif
        }
    }
    public struct EP3_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP3_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP3_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP4_IN_BUFFER_CONTROL: Register<EP4_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0))
          #endif
        }
    }
    public struct EP4_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP4_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP4_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP4_OUT_BUFFER_CONTROL: Register<EP4_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4))
          #endif
        }
    }
    public struct EP4_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP4_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP4_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP5_IN_BUFFER_CONTROL: Register<EP5_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8))
          #endif
        }
    }
    public struct EP5_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP5_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP5_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP5_OUT_BUFFER_CONTROL: Register<EP5_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac))
          #endif
        }
    }
    public struct EP5_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP5_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP5_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP6_IN_BUFFER_CONTROL: Register<EP6_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0))
          #endif
        }
    }
    public struct EP6_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP6_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP6_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP6_OUT_BUFFER_CONTROL: Register<EP6_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b4))
          #endif
        }
    }
    public struct EP6_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP6_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP6_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP7_IN_BUFFER_CONTROL: Register<EP7_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b8))
          #endif
        }
    }
    public struct EP7_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP7_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP7_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP7_OUT_BUFFER_CONTROL: Register<EP7_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00bc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00bc))
          #endif
        }
    }
    public struct EP7_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP7_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP7_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP8_IN_BUFFER_CONTROL: Register<EP8_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c0))
          #endif
        }
    }
    public struct EP8_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP8_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP8_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP8_OUT_BUFFER_CONTROL: Register<EP8_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c4))
          #endif
        }
    }
    public struct EP8_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP8_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP8_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP9_IN_BUFFER_CONTROL: Register<EP9_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c8))
          #endif
        }
    }
    public struct EP9_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP9_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP9_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP9_OUT_BUFFER_CONTROL: Register<EP9_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00cc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00cc))
          #endif
        }
    }
    public struct EP9_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP9_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP9_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP10_IN_BUFFER_CONTROL: Register<EP10_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d0))
          #endif
        }
    }
    public struct EP10_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP10_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP10_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP10_OUT_BUFFER_CONTROL: Register<EP10_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d4))
          #endif
        }
    }
    public struct EP10_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP10_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP10_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP11_IN_BUFFER_CONTROL: Register<EP11_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d8))
          #endif
        }
    }
    public struct EP11_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP11_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP11_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP11_OUT_BUFFER_CONTROL: Register<EP11_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00dc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00dc))
          #endif
        }
    }
    public struct EP11_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP11_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP11_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP12_IN_BUFFER_CONTROL: Register<EP12_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e0))
          #endif
        }
    }
    public struct EP12_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP12_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP12_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP12_OUT_BUFFER_CONTROL: Register<EP12_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e4))
          #endif
        }
    }
    public struct EP12_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP12_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP12_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP13_IN_BUFFER_CONTROL: Register<EP13_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e8))
          #endif
        }
    }
    public struct EP13_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP13_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP13_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP13_OUT_BUFFER_CONTROL: Register<EP13_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00ec), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00ec))
          #endif
        }
    }
    public struct EP13_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP13_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP13_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP14_IN_BUFFER_CONTROL: Register<EP14_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f0))
          #endif
        }
    }
    public struct EP14_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP14_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP14_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP14_OUT_BUFFER_CONTROL: Register<EP14_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4))
          #endif
        }
    }
    public struct EP14_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP14_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP14_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP15_IN_BUFFER_CONTROL: Register<EP15_IN_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8))
          #endif
        }
    }
    public struct EP15_IN_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP15_IN_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP15_IN_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    public var EP15_OUT_BUFFER_CONTROL: Register<EP15_OUT_BUFFER_CONTROL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00fc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00fc))
          #endif
        }
    }
    public struct EP15_OUT_BUFFER_CONTROL_Descriptor {
        @available(*, unavailable)
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_1: FULL_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 1 is the last buffer of the transfer.
        public var LAST_1: LAST_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 1.
        public var PID_1: PID_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Field {
            get {
                fatalError()
            }
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_1: AVAILABLE_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 1.
        public var LENGTH_1: LENGTH_1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        public var FULL_0: FULL_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is the last buffer of the transfer.
        public var LAST_0: LAST_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The data pid of buffer 0.
        public var PID_0: PID_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reset the buffer selector to buffer 0.
        public var RESET: RESET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reply with a stall (valid for both buffers).
        public var STALL: STALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        public var AVAILABLE_0: AVAILABLE_0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The length of the data in buffer 0.
        public var LENGTH_0: LENGTH_0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FULL_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum LAST_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PID_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum DOUBLE_BUFFER_ISO_OFFSET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 27 ..< 29
        }

        public enum AVAILABLE_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 27
        }

        public enum LENGTH_1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 26
        }

        public enum FULL_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum LAST_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum PID_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum RESET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum STALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum AVAILABLE_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum LENGTH_0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EP15_OUT_BUFFER_CONTROL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FULL_1: UInt32 {
                @inlinable @inline(__always) get {
                    FULL_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FULL_1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LAST_1: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_1: UInt32 {
                @inlinable @inline(__always) get {
                  PID_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: UInt32 {
                @inlinable @inline(__always) get {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DOUBLE_BUFFER_ISO_OFFSET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AVAILABLE_1: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_1: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL_0: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LAST_0: UInt32 {
                @inlinable @inline(__always) get {
                  LAST_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LAST_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PID_0: UInt32 {
                @inlinable @inline(__always) get {
                  PID_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PID_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RESET: UInt32 {
                @inlinable @inline(__always) get {
                  RESET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESET_Field.insert(newValue, into: &self.storage)
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
              public var AVAILABLE_0: UInt32 {
                @inlinable @inline(__always) get {
                  AVAILABLE_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AVAILABLE_0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LENGTH_0: UInt32 {
                @inlinable @inline(__always) get {
                  LENGTH_0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LENGTH_0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EP15_OUT_BUFFER_CONTROL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FULL_1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    return Bool(storage: self.raw.FULL_1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FULL_1_Field.self, Bool.self)
                    self.raw.FULL_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var LAST_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_1_Field.self, Bool.self)
                  self.raw.LAST_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_1_Field.self, Bool.self)
                  self.raw.PID_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DOUBLE_BUFFER_ISO_OFFSET: DOUBLE_BUFFER_ISO_OFFSET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  return DOUBLE_BUFFER_ISO_OFFSET_Values(storage: self.raw.DOUBLE_BUFFER_ISO_OFFSET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DOUBLE_BUFFER_ISO_OFFSET_Field.self, DOUBLE_BUFFER_ISO_OFFSET_Values.self)
                  self.raw.DOUBLE_BUFFER_ISO_OFFSET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AVAILABLE_1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_1_Field.self, Bool.self)
                  self.raw.AVAILABLE_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_1: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_1_Field.self, BitField10.self)
                  self.raw.LENGTH_1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FULL_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FULL_0_Field.self, Bool.self)
                  self.raw.FULL_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LAST_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.LAST_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LAST_0_Field.self, Bool.self)
                  self.raw.LAST_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PID_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.PID_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PID_0_Field.self, Bool.self)
                  self.raw.PID_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RESET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  return Bool(storage: self.raw.RESET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RESET_Field.self, Bool.self)
                  self.raw.RESET = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var AVAILABLE_0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  return Bool(storage: self.raw.AVAILABLE_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AVAILABLE_0_Field.self, Bool.self)
                  self.raw.AVAILABLE_0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LENGTH_0: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.LENGTH_0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LENGTH_0_Field.self, BitField10.self)
                  self.raw.LENGTH_0 = newValue.storage(Self.Value.Raw.Storage.self)
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

extension USBCTRL_DPRAM.SETUP_PACKET_LOW_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.SETUP_PACKET_HIGH_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP1_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP1_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP2_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP2_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP3_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP3_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP4_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP4_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP5_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP5_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP6_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP6_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP7_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP7_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP8_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP8_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP9_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP9_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP10_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP10_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP11_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP11_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP12_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP12_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP13_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP13_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP14_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP14_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP15_IN_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP15_OUT_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP0_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP0_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP1_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP1_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP2_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP2_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP3_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP3_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP4_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP4_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP5_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP5_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP6_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP6_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP7_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP7_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP8_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP8_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP9_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP9_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP10_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP10_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP11_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP11_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP12_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP12_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP13_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP13_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP14_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP14_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP15_IN_BUFFER_CONTROL_Descriptor: RegisterValue {
}

extension USBCTRL_DPRAM.EP15_OUT_BUFFER_CONTROL_Descriptor: RegisterValue {
}
