import MMIO
import MMIOExtensions

/// Testbench manager. Allows the programmer to know what platform their software is running on.
public struct TBMAN {

    public static var `default`: Self { .init(unsafeAddress: 0x4006c000) }

    /// Indicates the type of platform in use
    public var PLATFORM: Register<PLATFORM_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct PLATFORM_Descriptor {
        @available(*, unavailable)
        /// Indicates the platform is an FPGA
        public var FPGA: FPGA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indicates the platform is an ASIC
        public var ASIC: ASIC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FPGA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum ASIC_Field: ContiguousBitField {
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
                public var FPGA: UInt32 {
                @inlinable @inline(__always) get {
                    FPGA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FPGA_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ASIC: UInt32 {
                @inlinable @inline(__always) get {
                  ASIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ASIC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = PLATFORM_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var FPGA: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FPGA_Field.self, Bool.self)
                    return Bool(storage: self.raw.FPGA)
                }
                }
              public var ASIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ASIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.ASIC)
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

extension TBMAN.PLATFORM_Descriptor: RegisterValue {
}
