import MMIO
import MMIOExtensions
public struct SYSINFO {

    public static var `default`: Self { .init(unsafeAddress: 0x40000000) }

    /// JEDEC JEP-106 compliant chip identifier.
    public var CHIP_ID: Register<CHIP_ID_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CHIP_ID_Descriptor {
        @available(*, unavailable)
        public var REVISION: REVISION_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var PART: PART_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var MANUFACTURER: MANUFACTURER_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum REVISION_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 32
        }

        public enum PART_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 28
        }

        public enum MANUFACTURER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 12
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CHIP_ID_Descriptor

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
                public var REVISION: UInt32 {
                @inlinable @inline(__always) get {
                    REVISION_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    REVISION_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PART: UInt32 {
                @inlinable @inline(__always) get {
                  PART_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PART_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MANUFACTURER: UInt32 {
                @inlinable @inline(__always) get {
                  MANUFACTURER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MANUFACTURER_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = CHIP_ID_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var REVISION: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(REVISION_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.REVISION)
                }
                }
              public var PART: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PART_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.PART)
                }
              }
              public var MANUFACTURER: BitField12 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MANUFACTURER_Field.self, BitField12.self)
                  return BitField12(storage: self.raw.MANUFACTURER)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = CHIP_ID_Descriptor
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

    /// Platform register. Allows software to know what environment it is running in.
    public var PLATFORM: Register<PLATFORM_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct PLATFORM_Descriptor {
        @available(*, unavailable)
        public var ASIC: ASIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FPGA: FPGA_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ASIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum FPGA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = PLATFORM_Descriptor

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
                public var ASIC: UInt32 {
                @inlinable @inline(__always) get {
                    ASIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ASIC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FPGA: UInt32 {
                @inlinable @inline(__always) get {
                  FPGA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FPGA_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = PLATFORM_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var ASIC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ASIC_Field.self, Bool.self)
                    return Bool(storage: self.raw.ASIC)
                }
                }
              public var FPGA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FPGA_Field.self, Bool.self)
                  return Bool(storage: self.raw.FPGA)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = PLATFORM_Descriptor
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

    /// Git hash of the chip source. Used to identify chip version.
    public var GITREF_RP2040: Register<GITREF_RP2040_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct GITREF_RP2040_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GITREF_RP2040_Descriptor

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

                    public  typealias Value = GITREF_RP2040_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

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

extension SYSINFO.CHIP_ID_Descriptor: RegisterValue {
}

extension SYSINFO.PLATFORM_Descriptor: RegisterValue {
}

extension SYSINFO.GITREF_RP2040_Descriptor: RegisterValue {
}
