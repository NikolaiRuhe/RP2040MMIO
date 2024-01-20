import MMIO
import MMIOExtensions

/// Single-cycle IO block
/// Provides core-local and inter-core hardware for the two processors, with single-cycle access.
public struct SIO {

    public static var `default`: Self { .init(unsafeAddress: 0xd0000000) }

    /// Processor core identifier
    /// Value is 0 when read from processor core 0, and 1 when read from processor core 1.
    public var CPUID: Register<CPUID_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CPUID_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CPUID_Descriptor

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

                    public  typealias Value = CPUID_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Input value for GPIO pins
    public var GPIO_IN: Register<GPIO_IN_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct GPIO_IN_Descriptor {
        @available(*, unavailable)
        /// Input value for GPIO0...29
        public var GPIO_IN: GPIO_IN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 30
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_IN_Descriptor

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
                public var GPIO_IN: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_IN_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_IN_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var GPIO_IN: BitField30 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_IN_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.GPIO_IN)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_IN_Descriptor
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

    /// Input value for QSPI pins
    public var GPIO_HI_IN: Register<GPIO_HI_IN_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct GPIO_HI_IN_Descriptor {
        @available(*, unavailable)
        /// Input value on QSPI IO in order 0..5: SCLK, SSn, SD0, SD1, SD2, SD3
        public var GPIO_HI_IN: GPIO_HI_IN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_HI_IN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_HI_IN_Descriptor

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
                public var GPIO_HI_IN: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_HI_IN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_HI_IN_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_HI_IN_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var GPIO_HI_IN: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_HI_IN_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.GPIO_HI_IN)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_HI_IN_Descriptor
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

    /// GPIO output value
    public var GPIO_OUT: Register<GPIO_OUT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct GPIO_OUT_Descriptor {
        @available(*, unavailable)
        /// Set output level (1/0 -> high/low) for GPIO0...29.
        /// Reading back gives the last value written, NOT the input value from the pins.
        /// If core 0 and core 1 both write to GPIO_OUT simultaneously (or to a SET/CLR/XOR alias),
        /// the result is as though the write from core 0 took place first,
        /// and the write from core 1 was then applied to that intermediate result.
        public var GPIO_OUT: GPIO_OUT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 30
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_OUT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var GPIO_OUT: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_OUT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_OUT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var GPIO_OUT: BitField30 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_OUT_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.GPIO_OUT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_OUT_Field.self, BitField30.self)
                    self.raw.GPIO_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// GPIO output value set
    public var GPIO_OUT_SET: Register<GPIO_OUT_SET_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct GPIO_OUT_SET_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bit-set on GPIO_OUT, i.e. `GPIO_OUT |= wdata`
        public var GPIO_OUT_SET: GPIO_OUT_SET_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_OUT_SET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 30
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_OUT_SET_Descriptor

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
                public var GPIO_OUT_SET: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_OUT_SET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_OUT_SET_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_OUT_SET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_OUT_SET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_OUT_SET: BitField30 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_OUT_SET_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.GPIO_OUT_SET)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_OUT_SET_Field.self, BitField30.self)
                    self.raw.GPIO_OUT_SET = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// GPIO output value clear
    public var GPIO_OUT_CLR: Register<GPIO_OUT_CLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct GPIO_OUT_CLR_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bit-clear on GPIO_OUT, i.e. `GPIO_OUT &= ~wdata`
        public var GPIO_OUT_CLR: GPIO_OUT_CLR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_OUT_CLR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 30
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_OUT_CLR_Descriptor

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
                public var GPIO_OUT_CLR: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_OUT_CLR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_OUT_CLR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_OUT_CLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_OUT_CLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_OUT_CLR: BitField30 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_OUT_CLR_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.GPIO_OUT_CLR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_OUT_CLR_Field.self, BitField30.self)
                    self.raw.GPIO_OUT_CLR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// GPIO output value XOR
    public var GPIO_OUT_XOR: Register<GPIO_OUT_XOR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct GPIO_OUT_XOR_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bitwise XOR on GPIO_OUT, i.e. `GPIO_OUT ^= wdata`
        public var GPIO_OUT_XOR: GPIO_OUT_XOR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_OUT_XOR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 30
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_OUT_XOR_Descriptor

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
                public var GPIO_OUT_XOR: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_OUT_XOR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_OUT_XOR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_OUT_XOR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_OUT_XOR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_OUT_XOR: BitField30 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_OUT_XOR_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.GPIO_OUT_XOR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_OUT_XOR_Field.self, BitField30.self)
                    self.raw.GPIO_OUT_XOR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// GPIO output enable
    public var GPIO_OE: Register<GPIO_OE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct GPIO_OE_Descriptor {
        @available(*, unavailable)
        /// Set output enable (1/0 -> output/input) for GPIO0...29.
        /// Reading back gives the last value written.
        /// If core 0 and core 1 both write to GPIO_OE simultaneously (or to a SET/CLR/XOR alias),
        /// the result is as though the write from core 0 took place first,
        /// and the write from core 1 was then applied to that intermediate result.
        public var GPIO_OE: GPIO_OE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_OE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 30
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_OE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var GPIO_OE: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_OE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_OE_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_OE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var GPIO_OE: BitField30 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_OE_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.GPIO_OE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_OE_Field.self, BitField30.self)
                    self.raw.GPIO_OE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// GPIO output enable set
    public var GPIO_OE_SET: Register<GPIO_OE_SET_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct GPIO_OE_SET_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bit-set on GPIO_OE, i.e. `GPIO_OE |= wdata`
        public var GPIO_OE_SET: GPIO_OE_SET_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_OE_SET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 30
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_OE_SET_Descriptor

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
                public var GPIO_OE_SET: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_OE_SET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_OE_SET_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_OE_SET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_OE_SET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_OE_SET: BitField30 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_OE_SET_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.GPIO_OE_SET)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_OE_SET_Field.self, BitField30.self)
                    self.raw.GPIO_OE_SET = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// GPIO output enable clear
    public var GPIO_OE_CLR: Register<GPIO_OE_CLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct GPIO_OE_CLR_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bit-clear on GPIO_OE, i.e. `GPIO_OE &= ~wdata`
        public var GPIO_OE_CLR: GPIO_OE_CLR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_OE_CLR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 30
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_OE_CLR_Descriptor

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
                public var GPIO_OE_CLR: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_OE_CLR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_OE_CLR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_OE_CLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_OE_CLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_OE_CLR: BitField30 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_OE_CLR_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.GPIO_OE_CLR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_OE_CLR_Field.self, BitField30.self)
                    self.raw.GPIO_OE_CLR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// GPIO output enable XOR
    public var GPIO_OE_XOR: Register<GPIO_OE_XOR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct GPIO_OE_XOR_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bitwise XOR on GPIO_OE, i.e. `GPIO_OE ^= wdata`
        public var GPIO_OE_XOR: GPIO_OE_XOR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_OE_XOR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 30
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_OE_XOR_Descriptor

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
                public var GPIO_OE_XOR: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_OE_XOR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_OE_XOR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_OE_XOR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_OE_XOR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_OE_XOR: BitField30 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_OE_XOR_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.GPIO_OE_XOR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_OE_XOR_Field.self, BitField30.self)
                    self.raw.GPIO_OE_XOR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// QSPI output value
    public var GPIO_HI_OUT: Register<GPIO_HI_OUT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct GPIO_HI_OUT_Descriptor {
        @available(*, unavailable)
        /// Set output level (1/0 -> high/low) for QSPI IO0...5.
        /// Reading back gives the last value written, NOT the input value from the pins.
        /// If core 0 and core 1 both write to GPIO_HI_OUT simultaneously (or to a SET/CLR/XOR alias),
        /// the result is as though the write from core 0 took place first,
        /// and the write from core 1 was then applied to that intermediate result.
        public var GPIO_HI_OUT: GPIO_HI_OUT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_HI_OUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_HI_OUT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var GPIO_HI_OUT: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_HI_OUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_HI_OUT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_HI_OUT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var GPIO_HI_OUT: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_HI_OUT_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.GPIO_HI_OUT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_HI_OUT_Field.self, BitField6.self)
                    self.raw.GPIO_HI_OUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// QSPI output value set
    public var GPIO_HI_OUT_SET: Register<GPIO_HI_OUT_SET_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct GPIO_HI_OUT_SET_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bit-set on GPIO_HI_OUT, i.e. `GPIO_HI_OUT |= wdata`
        public var GPIO_HI_OUT_SET: GPIO_HI_OUT_SET_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_HI_OUT_SET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_HI_OUT_SET_Descriptor

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
                public var GPIO_HI_OUT_SET: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_HI_OUT_SET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_HI_OUT_SET_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_HI_OUT_SET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_HI_OUT_SET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_HI_OUT_SET: BitField6 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_HI_OUT_SET_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.GPIO_HI_OUT_SET)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_HI_OUT_SET_Field.self, BitField6.self)
                    self.raw.GPIO_HI_OUT_SET = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// QSPI output value clear
    public var GPIO_HI_OUT_CLR: Register<GPIO_HI_OUT_CLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct GPIO_HI_OUT_CLR_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bit-clear on GPIO_HI_OUT, i.e. `GPIO_HI_OUT &= ~wdata`
        public var GPIO_HI_OUT_CLR: GPIO_HI_OUT_CLR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_HI_OUT_CLR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_HI_OUT_CLR_Descriptor

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
                public var GPIO_HI_OUT_CLR: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_HI_OUT_CLR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_HI_OUT_CLR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_HI_OUT_CLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_HI_OUT_CLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_HI_OUT_CLR: BitField6 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_HI_OUT_CLR_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.GPIO_HI_OUT_CLR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_HI_OUT_CLR_Field.self, BitField6.self)
                    self.raw.GPIO_HI_OUT_CLR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// QSPI output value XOR
    public var GPIO_HI_OUT_XOR: Register<GPIO_HI_OUT_XOR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct GPIO_HI_OUT_XOR_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bitwise XOR on GPIO_HI_OUT, i.e. `GPIO_HI_OUT ^= wdata`
        public var GPIO_HI_OUT_XOR: GPIO_HI_OUT_XOR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_HI_OUT_XOR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_HI_OUT_XOR_Descriptor

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
                public var GPIO_HI_OUT_XOR: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_HI_OUT_XOR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_HI_OUT_XOR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_HI_OUT_XOR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_HI_OUT_XOR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_HI_OUT_XOR: BitField6 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_HI_OUT_XOR_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.GPIO_HI_OUT_XOR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_HI_OUT_XOR_Field.self, BitField6.self)
                    self.raw.GPIO_HI_OUT_XOR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// QSPI output enable
    public var GPIO_HI_OE: Register<GPIO_HI_OE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct GPIO_HI_OE_Descriptor {
        @available(*, unavailable)
        /// Set output enable (1/0 -> output/input) for QSPI IO0...5.
        /// Reading back gives the last value written.
        /// If core 0 and core 1 both write to GPIO_HI_OE simultaneously (or to a SET/CLR/XOR alias),
        /// the result is as though the write from core 0 took place first,
        /// and the write from core 1 was then applied to that intermediate result.
        public var GPIO_HI_OE: GPIO_HI_OE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_HI_OE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_HI_OE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var GPIO_HI_OE: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_HI_OE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_HI_OE_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = GPIO_HI_OE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var GPIO_HI_OE: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_HI_OE_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.GPIO_HI_OE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_HI_OE_Field.self, BitField6.self)
                    self.raw.GPIO_HI_OE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// QSPI output enable set
    public var GPIO_HI_OE_SET: Register<GPIO_HI_OE_SET_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct GPIO_HI_OE_SET_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bit-set on GPIO_HI_OE, i.e. `GPIO_HI_OE |= wdata`
        public var GPIO_HI_OE_SET: GPIO_HI_OE_SET_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_HI_OE_SET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_HI_OE_SET_Descriptor

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
                public var GPIO_HI_OE_SET: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_HI_OE_SET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_HI_OE_SET_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_HI_OE_SET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_HI_OE_SET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_HI_OE_SET: BitField6 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_HI_OE_SET_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.GPIO_HI_OE_SET)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_HI_OE_SET_Field.self, BitField6.self)
                    self.raw.GPIO_HI_OE_SET = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// QSPI output enable clear
    public var GPIO_HI_OE_CLR: Register<GPIO_HI_OE_CLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct GPIO_HI_OE_CLR_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bit-clear on GPIO_HI_OE, i.e. `GPIO_HI_OE &= ~wdata`
        public var GPIO_HI_OE_CLR: GPIO_HI_OE_CLR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_HI_OE_CLR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_HI_OE_CLR_Descriptor

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
                public var GPIO_HI_OE_CLR: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_HI_OE_CLR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_HI_OE_CLR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_HI_OE_CLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_HI_OE_CLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_HI_OE_CLR: BitField6 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_HI_OE_CLR_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.GPIO_HI_OE_CLR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_HI_OE_CLR_Field.self, BitField6.self)
                    self.raw.GPIO_HI_OE_CLR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// QSPI output enable XOR
    public var GPIO_HI_OE_XOR: Register<GPIO_HI_OE_XOR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x004c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x004c))
          #endif
        }
    }
    public struct GPIO_HI_OE_XOR_Descriptor {
        @available(*, unavailable)
        /// Perform an atomic bitwise XOR on GPIO_HI_OE, i.e. `GPIO_HI_OE ^= wdata`
        public var GPIO_HI_OE_XOR: GPIO_HI_OE_XOR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum GPIO_HI_OE_XOR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = GPIO_HI_OE_XOR_Descriptor

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
                public var GPIO_HI_OE_XOR: UInt32 {
                @inlinable @inline(__always) get {
                    GPIO_HI_OE_XOR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    GPIO_HI_OE_XOR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = GPIO_HI_OE_XOR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = GPIO_HI_OE_XOR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var GPIO_HI_OE_XOR: BitField6 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(GPIO_HI_OE_XOR_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.GPIO_HI_OE_XOR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(GPIO_HI_OE_XOR_Field.self, BitField6.self)
                    self.raw.GPIO_HI_OE_XOR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Status register for inter-core FIFOs (mailboxes).
    /// There is one FIFO in the core 0 -> core 1 direction, and one core 1 -> core 0. Both are 32 bits wide and 8 words deep.
    /// Core 0 can see the read side of the 1->0 FIFO (RX), and the write side of 0->1 FIFO (TX).
    /// Core 1 can see the read side of the 0->1 FIFO (RX), and the write side of 1->0 FIFO (TX).
    /// The SIO IRQ for each core is the logical OR of the VLD, WOF and ROE fields of its FIFO_ST register.
    public var FIFO_ST: Register<FIFO_ST_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct FIFO_ST_Descriptor {
        @available(*, unavailable)
        /// Sticky flag indicating the RX FIFO was read when empty. This read was ignored by the FIFO.
        public var ROE: ROE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Sticky flag indicating the TX FIFO was written when full. This write was ignored by the FIFO.
        public var WOF: WOF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Value is 1 if this core's TX FIFO is not full (i.e. if FIFO_WR is ready for more data)
        public var RDY: RDY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Value is 1 if this core's RX FIFO is not empty (i.e. if FIFO_RD is valid)
        public var VLD: VLD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ROE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum WOF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum RDY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum VLD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FIFO_ST_Descriptor

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
                public var ROE: UInt32 {
                @inlinable @inline(__always) get {
                    ROE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ROE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var WOF: UInt32 {
                @inlinable @inline(__always) get {
                  WOF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WOF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RDY: UInt32 {
                @inlinable @inline(__always) get {
                  RDY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RDY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var VLD: UInt32 {
                @inlinable @inline(__always) get {
                  VLD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VLD_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = FIFO_ST_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var ROE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ROE_Field.self, Bool.self)
                    return Bool(storage: self.raw.ROE)
                }
                }
              public var WOF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WOF_Field.self, Bool.self)
                  return Bool(storage: self.raw.WOF)
                }
              }
              public var RDY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RDY_Field.self, Bool.self)
                  return Bool(storage: self.raw.RDY)
                }
              }
              public var VLD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VLD_Field.self, Bool.self)
                  return Bool(storage: self.raw.VLD)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = FIFO_ST_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var ROE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ROE_Field.self, Bool.self)
                    return Bool(storage: self.raw.ROE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ROE_Field.self, Bool.self)
                    self.raw.ROE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WOF: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WOF_Field.self, Bool.self)
                  return Bool(storage: self.raw.WOF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WOF_Field.self, Bool.self)
                  self.raw.WOF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Write access to this core's TX FIFO
    public var FIFO_WR: Register<FIFO_WR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct FIFO_WR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FIFO_WR_Descriptor

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

                    public  typealias Value = FIFO_WR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read access to this core's RX FIFO
    public var FIFO_RD: Register<FIFO_RD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0058), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0058))
          #endif
        }
    }
    public struct FIFO_RD_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FIFO_RD_Descriptor

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

                    public  typealias Value = FIFO_RD_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Spinlock state
    /// A bitmap containing the state of all 32 spinlocks (1=locked).
    /// Mainly intended for debugging.
    public var SPINLOCK_ST: Register<SPINLOCK_ST_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x005c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x005c))
          #endif
        }
    }
    public struct SPINLOCK_ST_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK_ST_Descriptor

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

                    public  typealias Value = SPINLOCK_ST_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Divider unsigned dividend
    /// Write to the DIVIDEND operand of the divider, i.e. the p in `p / q`.
    /// Any operand write starts a new calculation. The results appear in QUOTIENT, REMAINDER.
    /// UDIVIDEND/SDIVIDEND are aliases of the same internal register. The U alias starts an
    /// unsigned calculation, and the S alias starts a signed calculation.
    public var DIV_UDIVIDEND: Register<DIV_UDIVIDEND_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0060), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0060))
          #endif
        }
    }
    public struct DIV_UDIVIDEND_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DIV_UDIVIDEND_Descriptor

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

                    public  typealias Value = DIV_UDIVIDEND_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Divider unsigned divisor
    /// Write to the DIVISOR operand of the divider, i.e. the q in `p / q`.
    /// Any operand write starts a new calculation. The results appear in QUOTIENT, REMAINDER.
    /// UDIVISOR/SDIVISOR are aliases of the same internal register. The U alias starts an
    /// unsigned calculation, and the S alias starts a signed calculation.
    public var DIV_UDIVISOR: Register<DIV_UDIVISOR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0064), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0064))
          #endif
        }
    }
    public struct DIV_UDIVISOR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DIV_UDIVISOR_Descriptor

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

                    public  typealias Value = DIV_UDIVISOR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Divider signed dividend
    /// The same as UDIVIDEND, but starts a signed calculation, rather than unsigned.
    public var DIV_SDIVIDEND: Register<DIV_SDIVIDEND_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0068), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0068))
          #endif
        }
    }
    public struct DIV_SDIVIDEND_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DIV_SDIVIDEND_Descriptor

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

                    public  typealias Value = DIV_SDIVIDEND_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Divider signed divisor
    /// The same as UDIVISOR, but starts a signed calculation, rather than unsigned.
    public var DIV_SDIVISOR: Register<DIV_SDIVISOR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x006c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x006c))
          #endif
        }
    }
    public struct DIV_SDIVISOR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DIV_SDIVISOR_Descriptor

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

                    public  typealias Value = DIV_SDIVISOR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Divider result quotient
    /// The result of `DIVIDEND / DIVISOR` (division). Contents undefined while CSR_READY is low.
    /// For signed calculations, QUOTIENT is negative when the signs of DIVIDEND and DIVISOR differ.
    /// This register can be written to directly, for context save/restore purposes. This halts any
    /// in-progress calculation and sets the CSR_READY and CSR_DIRTY flags.
    /// Reading from QUOTIENT clears the CSR_DIRTY flag, so should read results in the order
    /// REMAINDER, QUOTIENT if CSR_DIRTY is used.
    public var DIV_QUOTIENT: Register<DIV_QUOTIENT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0070), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0070))
          #endif
        }
    }
    public struct DIV_QUOTIENT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DIV_QUOTIENT_Descriptor

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

                    public  typealias Value = DIV_QUOTIENT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Divider result remainder
    /// The result of `DIVIDEND % DIVISOR` (modulo). Contents undefined while CSR_READY is low.
    /// For signed calculations, REMAINDER is negative only when DIVIDEND is negative.
    /// This register can be written to directly, for context save/restore purposes. This halts any
    /// in-progress calculation and sets the CSR_READY and CSR_DIRTY flags.
    public var DIV_REMAINDER: Register<DIV_REMAINDER_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0074), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0074))
          #endif
        }
    }
    public struct DIV_REMAINDER_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DIV_REMAINDER_Descriptor

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

                    public  typealias Value = DIV_REMAINDER_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Control and status register for divider.
    public var DIV_CSR: Register<DIV_CSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0078), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0078))
          #endif
        }
    }
    public struct DIV_CSR_Descriptor {
        @available(*, unavailable)
        /// Changes to 1 when any register is written, and back to 0 when QUOTIENT is read.
        /// Software can use this flag to make save/restore more efficient (skip if not DIRTY).
        /// If the flag is used in this way, it's recommended to either read QUOTIENT only,
        /// or REMAINDER and then QUOTIENT, to prevent data loss on context switch.
        public var DIRTY: DIRTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reads as 0 when a calculation is in progress, 1 otherwise.
        /// Writing an operand (xDIVIDEND, xDIVISOR) will immediately start a new calculation, no
        /// matter if one is already in progress.
        /// Writing to a result register will immediately terminate any in-progress calculation
        /// and set the READY and DIRTY flags.
        public var READY: READY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DIRTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum READY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DIV_CSR_Descriptor

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
                public var DIRTY: UInt32 {
                @inlinable @inline(__always) get {
                    DIRTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DIRTY_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READY: UInt32 {
                @inlinable @inline(__always) get {
                  READY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = DIV_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var DIRTY: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DIRTY_Field.self, Bool.self)
                    return Bool(storage: self.raw.DIRTY)
                }
                }
              public var READY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READY_Field.self, Bool.self)
                  return Bool(storage: self.raw.READY)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = DIV_CSR_Descriptor
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

    /// Read/write access to accumulator 0
    public var INTERP0_ACCUM0: Register<INTERP0_ACCUM0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0080), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0080))
          #endif
        }
    }
    public struct INTERP0_ACCUM0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_ACCUM0_Descriptor

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

                    public  typealias Value = INTERP0_ACCUM0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read/write access to accumulator 1
    public var INTERP0_ACCUM1: Register<INTERP0_ACCUM1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0084), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0084))
          #endif
        }
    }
    public struct INTERP0_ACCUM1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_ACCUM1_Descriptor

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

                    public  typealias Value = INTERP0_ACCUM1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read/write access to BASE0 register.
    public var INTERP0_BASE0: Register<INTERP0_BASE0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0088), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0088))
          #endif
        }
    }
    public struct INTERP0_BASE0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_BASE0_Descriptor

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

                    public  typealias Value = INTERP0_BASE0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read/write access to BASE1 register.
    public var INTERP0_BASE1: Register<INTERP0_BASE1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x008c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x008c))
          #endif
        }
    }
    public struct INTERP0_BASE1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_BASE1_Descriptor

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

                    public  typealias Value = INTERP0_BASE1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read/write access to BASE2 register.
    public var INTERP0_BASE2: Register<INTERP0_BASE2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0090), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0090))
          #endif
        }
    }
    public struct INTERP0_BASE2_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_BASE2_Descriptor

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

                    public  typealias Value = INTERP0_BASE2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read LANE0 result, and simultaneously write lane results to both accumulators (POP).
    public var INTERP0_POP_LANE0: Register<INTERP0_POP_LANE0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0094), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0094))
          #endif
        }
    }
    public struct INTERP0_POP_LANE0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_POP_LANE0_Descriptor

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

                    public  typealias Value = INTERP0_POP_LANE0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read LANE1 result, and simultaneously write lane results to both accumulators (POP).
    public var INTERP0_POP_LANE1: Register<INTERP0_POP_LANE1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0098), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0098))
          #endif
        }
    }
    public struct INTERP0_POP_LANE1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_POP_LANE1_Descriptor

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

                    public  typealias Value = INTERP0_POP_LANE1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read FULL result, and simultaneously write lane results to both accumulators (POP).
    public var INTERP0_POP_FULL: Register<INTERP0_POP_FULL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x009c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x009c))
          #endif
        }
    }
    public struct INTERP0_POP_FULL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_POP_FULL_Descriptor

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

                    public  typealias Value = INTERP0_POP_FULL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read LANE0 result, without altering any internal state (PEEK).
    public var INTERP0_PEEK_LANE0: Register<INTERP0_PEEK_LANE0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0))
          #endif
        }
    }
    public struct INTERP0_PEEK_LANE0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_PEEK_LANE0_Descriptor

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

                    public  typealias Value = INTERP0_PEEK_LANE0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read LANE1 result, without altering any internal state (PEEK).
    public var INTERP0_PEEK_LANE1: Register<INTERP0_PEEK_LANE1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4))
          #endif
        }
    }
    public struct INTERP0_PEEK_LANE1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_PEEK_LANE1_Descriptor

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

                    public  typealias Value = INTERP0_PEEK_LANE1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read FULL result, without altering any internal state (PEEK).
    public var INTERP0_PEEK_FULL: Register<INTERP0_PEEK_FULL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8))
          #endif
        }
    }
    public struct INTERP0_PEEK_FULL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_PEEK_FULL_Descriptor

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

                    public  typealias Value = INTERP0_PEEK_FULL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Control register for lane 0
    public var INTERP0_CTRL_LANE0: Register<INTERP0_CTRL_LANE0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac))
          #endif
        }
    }
    public struct INTERP0_CTRL_LANE0_Descriptor {
        @available(*, unavailable)
        /// Set if either OVERF0 or OVERF1 is set.
        public var OVERF: OVERF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indicates if any masked-off MSBs in ACCUM1 are set.
        public var OVERF1: OVERF1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indicates if any masked-off MSBs in ACCUM0 are set.
        public var OVERF0: OVERF0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Only present on INTERP0 on each core. If BLEND mode is enabled:
        /// - LANE1 result is a linear interpolation between BASE0 and BASE1, controlled
        /// by the 8 LSBs of lane 1 shift and mask value (a fractional number between
        /// 0 and 255/256ths)
        /// - LANE0 result does not have BASE0 added (yields only the 8 LSBs of lane 1 shift+mask value)
        /// - FULL result does not have lane 1 shift+mask value added (BASE2 + lane 0 shift+mask)
        /// LANE1 SIGNED flag controls whether the interpolation is signed or unsigned.
        public var BLEND: BLEND_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// ORed into bits 29:28 of the lane result presented to the processor on the bus.
        /// No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence
        /// of pointers into flash or SRAM.
        public var FORCE_MSB: FORCE_MSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, mask + shift is bypassed for LANE0 result. This does not affect FULL result.
        public var ADD_RAW: ADD_RAW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        public var CROSS_RESULT: CROSS_RESULT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware.
        /// Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        public var CROSS_INPUT: CROSS_INPUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits
        /// before adding to BASE0, and LANE0 PEEK/POP appear extended to 32 bits when read by processor.
        public var SIGNED: SIGNED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The most-significant bit allowed to pass by the mask (inclusive)
        /// Setting MSB < LSB may cause chip to turn inside-out
        public var MASK_MSB: MASK_MSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The least-significant bit allowed to pass by the mask (inclusive)
        public var MASK_LSB: MASK_LSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Logical right-shift applied to accumulator before masking
        public var SHIFT: SHIFT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OVERF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum OVERF1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum OVERF0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BLEND_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum FORCE_MSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 21
        }

        public enum ADD_RAW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum CROSS_RESULT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum CROSS_INPUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum SIGNED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum MASK_MSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 15
        }

        public enum MASK_LSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 10
        }

        public enum SHIFT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_CTRL_LANE0_Descriptor

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
                public var OVERF: UInt32 {
                @inlinable @inline(__always) get {
                    OVERF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OVERF_Field.insert(newValue, into: &self.storage)
                }
                }
              public var OVERF1: UInt32 {
                @inlinable @inline(__always) get {
                  OVERF1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OVERF1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OVERF0: UInt32 {
                @inlinable @inline(__always) get {
                  OVERF0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OVERF0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BLEND: UInt32 {
                @inlinable @inline(__always) get {
                  BLEND_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BLEND_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FORCE_MSB: UInt32 {
                @inlinable @inline(__always) get {
                  FORCE_MSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FORCE_MSB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADD_RAW: UInt32 {
                @inlinable @inline(__always) get {
                  ADD_RAW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADD_RAW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CROSS_RESULT: UInt32 {
                @inlinable @inline(__always) get {
                  CROSS_RESULT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CROSS_RESULT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CROSS_INPUT: UInt32 {
                @inlinable @inline(__always) get {
                  CROSS_INPUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CROSS_INPUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIGNED: UInt32 {
                @inlinable @inline(__always) get {
                  SIGNED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIGNED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MASK_MSB: UInt32 {
                @inlinable @inline(__always) get {
                  MASK_MSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MASK_MSB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MASK_LSB: UInt32 {
                @inlinable @inline(__always) get {
                  MASK_LSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MASK_LSB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SHIFT: UInt32 {
                @inlinable @inline(__always) get {
                  SHIFT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SHIFT_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTERP0_CTRL_LANE0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var OVERF: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OVERF_Field.self, Bool.self)
                    return Bool(storage: self.raw.OVERF)
                }
                }
              public var OVERF1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OVERF1_Field.self, Bool.self)
                  return Bool(storage: self.raw.OVERF1)
                }
              }
              public var OVERF0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OVERF0_Field.self, Bool.self)
                  return Bool(storage: self.raw.OVERF0)
                }
              }
              public var BLEND: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BLEND_Field.self, Bool.self)
                  return Bool(storage: self.raw.BLEND)
                }
              }
              public var FORCE_MSB: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FORCE_MSB_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.FORCE_MSB)
                }
              }
              public var ADD_RAW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADD_RAW_Field.self, Bool.self)
                  return Bool(storage: self.raw.ADD_RAW)
                }
              }
              public var CROSS_RESULT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_RESULT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_RESULT)
                }
              }
              public var CROSS_INPUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_INPUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_INPUT)
                }
              }
              public var SIGNED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIGNED_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIGNED)
                }
              }
              public var MASK_MSB: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_MSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_MSB)
                }
              }
              public var MASK_LSB: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_LSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_LSB)
                }
              }
              public var SHIFT: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SHIFT)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INTERP0_CTRL_LANE0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var BLEND: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(BLEND_Field.self, Bool.self)
                    return Bool(storage: self.raw.BLEND)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(BLEND_Field.self, Bool.self)
                    self.raw.BLEND = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FORCE_MSB: BitField2 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FORCE_MSB_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.FORCE_MSB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FORCE_MSB_Field.self, BitField2.self)
                  self.raw.FORCE_MSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADD_RAW: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADD_RAW_Field.self, Bool.self)
                  return Bool(storage: self.raw.ADD_RAW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADD_RAW_Field.self, Bool.self)
                  self.raw.ADD_RAW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CROSS_RESULT: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_RESULT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_RESULT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CROSS_RESULT_Field.self, Bool.self)
                  self.raw.CROSS_RESULT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CROSS_INPUT: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_INPUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_INPUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CROSS_INPUT_Field.self, Bool.self)
                  self.raw.CROSS_INPUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIGNED: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIGNED_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIGNED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIGNED_Field.self, Bool.self)
                  self.raw.SIGNED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MASK_MSB: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_MSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_MSB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MASK_MSB_Field.self, BitField5.self)
                  self.raw.MASK_MSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MASK_LSB: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_LSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_LSB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MASK_LSB_Field.self, BitField5.self)
                  self.raw.MASK_LSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SHIFT: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SHIFT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField5.self)
                  self.raw.SHIFT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Control register for lane 1
    public var INTERP0_CTRL_LANE1: Register<INTERP0_CTRL_LANE1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0))
          #endif
        }
    }
    public struct INTERP0_CTRL_LANE1_Descriptor {
        @available(*, unavailable)
        /// ORed into bits 29:28 of the lane result presented to the processor on the bus.
        /// No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence
        /// of pointers into flash or SRAM.
        public var FORCE_MSB: FORCE_MSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, mask + shift is bypassed for LANE1 result. This does not affect FULL result.
        public var ADD_RAW: ADD_RAW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        public var CROSS_RESULT: CROSS_RESULT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware.
        /// Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        public var CROSS_INPUT: CROSS_INPUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits
        /// before adding to BASE1, and LANE1 PEEK/POP appear extended to 32 bits when read by processor.
        public var SIGNED: SIGNED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The most-significant bit allowed to pass by the mask (inclusive)
        /// Setting MSB < LSB may cause chip to turn inside-out
        public var MASK_MSB: MASK_MSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The least-significant bit allowed to pass by the mask (inclusive)
        public var MASK_LSB: MASK_LSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Logical right-shift applied to accumulator before masking
        public var SHIFT: SHIFT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FORCE_MSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 21
        }

        public enum ADD_RAW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum CROSS_RESULT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum CROSS_INPUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum SIGNED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum MASK_MSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 15
        }

        public enum MASK_LSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 10
        }

        public enum SHIFT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_CTRL_LANE1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FORCE_MSB: UInt32 {
                @inlinable @inline(__always) get {
                    FORCE_MSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FORCE_MSB_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ADD_RAW: UInt32 {
                @inlinable @inline(__always) get {
                  ADD_RAW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADD_RAW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CROSS_RESULT: UInt32 {
                @inlinable @inline(__always) get {
                  CROSS_RESULT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CROSS_RESULT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CROSS_INPUT: UInt32 {
                @inlinable @inline(__always) get {
                  CROSS_INPUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CROSS_INPUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIGNED: UInt32 {
                @inlinable @inline(__always) get {
                  SIGNED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIGNED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MASK_MSB: UInt32 {
                @inlinable @inline(__always) get {
                  MASK_MSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MASK_MSB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MASK_LSB: UInt32 {
                @inlinable @inline(__always) get {
                  MASK_LSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MASK_LSB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SHIFT: UInt32 {
                @inlinable @inline(__always) get {
                  SHIFT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SHIFT_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTERP0_CTRL_LANE1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FORCE_MSB: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FORCE_MSB_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.FORCE_MSB)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FORCE_MSB_Field.self, BitField2.self)
                    self.raw.FORCE_MSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ADD_RAW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADD_RAW_Field.self, Bool.self)
                  return Bool(storage: self.raw.ADD_RAW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADD_RAW_Field.self, Bool.self)
                  self.raw.ADD_RAW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CROSS_RESULT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_RESULT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_RESULT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CROSS_RESULT_Field.self, Bool.self)
                  self.raw.CROSS_RESULT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CROSS_INPUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_INPUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_INPUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CROSS_INPUT_Field.self, Bool.self)
                  self.raw.CROSS_INPUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIGNED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIGNED_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIGNED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIGNED_Field.self, Bool.self)
                  self.raw.SIGNED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MASK_MSB: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_MSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_MSB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MASK_MSB_Field.self, BitField5.self)
                  self.raw.MASK_MSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MASK_LSB: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_LSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_LSB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MASK_LSB_Field.self, BitField5.self)
                  self.raw.MASK_LSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SHIFT: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SHIFT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField5.self)
                  self.raw.SHIFT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Values written here are atomically added to ACCUM0
    /// Reading yields lane 0's raw shift and mask value (BASE0 not added).
    public var INTERP0_ACCUM0_ADD: Register<INTERP0_ACCUM0_ADD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b4))
          #endif
        }
    }
    public struct INTERP0_ACCUM0_ADD_Descriptor {
        @available(*, unavailable)
        public var INTERP0_ACCUM0_ADD: INTERP0_ACCUM0_ADD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTERP0_ACCUM0_ADD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_ACCUM0_ADD_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTERP0_ACCUM0_ADD: UInt32 {
                @inlinable @inline(__always) get {
                    INTERP0_ACCUM0_ADD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTERP0_ACCUM0_ADD_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTERP0_ACCUM0_ADD_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTERP0_ACCUM0_ADD: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTERP0_ACCUM0_ADD_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.INTERP0_ACCUM0_ADD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTERP0_ACCUM0_ADD_Field.self, BitField24.self)
                    self.raw.INTERP0_ACCUM0_ADD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Values written here are atomically added to ACCUM1
    /// Reading yields lane 1's raw shift and mask value (BASE1 not added).
    public var INTERP0_ACCUM1_ADD: Register<INTERP0_ACCUM1_ADD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b8))
          #endif
        }
    }
    public struct INTERP0_ACCUM1_ADD_Descriptor {
        @available(*, unavailable)
        public var INTERP0_ACCUM1_ADD: INTERP0_ACCUM1_ADD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTERP0_ACCUM1_ADD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_ACCUM1_ADD_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTERP0_ACCUM1_ADD: UInt32 {
                @inlinable @inline(__always) get {
                    INTERP0_ACCUM1_ADD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTERP0_ACCUM1_ADD_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTERP0_ACCUM1_ADD_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTERP0_ACCUM1_ADD: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTERP0_ACCUM1_ADD_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.INTERP0_ACCUM1_ADD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTERP0_ACCUM1_ADD_Field.self, BitField24.self)
                    self.raw.INTERP0_ACCUM1_ADD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// On write, the lower 16 bits go to BASE0, upper bits to BASE1 simultaneously.
    /// Each half is sign-extended to 32 bits if that lane's SIGNED flag is set.
    public var INTERP0_BASE_1AND0: Register<INTERP0_BASE_1AND0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00bc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00bc))
          #endif
        }
    }
    public struct INTERP0_BASE_1AND0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP0_BASE_1AND0_Descriptor

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

                    public  typealias Value = INTERP0_BASE_1AND0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read/write access to accumulator 0
    public var INTERP1_ACCUM0: Register<INTERP1_ACCUM0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c0))
          #endif
        }
    }
    public struct INTERP1_ACCUM0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_ACCUM0_Descriptor

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

                    public  typealias Value = INTERP1_ACCUM0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read/write access to accumulator 1
    public var INTERP1_ACCUM1: Register<INTERP1_ACCUM1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c4))
          #endif
        }
    }
    public struct INTERP1_ACCUM1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_ACCUM1_Descriptor

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

                    public  typealias Value = INTERP1_ACCUM1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read/write access to BASE0 register.
    public var INTERP1_BASE0: Register<INTERP1_BASE0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c8))
          #endif
        }
    }
    public struct INTERP1_BASE0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_BASE0_Descriptor

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

                    public  typealias Value = INTERP1_BASE0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read/write access to BASE1 register.
    public var INTERP1_BASE1: Register<INTERP1_BASE1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00cc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00cc))
          #endif
        }
    }
    public struct INTERP1_BASE1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_BASE1_Descriptor

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

                    public  typealias Value = INTERP1_BASE1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read/write access to BASE2 register.
    public var INTERP1_BASE2: Register<INTERP1_BASE2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d0))
          #endif
        }
    }
    public struct INTERP1_BASE2_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_BASE2_Descriptor

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

                    public  typealias Value = INTERP1_BASE2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read LANE0 result, and simultaneously write lane results to both accumulators (POP).
    public var INTERP1_POP_LANE0: Register<INTERP1_POP_LANE0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d4))
          #endif
        }
    }
    public struct INTERP1_POP_LANE0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_POP_LANE0_Descriptor

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

                    public  typealias Value = INTERP1_POP_LANE0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read LANE1 result, and simultaneously write lane results to both accumulators (POP).
    public var INTERP1_POP_LANE1: Register<INTERP1_POP_LANE1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d8))
          #endif
        }
    }
    public struct INTERP1_POP_LANE1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_POP_LANE1_Descriptor

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

                    public  typealias Value = INTERP1_POP_LANE1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read FULL result, and simultaneously write lane results to both accumulators (POP).
    public var INTERP1_POP_FULL: Register<INTERP1_POP_FULL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00dc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00dc))
          #endif
        }
    }
    public struct INTERP1_POP_FULL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_POP_FULL_Descriptor

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

                    public  typealias Value = INTERP1_POP_FULL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read LANE0 result, without altering any internal state (PEEK).
    public var INTERP1_PEEK_LANE0: Register<INTERP1_PEEK_LANE0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e0))
          #endif
        }
    }
    public struct INTERP1_PEEK_LANE0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_PEEK_LANE0_Descriptor

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

                    public  typealias Value = INTERP1_PEEK_LANE0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read LANE1 result, without altering any internal state (PEEK).
    public var INTERP1_PEEK_LANE1: Register<INTERP1_PEEK_LANE1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e4))
          #endif
        }
    }
    public struct INTERP1_PEEK_LANE1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_PEEK_LANE1_Descriptor

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

                    public  typealias Value = INTERP1_PEEK_LANE1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read FULL result, without altering any internal state (PEEK).
    public var INTERP1_PEEK_FULL: Register<INTERP1_PEEK_FULL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e8))
          #endif
        }
    }
    public struct INTERP1_PEEK_FULL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_PEEK_FULL_Descriptor

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

                    public  typealias Value = INTERP1_PEEK_FULL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Control register for lane 0
    public var INTERP1_CTRL_LANE0: Register<INTERP1_CTRL_LANE0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00ec), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00ec))
          #endif
        }
    }
    public struct INTERP1_CTRL_LANE0_Descriptor {
        @available(*, unavailable)
        /// Set if either OVERF0 or OVERF1 is set.
        public var OVERF: OVERF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indicates if any masked-off MSBs in ACCUM1 are set.
        public var OVERF1: OVERF1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Indicates if any masked-off MSBs in ACCUM0 are set.
        public var OVERF0: OVERF0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Only present on INTERP1 on each core. If CLAMP mode is enabled:
        /// - LANE0 result is shifted and masked ACCUM0, clamped by a lower bound of
        /// BASE0 and an upper bound of BASE1.
        /// - Signedness of these comparisons is determined by LANE0_CTRL_SIGNED
        public var CLAMP: CLAMP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// ORed into bits 29:28 of the lane result presented to the processor on the bus.
        /// No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence
        /// of pointers into flash or SRAM.
        public var FORCE_MSB: FORCE_MSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, mask + shift is bypassed for LANE0 result. This does not affect FULL result.
        public var ADD_RAW: ADD_RAW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        public var CROSS_RESULT: CROSS_RESULT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware.
        /// Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        public var CROSS_INPUT: CROSS_INPUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits
        /// before adding to BASE0, and LANE0 PEEK/POP appear extended to 32 bits when read by processor.
        public var SIGNED: SIGNED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The most-significant bit allowed to pass by the mask (inclusive)
        /// Setting MSB < LSB may cause chip to turn inside-out
        public var MASK_MSB: MASK_MSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The least-significant bit allowed to pass by the mask (inclusive)
        public var MASK_LSB: MASK_LSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Logical right-shift applied to accumulator before masking
        public var SHIFT: SHIFT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OVERF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 26
        }

        public enum OVERF1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum OVERF0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum CLAMP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum FORCE_MSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 21
        }

        public enum ADD_RAW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum CROSS_RESULT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum CROSS_INPUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum SIGNED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum MASK_MSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 15
        }

        public enum MASK_LSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 10
        }

        public enum SHIFT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_CTRL_LANE0_Descriptor

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
                public var OVERF: UInt32 {
                @inlinable @inline(__always) get {
                    OVERF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OVERF_Field.insert(newValue, into: &self.storage)
                }
                }
              public var OVERF1: UInt32 {
                @inlinable @inline(__always) get {
                  OVERF1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OVERF1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OVERF0: UInt32 {
                @inlinable @inline(__always) get {
                  OVERF0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OVERF0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CLAMP: UInt32 {
                @inlinable @inline(__always) get {
                  CLAMP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CLAMP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FORCE_MSB: UInt32 {
                @inlinable @inline(__always) get {
                  FORCE_MSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FORCE_MSB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADD_RAW: UInt32 {
                @inlinable @inline(__always) get {
                  ADD_RAW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADD_RAW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CROSS_RESULT: UInt32 {
                @inlinable @inline(__always) get {
                  CROSS_RESULT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CROSS_RESULT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CROSS_INPUT: UInt32 {
                @inlinable @inline(__always) get {
                  CROSS_INPUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CROSS_INPUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIGNED: UInt32 {
                @inlinable @inline(__always) get {
                  SIGNED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIGNED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MASK_MSB: UInt32 {
                @inlinable @inline(__always) get {
                  MASK_MSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MASK_MSB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MASK_LSB: UInt32 {
                @inlinable @inline(__always) get {
                  MASK_LSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MASK_LSB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SHIFT: UInt32 {
                @inlinable @inline(__always) get {
                  SHIFT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SHIFT_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTERP1_CTRL_LANE0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var OVERF: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OVERF_Field.self, Bool.self)
                    return Bool(storage: self.raw.OVERF)
                }
                }
              public var OVERF1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OVERF1_Field.self, Bool.self)
                  return Bool(storage: self.raw.OVERF1)
                }
              }
              public var OVERF0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OVERF0_Field.self, Bool.self)
                  return Bool(storage: self.raw.OVERF0)
                }
              }
              public var CLAMP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CLAMP_Field.self, Bool.self)
                  return Bool(storage: self.raw.CLAMP)
                }
              }
              public var FORCE_MSB: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FORCE_MSB_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.FORCE_MSB)
                }
              }
              public var ADD_RAW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADD_RAW_Field.self, Bool.self)
                  return Bool(storage: self.raw.ADD_RAW)
                }
              }
              public var CROSS_RESULT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_RESULT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_RESULT)
                }
              }
              public var CROSS_INPUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_INPUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_INPUT)
                }
              }
              public var SIGNED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIGNED_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIGNED)
                }
              }
              public var MASK_MSB: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_MSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_MSB)
                }
              }
              public var MASK_LSB: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_LSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_LSB)
                }
              }
              public var SHIFT: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SHIFT)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INTERP1_CTRL_LANE0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var CLAMP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLAMP_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLAMP)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CLAMP_Field.self, Bool.self)
                    self.raw.CLAMP = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FORCE_MSB: BitField2 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FORCE_MSB_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.FORCE_MSB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FORCE_MSB_Field.self, BitField2.self)
                  self.raw.FORCE_MSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADD_RAW: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADD_RAW_Field.self, Bool.self)
                  return Bool(storage: self.raw.ADD_RAW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADD_RAW_Field.self, Bool.self)
                  self.raw.ADD_RAW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CROSS_RESULT: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_RESULT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_RESULT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CROSS_RESULT_Field.self, Bool.self)
                  self.raw.CROSS_RESULT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CROSS_INPUT: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_INPUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_INPUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CROSS_INPUT_Field.self, Bool.self)
                  self.raw.CROSS_INPUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIGNED: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIGNED_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIGNED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIGNED_Field.self, Bool.self)
                  self.raw.SIGNED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MASK_MSB: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_MSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_MSB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MASK_MSB_Field.self, BitField5.self)
                  self.raw.MASK_MSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MASK_LSB: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_LSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_LSB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MASK_LSB_Field.self, BitField5.self)
                  self.raw.MASK_LSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SHIFT: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SHIFT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField5.self)
                  self.raw.SHIFT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Control register for lane 1
    public var INTERP1_CTRL_LANE1: Register<INTERP1_CTRL_LANE1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f0))
          #endif
        }
    }
    public struct INTERP1_CTRL_LANE1_Descriptor {
        @available(*, unavailable)
        /// ORed into bits 29:28 of the lane result presented to the processor on the bus.
        /// No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence
        /// of pointers into flash or SRAM.
        public var FORCE_MSB: FORCE_MSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, mask + shift is bypassed for LANE1 result. This does not affect FULL result.
        public var ADD_RAW: ADD_RAW_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        public var CROSS_RESULT: CROSS_RESULT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware.
        /// Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        public var CROSS_INPUT: CROSS_INPUT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits
        /// before adding to BASE1, and LANE1 PEEK/POP appear extended to 32 bits when read by processor.
        public var SIGNED: SIGNED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The most-significant bit allowed to pass by the mask (inclusive)
        /// Setting MSB < LSB may cause chip to turn inside-out
        public var MASK_MSB: MASK_MSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The least-significant bit allowed to pass by the mask (inclusive)
        public var MASK_LSB: MASK_LSB_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Logical right-shift applied to accumulator before masking
        public var SHIFT: SHIFT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FORCE_MSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 21
        }

        public enum ADD_RAW_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum CROSS_RESULT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum CROSS_INPUT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum SIGNED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum MASK_MSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 15
        }

        public enum MASK_LSB_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 10
        }

        public enum SHIFT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_CTRL_LANE1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FORCE_MSB: UInt32 {
                @inlinable @inline(__always) get {
                    FORCE_MSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FORCE_MSB_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ADD_RAW: UInt32 {
                @inlinable @inline(__always) get {
                  ADD_RAW_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADD_RAW_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CROSS_RESULT: UInt32 {
                @inlinable @inline(__always) get {
                  CROSS_RESULT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CROSS_RESULT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CROSS_INPUT: UInt32 {
                @inlinable @inline(__always) get {
                  CROSS_INPUT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CROSS_INPUT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIGNED: UInt32 {
                @inlinable @inline(__always) get {
                  SIGNED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIGNED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MASK_MSB: UInt32 {
                @inlinable @inline(__always) get {
                  MASK_MSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MASK_MSB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MASK_LSB: UInt32 {
                @inlinable @inline(__always) get {
                  MASK_LSB_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MASK_LSB_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SHIFT: UInt32 {
                @inlinable @inline(__always) get {
                  SHIFT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SHIFT_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTERP1_CTRL_LANE1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FORCE_MSB: BitField2 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FORCE_MSB_Field.self, BitField2.self)
                    return BitField2(storage: self.raw.FORCE_MSB)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FORCE_MSB_Field.self, BitField2.self)
                    self.raw.FORCE_MSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ADD_RAW: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADD_RAW_Field.self, Bool.self)
                  return Bool(storage: self.raw.ADD_RAW)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADD_RAW_Field.self, Bool.self)
                  self.raw.ADD_RAW = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CROSS_RESULT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_RESULT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_RESULT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CROSS_RESULT_Field.self, Bool.self)
                  self.raw.CROSS_RESULT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CROSS_INPUT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CROSS_INPUT_Field.self, Bool.self)
                  return Bool(storage: self.raw.CROSS_INPUT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CROSS_INPUT_Field.self, Bool.self)
                  self.raw.CROSS_INPUT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIGNED: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIGNED_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIGNED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIGNED_Field.self, Bool.self)
                  self.raw.SIGNED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MASK_MSB: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_MSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_MSB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MASK_MSB_Field.self, BitField5.self)
                  self.raw.MASK_MSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MASK_LSB: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASK_LSB_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.MASK_LSB)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MASK_LSB_Field.self, BitField5.self)
                  self.raw.MASK_LSB = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SHIFT: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SHIFT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SHIFT_Field.self, BitField5.self)
                  self.raw.SHIFT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Values written here are atomically added to ACCUM0
    /// Reading yields lane 0's raw shift and mask value (BASE0 not added).
    public var INTERP1_ACCUM0_ADD: Register<INTERP1_ACCUM0_ADD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4))
          #endif
        }
    }
    public struct INTERP1_ACCUM0_ADD_Descriptor {
        @available(*, unavailable)
        public var INTERP1_ACCUM0_ADD: INTERP1_ACCUM0_ADD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTERP1_ACCUM0_ADD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_ACCUM0_ADD_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTERP1_ACCUM0_ADD: UInt32 {
                @inlinable @inline(__always) get {
                    INTERP1_ACCUM0_ADD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTERP1_ACCUM0_ADD_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTERP1_ACCUM0_ADD_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTERP1_ACCUM0_ADD: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTERP1_ACCUM0_ADD_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.INTERP1_ACCUM0_ADD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTERP1_ACCUM0_ADD_Field.self, BitField24.self)
                    self.raw.INTERP1_ACCUM0_ADD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Values written here are atomically added to ACCUM1
    /// Reading yields lane 1's raw shift and mask value (BASE1 not added).
    public var INTERP1_ACCUM1_ADD: Register<INTERP1_ACCUM1_ADD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8))
          #endif
        }
    }
    public struct INTERP1_ACCUM1_ADD_Descriptor {
        @available(*, unavailable)
        public var INTERP1_ACCUM1_ADD: INTERP1_ACCUM1_ADD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTERP1_ACCUM1_ADD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 24
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_ACCUM1_ADD_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTERP1_ACCUM1_ADD: UInt32 {
                @inlinable @inline(__always) get {
                    INTERP1_ACCUM1_ADD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTERP1_ACCUM1_ADD_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTERP1_ACCUM1_ADD_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTERP1_ACCUM1_ADD: BitField24 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTERP1_ACCUM1_ADD_Field.self, BitField24.self)
                    return BitField24(storage: self.raw.INTERP1_ACCUM1_ADD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTERP1_ACCUM1_ADD_Field.self, BitField24.self)
                    self.raw.INTERP1_ACCUM1_ADD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// On write, the lower 16 bits go to BASE0, upper bits to BASE1 simultaneously.
    /// Each half is sign-extended to 32 bits if that lane's SIGNED flag is set.
    public var INTERP1_BASE_1AND0: Register<INTERP1_BASE_1AND0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00fc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00fc))
          #endif
        }
    }
    public struct INTERP1_BASE_1AND0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTERP1_BASE_1AND0_Descriptor

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

                    public  typealias Value = INTERP1_BASE_1AND0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK0: Register<SPINLOCK0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0100), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0100))
          #endif
        }
    }
    public struct SPINLOCK0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK0_Descriptor

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

                    public  typealias Value = SPINLOCK0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK1: Register<SPINLOCK1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0104), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0104))
          #endif
        }
    }
    public struct SPINLOCK1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK1_Descriptor

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

                    public  typealias Value = SPINLOCK1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK2: Register<SPINLOCK2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0108), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0108))
          #endif
        }
    }
    public struct SPINLOCK2_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK2_Descriptor

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

                    public  typealias Value = SPINLOCK2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK3: Register<SPINLOCK3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x010c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x010c))
          #endif
        }
    }
    public struct SPINLOCK3_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK3_Descriptor

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

                    public  typealias Value = SPINLOCK3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK4: Register<SPINLOCK4_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0110), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0110))
          #endif
        }
    }
    public struct SPINLOCK4_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK4_Descriptor

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

                    public  typealias Value = SPINLOCK4_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK5: Register<SPINLOCK5_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0114), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0114))
          #endif
        }
    }
    public struct SPINLOCK5_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK5_Descriptor

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

                    public  typealias Value = SPINLOCK5_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK6: Register<SPINLOCK6_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0118), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0118))
          #endif
        }
    }
    public struct SPINLOCK6_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK6_Descriptor

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

                    public  typealias Value = SPINLOCK6_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK7: Register<SPINLOCK7_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x011c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x011c))
          #endif
        }
    }
    public struct SPINLOCK7_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK7_Descriptor

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

                    public  typealias Value = SPINLOCK7_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK8: Register<SPINLOCK8_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0120), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0120))
          #endif
        }
    }
    public struct SPINLOCK8_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK8_Descriptor

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

                    public  typealias Value = SPINLOCK8_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK9: Register<SPINLOCK9_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0124), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0124))
          #endif
        }
    }
    public struct SPINLOCK9_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK9_Descriptor

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

                    public  typealias Value = SPINLOCK9_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK10: Register<SPINLOCK10_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0128), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0128))
          #endif
        }
    }
    public struct SPINLOCK10_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK10_Descriptor

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

                    public  typealias Value = SPINLOCK10_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK11: Register<SPINLOCK11_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x012c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x012c))
          #endif
        }
    }
    public struct SPINLOCK11_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK11_Descriptor

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

                    public  typealias Value = SPINLOCK11_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK12: Register<SPINLOCK12_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0130), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0130))
          #endif
        }
    }
    public struct SPINLOCK12_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK12_Descriptor

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

                    public  typealias Value = SPINLOCK12_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK13: Register<SPINLOCK13_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0134), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0134))
          #endif
        }
    }
    public struct SPINLOCK13_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK13_Descriptor

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

                    public  typealias Value = SPINLOCK13_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK14: Register<SPINLOCK14_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0138), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0138))
          #endif
        }
    }
    public struct SPINLOCK14_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK14_Descriptor

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

                    public  typealias Value = SPINLOCK14_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK15: Register<SPINLOCK15_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x013c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x013c))
          #endif
        }
    }
    public struct SPINLOCK15_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK15_Descriptor

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

                    public  typealias Value = SPINLOCK15_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK16: Register<SPINLOCK16_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0140), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0140))
          #endif
        }
    }
    public struct SPINLOCK16_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK16_Descriptor

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

                    public  typealias Value = SPINLOCK16_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK17: Register<SPINLOCK17_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0144), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0144))
          #endif
        }
    }
    public struct SPINLOCK17_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK17_Descriptor

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

                    public  typealias Value = SPINLOCK17_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK18: Register<SPINLOCK18_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0148), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0148))
          #endif
        }
    }
    public struct SPINLOCK18_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK18_Descriptor

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

                    public  typealias Value = SPINLOCK18_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK19: Register<SPINLOCK19_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x014c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x014c))
          #endif
        }
    }
    public struct SPINLOCK19_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK19_Descriptor

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

                    public  typealias Value = SPINLOCK19_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK20: Register<SPINLOCK20_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0150), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0150))
          #endif
        }
    }
    public struct SPINLOCK20_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK20_Descriptor

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

                    public  typealias Value = SPINLOCK20_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK21: Register<SPINLOCK21_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0154), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0154))
          #endif
        }
    }
    public struct SPINLOCK21_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK21_Descriptor

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

                    public  typealias Value = SPINLOCK21_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK22: Register<SPINLOCK22_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0158), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0158))
          #endif
        }
    }
    public struct SPINLOCK22_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK22_Descriptor

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

                    public  typealias Value = SPINLOCK22_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK23: Register<SPINLOCK23_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x015c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x015c))
          #endif
        }
    }
    public struct SPINLOCK23_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK23_Descriptor

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

                    public  typealias Value = SPINLOCK23_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK24: Register<SPINLOCK24_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0160), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0160))
          #endif
        }
    }
    public struct SPINLOCK24_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK24_Descriptor

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

                    public  typealias Value = SPINLOCK24_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK25: Register<SPINLOCK25_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0164), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0164))
          #endif
        }
    }
    public struct SPINLOCK25_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK25_Descriptor

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

                    public  typealias Value = SPINLOCK25_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK26: Register<SPINLOCK26_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0168), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0168))
          #endif
        }
    }
    public struct SPINLOCK26_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK26_Descriptor

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

                    public  typealias Value = SPINLOCK26_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK27: Register<SPINLOCK27_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x016c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x016c))
          #endif
        }
    }
    public struct SPINLOCK27_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK27_Descriptor

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

                    public  typealias Value = SPINLOCK27_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK28: Register<SPINLOCK28_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0170), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0170))
          #endif
        }
    }
    public struct SPINLOCK28_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK28_Descriptor

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

                    public  typealias Value = SPINLOCK28_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK29: Register<SPINLOCK29_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0174), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0174))
          #endif
        }
    }
    public struct SPINLOCK29_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK29_Descriptor

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

                    public  typealias Value = SPINLOCK29_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK30: Register<SPINLOCK30_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0178), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0178))
          #endif
        }
    }
    public struct SPINLOCK30_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK30_Descriptor

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

                    public  typealias Value = SPINLOCK30_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    public var SPINLOCK31: Register<SPINLOCK31_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x017c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x017c))
          #endif
        }
    }
    public struct SPINLOCK31_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPINLOCK31_Descriptor

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

                    public  typealias Value = SPINLOCK31_Descriptor
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

extension SIO.CPUID_Descriptor: RegisterValue {
}

extension SIO.GPIO_IN_Descriptor: RegisterValue {
}

extension SIO.GPIO_HI_IN_Descriptor: RegisterValue {
}

extension SIO.GPIO_OUT_Descriptor: RegisterValue {
}

extension SIO.GPIO_OUT_SET_Descriptor: RegisterValue {
}

extension SIO.GPIO_OUT_CLR_Descriptor: RegisterValue {
}

extension SIO.GPIO_OUT_XOR_Descriptor: RegisterValue {
}

extension SIO.GPIO_OE_Descriptor: RegisterValue {
}

extension SIO.GPIO_OE_SET_Descriptor: RegisterValue {
}

extension SIO.GPIO_OE_CLR_Descriptor: RegisterValue {
}

extension SIO.GPIO_OE_XOR_Descriptor: RegisterValue {
}

extension SIO.GPIO_HI_OUT_Descriptor: RegisterValue {
}

extension SIO.GPIO_HI_OUT_SET_Descriptor: RegisterValue {
}

extension SIO.GPIO_HI_OUT_CLR_Descriptor: RegisterValue {
}

extension SIO.GPIO_HI_OUT_XOR_Descriptor: RegisterValue {
}

extension SIO.GPIO_HI_OE_Descriptor: RegisterValue {
}

extension SIO.GPIO_HI_OE_SET_Descriptor: RegisterValue {
}

extension SIO.GPIO_HI_OE_CLR_Descriptor: RegisterValue {
}

extension SIO.GPIO_HI_OE_XOR_Descriptor: RegisterValue {
}

extension SIO.FIFO_ST_Descriptor: RegisterValue {
}

extension SIO.FIFO_WR_Descriptor: RegisterValue {
}

extension SIO.FIFO_RD_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK_ST_Descriptor: RegisterValue {
}

extension SIO.DIV_UDIVIDEND_Descriptor: RegisterValue {
}

extension SIO.DIV_UDIVISOR_Descriptor: RegisterValue {
}

extension SIO.DIV_SDIVIDEND_Descriptor: RegisterValue {
}

extension SIO.DIV_SDIVISOR_Descriptor: RegisterValue {
}

extension SIO.DIV_QUOTIENT_Descriptor: RegisterValue {
}

extension SIO.DIV_REMAINDER_Descriptor: RegisterValue {
}

extension SIO.DIV_CSR_Descriptor: RegisterValue {
}

extension SIO.INTERP0_ACCUM0_Descriptor: RegisterValue {
}

extension SIO.INTERP0_ACCUM1_Descriptor: RegisterValue {
}

extension SIO.INTERP0_BASE0_Descriptor: RegisterValue {
}

extension SIO.INTERP0_BASE1_Descriptor: RegisterValue {
}

extension SIO.INTERP0_BASE2_Descriptor: RegisterValue {
}

extension SIO.INTERP0_POP_LANE0_Descriptor: RegisterValue {
}

extension SIO.INTERP0_POP_LANE1_Descriptor: RegisterValue {
}

extension SIO.INTERP0_POP_FULL_Descriptor: RegisterValue {
}

extension SIO.INTERP0_PEEK_LANE0_Descriptor: RegisterValue {
}

extension SIO.INTERP0_PEEK_LANE1_Descriptor: RegisterValue {
}

extension SIO.INTERP0_PEEK_FULL_Descriptor: RegisterValue {
}

extension SIO.INTERP0_CTRL_LANE0_Descriptor: RegisterValue {
}

extension SIO.INTERP0_CTRL_LANE1_Descriptor: RegisterValue {
}

extension SIO.INTERP0_ACCUM0_ADD_Descriptor: RegisterValue {
}

extension SIO.INTERP0_ACCUM1_ADD_Descriptor: RegisterValue {
}

extension SIO.INTERP0_BASE_1AND0_Descriptor: RegisterValue {
}

extension SIO.INTERP1_ACCUM0_Descriptor: RegisterValue {
}

extension SIO.INTERP1_ACCUM1_Descriptor: RegisterValue {
}

extension SIO.INTERP1_BASE0_Descriptor: RegisterValue {
}

extension SIO.INTERP1_BASE1_Descriptor: RegisterValue {
}

extension SIO.INTERP1_BASE2_Descriptor: RegisterValue {
}

extension SIO.INTERP1_POP_LANE0_Descriptor: RegisterValue {
}

extension SIO.INTERP1_POP_LANE1_Descriptor: RegisterValue {
}

extension SIO.INTERP1_POP_FULL_Descriptor: RegisterValue {
}

extension SIO.INTERP1_PEEK_LANE0_Descriptor: RegisterValue {
}

extension SIO.INTERP1_PEEK_LANE1_Descriptor: RegisterValue {
}

extension SIO.INTERP1_PEEK_FULL_Descriptor: RegisterValue {
}

extension SIO.INTERP1_CTRL_LANE0_Descriptor: RegisterValue {
}

extension SIO.INTERP1_CTRL_LANE1_Descriptor: RegisterValue {
}

extension SIO.INTERP1_ACCUM0_ADD_Descriptor: RegisterValue {
}

extension SIO.INTERP1_ACCUM1_ADD_Descriptor: RegisterValue {
}

extension SIO.INTERP1_BASE_1AND0_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK0_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK1_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK2_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK3_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK4_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK5_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK6_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK7_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK8_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK9_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK10_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK11_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK12_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK13_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK14_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK15_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK16_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK17_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK18_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK19_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK20_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK21_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK22_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK23_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK24_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK25_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK26_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK27_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK28_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK29_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK30_Descriptor: RegisterValue {
}

extension SIO.SPINLOCK31_Descriptor: RegisterValue {
}
