import MMIO
import MMIOExtensions

/// Simple PWM
public struct PWM {

    public static var `default`: Self { .init(unsafeAddress: 0x40050000) }

    /// Control and status register
    public var CH0_CSR: Register<CH0_CSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CH0_CSR_Descriptor {
        @available(*, unavailable)
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        public var PH_ADV: PH_ADV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        public var PH_RET: PH_RET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DIVMODE: DIVMODE_Field {
            get {
                fatalError()
            }
        }

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Invert output B
        public var B_INV: B_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Invert output A
        public var A_INV: A_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        public var PH_CORRECT: PH_CORRECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable the PWM channel.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PH_ADV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum PH_RET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DIVMODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum B_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum A_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PH_CORRECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_CSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PH_ADV: UInt32 {
                @inlinable @inline(__always) get {
                    PH_ADV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PH_ADV_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PH_RET: UInt32 {
                @inlinable @inline(__always) get {
                  PH_RET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_RET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIVMODE: UInt32 {
                @inlinable @inline(__always) get {
                  DIVMODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIVMODE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var B_INV: UInt32 {
                @inlinable @inline(__always) get {
                  B_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  B_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var A_INV: UInt32 {
                @inlinable @inline(__always) get {
                  A_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PH_CORRECT: UInt32 {
                @inlinable @inline(__always) get {
                  PH_CORRECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_CORRECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH0_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PH_ADV: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    return Bool(storage: self.raw.PH_ADV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    self.raw.PH_ADV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PH_RET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_RET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  self.raw.PH_RET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIVMODE: DIVMODE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  return DIVMODE_Values(storage: self.raw.DIVMODE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  self.raw.DIVMODE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var B_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.B_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  self.raw.B_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var A_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.A_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  self.raw.A_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PH_CORRECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_CORRECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  self.raw.PH_CORRECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  self.raw.EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    public var CH0_DIV: Register<CH0_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct CH0_DIV_Descriptor {
        @available(*, unavailable)
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 12
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH0_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Direct access to the PWM counter
    public var CH0_CTR: Register<CH0_CTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct CH0_CTR_Descriptor {
        @available(*, unavailable)
        public var CH0_CTR: CH0_CTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH0_CTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_CTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH0_CTR: UInt32 {
                @inlinable @inline(__always) get {
                    CH0_CTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH0_CTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH0_CTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH0_CTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH0_CTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH0_CTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH0_CTR_Field.self, BitField16.self)
                    self.raw.CH0_CTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Counter compare values
    public var CH0_CC: Register<CH0_CC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct CH0_CC_Descriptor {
        @available(*, unavailable)
        public var B: B_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var A: A_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum B_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum A_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_CC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var B: UInt32 {
                @inlinable @inline(__always) get {
                    B_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    B_Field.insert(newValue, into: &self.storage)
                }
                }
              public var A: UInt32 {
                @inlinable @inline(__always) get {
                  A_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH0_CC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var B: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.B)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    self.raw.B = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var A: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.A)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  self.raw.A = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Counter wrap value
    public var CH0_TOP: Register<CH0_TOP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct CH0_TOP_Descriptor {
        @available(*, unavailable)
        public var CH0_TOP: CH0_TOP_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH0_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_TOP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH0_TOP: UInt32 {
                @inlinable @inline(__always) get {
                    CH0_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH0_TOP_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH0_TOP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH0_TOP: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH0_TOP_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH0_TOP)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH0_TOP_Field.self, BitField16.self)
                    self.raw.CH0_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Control and status register
    public var CH1_CSR: Register<CH1_CSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct CH1_CSR_Descriptor {
        @available(*, unavailable)
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        public var PH_ADV: PH_ADV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        public var PH_RET: PH_RET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DIVMODE: DIVMODE_Field {
            get {
                fatalError()
            }
        }

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Invert output B
        public var B_INV: B_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Invert output A
        public var A_INV: A_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        public var PH_CORRECT: PH_CORRECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable the PWM channel.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PH_ADV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum PH_RET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DIVMODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum B_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum A_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PH_CORRECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_CSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PH_ADV: UInt32 {
                @inlinable @inline(__always) get {
                    PH_ADV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PH_ADV_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PH_RET: UInt32 {
                @inlinable @inline(__always) get {
                  PH_RET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_RET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIVMODE: UInt32 {
                @inlinable @inline(__always) get {
                  DIVMODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIVMODE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var B_INV: UInt32 {
                @inlinable @inline(__always) get {
                  B_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  B_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var A_INV: UInt32 {
                @inlinable @inline(__always) get {
                  A_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PH_CORRECT: UInt32 {
                @inlinable @inline(__always) get {
                  PH_CORRECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_CORRECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH1_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PH_ADV: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    return Bool(storage: self.raw.PH_ADV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    self.raw.PH_ADV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PH_RET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_RET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  self.raw.PH_RET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIVMODE: DIVMODE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  return DIVMODE_Values(storage: self.raw.DIVMODE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  self.raw.DIVMODE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var B_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.B_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  self.raw.B_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var A_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.A_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  self.raw.A_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PH_CORRECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_CORRECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  self.raw.PH_CORRECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  self.raw.EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    public var CH1_DIV: Register<CH1_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct CH1_DIV_Descriptor {
        @available(*, unavailable)
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 12
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH1_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Direct access to the PWM counter
    public var CH1_CTR: Register<CH1_CTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct CH1_CTR_Descriptor {
        @available(*, unavailable)
        public var CH1_CTR: CH1_CTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH1_CTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_CTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH1_CTR: UInt32 {
                @inlinable @inline(__always) get {
                    CH1_CTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH1_CTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH1_CTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH1_CTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH1_CTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH1_CTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH1_CTR_Field.self, BitField16.self)
                    self.raw.CH1_CTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Counter compare values
    public var CH1_CC: Register<CH1_CC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct CH1_CC_Descriptor {
        @available(*, unavailable)
        public var B: B_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var A: A_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum B_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum A_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_CC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var B: UInt32 {
                @inlinable @inline(__always) get {
                    B_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    B_Field.insert(newValue, into: &self.storage)
                }
                }
              public var A: UInt32 {
                @inlinable @inline(__always) get {
                  A_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH1_CC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var B: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.B)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    self.raw.B = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var A: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.A)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  self.raw.A = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Counter wrap value
    public var CH1_TOP: Register<CH1_TOP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct CH1_TOP_Descriptor {
        @available(*, unavailable)
        public var CH1_TOP: CH1_TOP_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH1_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_TOP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH1_TOP: UInt32 {
                @inlinable @inline(__always) get {
                    CH1_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH1_TOP_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH1_TOP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH1_TOP: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH1_TOP_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH1_TOP)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH1_TOP_Field.self, BitField16.self)
                    self.raw.CH1_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Control and status register
    public var CH2_CSR: Register<CH2_CSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct CH2_CSR_Descriptor {
        @available(*, unavailable)
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        public var PH_ADV: PH_ADV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        public var PH_RET: PH_RET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DIVMODE: DIVMODE_Field {
            get {
                fatalError()
            }
        }

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Invert output B
        public var B_INV: B_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Invert output A
        public var A_INV: A_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        public var PH_CORRECT: PH_CORRECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable the PWM channel.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PH_ADV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum PH_RET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DIVMODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum B_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum A_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PH_CORRECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_CSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PH_ADV: UInt32 {
                @inlinable @inline(__always) get {
                    PH_ADV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PH_ADV_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PH_RET: UInt32 {
                @inlinable @inline(__always) get {
                  PH_RET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_RET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIVMODE: UInt32 {
                @inlinable @inline(__always) get {
                  DIVMODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIVMODE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var B_INV: UInt32 {
                @inlinable @inline(__always) get {
                  B_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  B_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var A_INV: UInt32 {
                @inlinable @inline(__always) get {
                  A_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PH_CORRECT: UInt32 {
                @inlinable @inline(__always) get {
                  PH_CORRECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_CORRECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH2_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PH_ADV: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    return Bool(storage: self.raw.PH_ADV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    self.raw.PH_ADV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PH_RET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_RET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  self.raw.PH_RET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIVMODE: DIVMODE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  return DIVMODE_Values(storage: self.raw.DIVMODE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  self.raw.DIVMODE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var B_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.B_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  self.raw.B_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var A_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.A_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  self.raw.A_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PH_CORRECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_CORRECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  self.raw.PH_CORRECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  self.raw.EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    public var CH2_DIV: Register<CH2_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct CH2_DIV_Descriptor {
        @available(*, unavailable)
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 12
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH2_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Direct access to the PWM counter
    public var CH2_CTR: Register<CH2_CTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct CH2_CTR_Descriptor {
        @available(*, unavailable)
        public var CH2_CTR: CH2_CTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH2_CTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_CTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH2_CTR: UInt32 {
                @inlinable @inline(__always) get {
                    CH2_CTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH2_CTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH2_CTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH2_CTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH2_CTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH2_CTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH2_CTR_Field.self, BitField16.self)
                    self.raw.CH2_CTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Counter compare values
    public var CH2_CC: Register<CH2_CC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct CH2_CC_Descriptor {
        @available(*, unavailable)
        public var B: B_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var A: A_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum B_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum A_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_CC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var B: UInt32 {
                @inlinable @inline(__always) get {
                    B_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    B_Field.insert(newValue, into: &self.storage)
                }
                }
              public var A: UInt32 {
                @inlinable @inline(__always) get {
                  A_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH2_CC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var B: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.B)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    self.raw.B = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var A: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.A)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  self.raw.A = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Counter wrap value
    public var CH2_TOP: Register<CH2_TOP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct CH2_TOP_Descriptor {
        @available(*, unavailable)
        public var CH2_TOP: CH2_TOP_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH2_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_TOP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH2_TOP: UInt32 {
                @inlinable @inline(__always) get {
                    CH2_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH2_TOP_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH2_TOP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH2_TOP: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH2_TOP_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH2_TOP)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH2_TOP_Field.self, BitField16.self)
                    self.raw.CH2_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Control and status register
    public var CH3_CSR: Register<CH3_CSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct CH3_CSR_Descriptor {
        @available(*, unavailable)
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        public var PH_ADV: PH_ADV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        public var PH_RET: PH_RET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DIVMODE: DIVMODE_Field {
            get {
                fatalError()
            }
        }

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Invert output B
        public var B_INV: B_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Invert output A
        public var A_INV: A_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        public var PH_CORRECT: PH_CORRECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable the PWM channel.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PH_ADV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum PH_RET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DIVMODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum B_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum A_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PH_CORRECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_CSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PH_ADV: UInt32 {
                @inlinable @inline(__always) get {
                    PH_ADV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PH_ADV_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PH_RET: UInt32 {
                @inlinable @inline(__always) get {
                  PH_RET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_RET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIVMODE: UInt32 {
                @inlinable @inline(__always) get {
                  DIVMODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIVMODE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var B_INV: UInt32 {
                @inlinable @inline(__always) get {
                  B_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  B_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var A_INV: UInt32 {
                @inlinable @inline(__always) get {
                  A_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PH_CORRECT: UInt32 {
                @inlinable @inline(__always) get {
                  PH_CORRECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_CORRECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH3_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PH_ADV: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    return Bool(storage: self.raw.PH_ADV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    self.raw.PH_ADV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PH_RET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_RET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  self.raw.PH_RET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIVMODE: DIVMODE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  return DIVMODE_Values(storage: self.raw.DIVMODE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  self.raw.DIVMODE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var B_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.B_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  self.raw.B_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var A_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.A_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  self.raw.A_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PH_CORRECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_CORRECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  self.raw.PH_CORRECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  self.raw.EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    public var CH3_DIV: Register<CH3_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct CH3_DIV_Descriptor {
        @available(*, unavailable)
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 12
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH3_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Direct access to the PWM counter
    public var CH3_CTR: Register<CH3_CTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct CH3_CTR_Descriptor {
        @available(*, unavailable)
        public var CH3_CTR: CH3_CTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH3_CTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_CTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH3_CTR: UInt32 {
                @inlinable @inline(__always) get {
                    CH3_CTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH3_CTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH3_CTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH3_CTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH3_CTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH3_CTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH3_CTR_Field.self, BitField16.self)
                    self.raw.CH3_CTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Counter compare values
    public var CH3_CC: Register<CH3_CC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct CH3_CC_Descriptor {
        @available(*, unavailable)
        public var B: B_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var A: A_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum B_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum A_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_CC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var B: UInt32 {
                @inlinable @inline(__always) get {
                    B_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    B_Field.insert(newValue, into: &self.storage)
                }
                }
              public var A: UInt32 {
                @inlinable @inline(__always) get {
                  A_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH3_CC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var B: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.B)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    self.raw.B = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var A: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.A)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  self.raw.A = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Counter wrap value
    public var CH3_TOP: Register<CH3_TOP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x004c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x004c))
          #endif
        }
    }
    public struct CH3_TOP_Descriptor {
        @available(*, unavailable)
        public var CH3_TOP: CH3_TOP_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH3_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_TOP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH3_TOP: UInt32 {
                @inlinable @inline(__always) get {
                    CH3_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH3_TOP_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH3_TOP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH3_TOP: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH3_TOP_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH3_TOP)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH3_TOP_Field.self, BitField16.self)
                    self.raw.CH3_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Control and status register
    public var CH4_CSR: Register<CH4_CSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct CH4_CSR_Descriptor {
        @available(*, unavailable)
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        public var PH_ADV: PH_ADV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        public var PH_RET: PH_RET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DIVMODE: DIVMODE_Field {
            get {
                fatalError()
            }
        }

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Invert output B
        public var B_INV: B_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Invert output A
        public var A_INV: A_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        public var PH_CORRECT: PH_CORRECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable the PWM channel.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PH_ADV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum PH_RET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DIVMODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum B_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum A_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PH_CORRECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_CSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PH_ADV: UInt32 {
                @inlinable @inline(__always) get {
                    PH_ADV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PH_ADV_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PH_RET: UInt32 {
                @inlinable @inline(__always) get {
                  PH_RET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_RET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIVMODE: UInt32 {
                @inlinable @inline(__always) get {
                  DIVMODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIVMODE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var B_INV: UInt32 {
                @inlinable @inline(__always) get {
                  B_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  B_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var A_INV: UInt32 {
                @inlinable @inline(__always) get {
                  A_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PH_CORRECT: UInt32 {
                @inlinable @inline(__always) get {
                  PH_CORRECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_CORRECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH4_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PH_ADV: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    return Bool(storage: self.raw.PH_ADV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    self.raw.PH_ADV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PH_RET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_RET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  self.raw.PH_RET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIVMODE: DIVMODE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  return DIVMODE_Values(storage: self.raw.DIVMODE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  self.raw.DIVMODE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var B_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.B_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  self.raw.B_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var A_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.A_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  self.raw.A_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PH_CORRECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_CORRECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  self.raw.PH_CORRECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  self.raw.EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    public var CH4_DIV: Register<CH4_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct CH4_DIV_Descriptor {
        @available(*, unavailable)
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 12
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH4_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Direct access to the PWM counter
    public var CH4_CTR: Register<CH4_CTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0058), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0058))
          #endif
        }
    }
    public struct CH4_CTR_Descriptor {
        @available(*, unavailable)
        public var CH4_CTR: CH4_CTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH4_CTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_CTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH4_CTR: UInt32 {
                @inlinable @inline(__always) get {
                    CH4_CTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH4_CTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH4_CTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH4_CTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH4_CTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH4_CTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH4_CTR_Field.self, BitField16.self)
                    self.raw.CH4_CTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Counter compare values
    public var CH4_CC: Register<CH4_CC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x005c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x005c))
          #endif
        }
    }
    public struct CH4_CC_Descriptor {
        @available(*, unavailable)
        public var B: B_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var A: A_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum B_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum A_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_CC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var B: UInt32 {
                @inlinable @inline(__always) get {
                    B_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    B_Field.insert(newValue, into: &self.storage)
                }
                }
              public var A: UInt32 {
                @inlinable @inline(__always) get {
                  A_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH4_CC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var B: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.B)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    self.raw.B = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var A: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.A)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  self.raw.A = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Counter wrap value
    public var CH4_TOP: Register<CH4_TOP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0060), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0060))
          #endif
        }
    }
    public struct CH4_TOP_Descriptor {
        @available(*, unavailable)
        public var CH4_TOP: CH4_TOP_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH4_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_TOP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH4_TOP: UInt32 {
                @inlinable @inline(__always) get {
                    CH4_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH4_TOP_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH4_TOP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH4_TOP: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH4_TOP_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH4_TOP)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH4_TOP_Field.self, BitField16.self)
                    self.raw.CH4_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Control and status register
    public var CH5_CSR: Register<CH5_CSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0064), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0064))
          #endif
        }
    }
    public struct CH5_CSR_Descriptor {
        @available(*, unavailable)
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        public var PH_ADV: PH_ADV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        public var PH_RET: PH_RET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DIVMODE: DIVMODE_Field {
            get {
                fatalError()
            }
        }

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Invert output B
        public var B_INV: B_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Invert output A
        public var A_INV: A_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        public var PH_CORRECT: PH_CORRECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable the PWM channel.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PH_ADV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum PH_RET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DIVMODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum B_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum A_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PH_CORRECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_CSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PH_ADV: UInt32 {
                @inlinable @inline(__always) get {
                    PH_ADV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PH_ADV_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PH_RET: UInt32 {
                @inlinable @inline(__always) get {
                  PH_RET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_RET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIVMODE: UInt32 {
                @inlinable @inline(__always) get {
                  DIVMODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIVMODE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var B_INV: UInt32 {
                @inlinable @inline(__always) get {
                  B_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  B_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var A_INV: UInt32 {
                @inlinable @inline(__always) get {
                  A_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PH_CORRECT: UInt32 {
                @inlinable @inline(__always) get {
                  PH_CORRECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_CORRECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH5_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PH_ADV: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    return Bool(storage: self.raw.PH_ADV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    self.raw.PH_ADV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PH_RET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_RET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  self.raw.PH_RET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIVMODE: DIVMODE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  return DIVMODE_Values(storage: self.raw.DIVMODE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  self.raw.DIVMODE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var B_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.B_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  self.raw.B_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var A_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.A_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  self.raw.A_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PH_CORRECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_CORRECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  self.raw.PH_CORRECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  self.raw.EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    public var CH5_DIV: Register<CH5_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0068), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0068))
          #endif
        }
    }
    public struct CH5_DIV_Descriptor {
        @available(*, unavailable)
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 12
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH5_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Direct access to the PWM counter
    public var CH5_CTR: Register<CH5_CTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x006c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x006c))
          #endif
        }
    }
    public struct CH5_CTR_Descriptor {
        @available(*, unavailable)
        public var CH5_CTR: CH5_CTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH5_CTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_CTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH5_CTR: UInt32 {
                @inlinable @inline(__always) get {
                    CH5_CTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH5_CTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH5_CTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH5_CTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH5_CTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH5_CTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH5_CTR_Field.self, BitField16.self)
                    self.raw.CH5_CTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Counter compare values
    public var CH5_CC: Register<CH5_CC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0070), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0070))
          #endif
        }
    }
    public struct CH5_CC_Descriptor {
        @available(*, unavailable)
        public var B: B_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var A: A_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum B_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum A_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_CC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var B: UInt32 {
                @inlinable @inline(__always) get {
                    B_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    B_Field.insert(newValue, into: &self.storage)
                }
                }
              public var A: UInt32 {
                @inlinable @inline(__always) get {
                  A_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH5_CC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var B: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.B)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    self.raw.B = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var A: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.A)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  self.raw.A = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Counter wrap value
    public var CH5_TOP: Register<CH5_TOP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0074), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0074))
          #endif
        }
    }
    public struct CH5_TOP_Descriptor {
        @available(*, unavailable)
        public var CH5_TOP: CH5_TOP_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH5_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_TOP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH5_TOP: UInt32 {
                @inlinable @inline(__always) get {
                    CH5_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH5_TOP_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH5_TOP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH5_TOP: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH5_TOP_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH5_TOP)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH5_TOP_Field.self, BitField16.self)
                    self.raw.CH5_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Control and status register
    public var CH6_CSR: Register<CH6_CSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0078), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0078))
          #endif
        }
    }
    public struct CH6_CSR_Descriptor {
        @available(*, unavailable)
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        public var PH_ADV: PH_ADV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        public var PH_RET: PH_RET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DIVMODE: DIVMODE_Field {
            get {
                fatalError()
            }
        }

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Invert output B
        public var B_INV: B_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Invert output A
        public var A_INV: A_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        public var PH_CORRECT: PH_CORRECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable the PWM channel.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PH_ADV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum PH_RET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DIVMODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum B_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum A_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PH_CORRECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_CSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PH_ADV: UInt32 {
                @inlinable @inline(__always) get {
                    PH_ADV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PH_ADV_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PH_RET: UInt32 {
                @inlinable @inline(__always) get {
                  PH_RET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_RET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIVMODE: UInt32 {
                @inlinable @inline(__always) get {
                  DIVMODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIVMODE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var B_INV: UInt32 {
                @inlinable @inline(__always) get {
                  B_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  B_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var A_INV: UInt32 {
                @inlinable @inline(__always) get {
                  A_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PH_CORRECT: UInt32 {
                @inlinable @inline(__always) get {
                  PH_CORRECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_CORRECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH6_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PH_ADV: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    return Bool(storage: self.raw.PH_ADV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    self.raw.PH_ADV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PH_RET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_RET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  self.raw.PH_RET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIVMODE: DIVMODE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  return DIVMODE_Values(storage: self.raw.DIVMODE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  self.raw.DIVMODE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var B_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.B_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  self.raw.B_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var A_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.A_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  self.raw.A_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PH_CORRECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_CORRECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  self.raw.PH_CORRECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  self.raw.EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    public var CH6_DIV: Register<CH6_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x007c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x007c))
          #endif
        }
    }
    public struct CH6_DIV_Descriptor {
        @available(*, unavailable)
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 12
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH6_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Direct access to the PWM counter
    public var CH6_CTR: Register<CH6_CTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0080), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0080))
          #endif
        }
    }
    public struct CH6_CTR_Descriptor {
        @available(*, unavailable)
        public var CH6_CTR: CH6_CTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH6_CTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_CTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH6_CTR: UInt32 {
                @inlinable @inline(__always) get {
                    CH6_CTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH6_CTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH6_CTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH6_CTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH6_CTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH6_CTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH6_CTR_Field.self, BitField16.self)
                    self.raw.CH6_CTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Counter compare values
    public var CH6_CC: Register<CH6_CC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0084), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0084))
          #endif
        }
    }
    public struct CH6_CC_Descriptor {
        @available(*, unavailable)
        public var B: B_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var A: A_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum B_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum A_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_CC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var B: UInt32 {
                @inlinable @inline(__always) get {
                    B_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    B_Field.insert(newValue, into: &self.storage)
                }
                }
              public var A: UInt32 {
                @inlinable @inline(__always) get {
                  A_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH6_CC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var B: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.B)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    self.raw.B = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var A: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.A)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  self.raw.A = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Counter wrap value
    public var CH6_TOP: Register<CH6_TOP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0088), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0088))
          #endif
        }
    }
    public struct CH6_TOP_Descriptor {
        @available(*, unavailable)
        public var CH6_TOP: CH6_TOP_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH6_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_TOP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH6_TOP: UInt32 {
                @inlinable @inline(__always) get {
                    CH6_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH6_TOP_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH6_TOP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH6_TOP: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH6_TOP_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH6_TOP)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH6_TOP_Field.self, BitField16.self)
                    self.raw.CH6_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Control and status register
    public var CH7_CSR: Register<CH7_CSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x008c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x008c))
          #endif
        }
    }
    public struct CH7_CSR_Descriptor {
        @available(*, unavailable)
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        public var PH_ADV: PH_ADV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        public var PH_RET: PH_RET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var DIVMODE: DIVMODE_Field {
            get {
                fatalError()
            }
        }

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Invert output B
        public var B_INV: B_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Invert output A
        public var A_INV: A_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        public var PH_CORRECT: PH_CORRECT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable the PWM channel.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PH_ADV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum PH_RET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum DIVMODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum B_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum A_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PH_CORRECT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_CSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var PH_ADV: UInt32 {
                @inlinable @inline(__always) get {
                    PH_ADV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PH_ADV_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PH_RET: UInt32 {
                @inlinable @inline(__always) get {
                  PH_RET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_RET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DIVMODE: UInt32 {
                @inlinable @inline(__always) get {
                  DIVMODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DIVMODE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var B_INV: UInt32 {
                @inlinable @inline(__always) get {
                  B_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  B_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var A_INV: UInt32 {
                @inlinable @inline(__always) get {
                  A_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_INV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PH_CORRECT: UInt32 {
                @inlinable @inline(__always) get {
                  PH_CORRECT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PH_CORRECT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH7_CSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var PH_ADV: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    return Bool(storage: self.raw.PH_ADV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(PH_ADV_Field.self, Bool.self)
                    self.raw.PH_ADV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var PH_RET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_RET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_RET_Field.self, Bool.self)
                  self.raw.PH_RET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DIVMODE: DIVMODE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  return DIVMODE_Values(storage: self.raw.DIVMODE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DIVMODE_Field.self, DIVMODE_Values.self)
                  self.raw.DIVMODE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var B_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.B_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(B_INV_Field.self, Bool.self)
                  self.raw.B_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var A_INV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  return Bool(storage: self.raw.A_INV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_INV_Field.self, Bool.self)
                  self.raw.A_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PH_CORRECT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  return Bool(storage: self.raw.PH_CORRECT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PH_CORRECT_Field.self, Bool.self)
                  self.raw.PH_CORRECT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  self.raw.EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    public var CH7_DIV: Register<CH7_DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0090), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0090))
          #endif
        }
    }
    public struct CH7_DIV_Descriptor {
        @available(*, unavailable)
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FRAC: FRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 12
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_DIV_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INT: UInt32 {
                @inlinable @inline(__always) get {
                    INT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FRAC: UInt32 {
                @inlinable @inline(__always) get {
                  FRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRAC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH7_DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField8.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField4.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Direct access to the PWM counter
    public var CH7_CTR: Register<CH7_CTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0094), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0094))
          #endif
        }
    }
    public struct CH7_CTR_Descriptor {
        @available(*, unavailable)
        public var CH7_CTR: CH7_CTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH7_CTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_CTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH7_CTR: UInt32 {
                @inlinable @inline(__always) get {
                    CH7_CTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH7_CTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH7_CTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH7_CTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH7_CTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH7_CTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH7_CTR_Field.self, BitField16.self)
                    self.raw.CH7_CTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Counter compare values
    public var CH7_CC: Register<CH7_CC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0098), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0098))
          #endif
        }
    }
    public struct CH7_CC_Descriptor {
        @available(*, unavailable)
        public var B: B_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var A: A_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum B_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum A_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_CC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var B: UInt32 {
                @inlinable @inline(__always) get {
                    B_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    B_Field.insert(newValue, into: &self.storage)
                }
                }
              public var A: UInt32 {
                @inlinable @inline(__always) get {
                  A_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  A_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH7_CC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var B: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.B)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(B_Field.self, BitField16.self)
                    self.raw.B = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var A: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.A)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(A_Field.self, BitField16.self)
                  self.raw.A = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Counter wrap value
    public var CH7_TOP: Register<CH7_TOP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x009c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x009c))
          #endif
        }
    }
    public struct CH7_TOP_Descriptor {
        @available(*, unavailable)
        public var CH7_TOP: CH7_TOP_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH7_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_TOP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH7_TOP: UInt32 {
                @inlinable @inline(__always) get {
                    CH7_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH7_TOP_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH7_TOP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH7_TOP: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH7_TOP_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CH7_TOP)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH7_TOP_Field.self, BitField16.self)
                    self.raw.CH7_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// This register aliases the CSR_EN bits for all channels.
    /// Writing to this register allows multiple channels to be enabled
    /// or disabled simultaneously, so they can run in perfect sync.
    /// For each channel, there is only one physical EN register bit,
    /// which can be accessed through here or CHx_CSR.
    public var EN: Register<EN_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0))
          #endif
        }
    }
    public struct EN_Descriptor {
        @available(*, unavailable)
        public var CH7: CH7_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH6: CH6_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH5: CH5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH4: CH4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH3: CH3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH2: CH2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH1: CH1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH0: CH0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH7_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum CH6_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum CH5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum CH4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum CH3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum CH2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum CH1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum CH0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = EN_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH7: UInt32 {
                @inlinable @inline(__always) get {
                    CH7_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH7_Field.insert(newValue, into: &self.storage)
                }
                }
              public var CH6: UInt32 {
                @inlinable @inline(__always) get {
                  CH6_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH6_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH5: UInt32 {
                @inlinable @inline(__always) get {
                  CH5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH4: UInt32 {
                @inlinable @inline(__always) get {
                  CH4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH4_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH3: UInt32 {
                @inlinable @inline(__always) get {
                  CH3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH2: UInt32 {
                @inlinable @inline(__always) get {
                  CH2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH1: UInt32 {
                @inlinable @inline(__always) get {
                  CH1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH0: UInt32 {
                @inlinable @inline(__always) get {
                  CH0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = EN_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH7: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH7_Field.self, Bool.self)
                    return Bool(storage: self.raw.CH7)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH7_Field.self, Bool.self)
                    self.raw.CH7 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var CH6: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH6_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH6)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH6_Field.self, Bool.self)
                  self.raw.CH6 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH5_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH5_Field.self, Bool.self)
                  self.raw.CH5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH4_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH4_Field.self, Bool.self)
                  self.raw.CH4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH3: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH3_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH3)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH3_Field.self, Bool.self)
                  self.raw.CH3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH2_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH2_Field.self, Bool.self)
                  self.raw.CH2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH1_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH1_Field.self, Bool.self)
                  self.raw.CH1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH0_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH0_Field.self, Bool.self)
                  self.raw.CH0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Raw Interrupts
    public var INTR: Register<INTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4))
          #endif
        }
    }
    public struct INTR_Descriptor {
        @available(*, unavailable)
        public var CH7: CH7_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH6: CH6_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH5: CH5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH4: CH4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH3: CH3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH2: CH2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH1: CH1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH0: CH0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH7_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum CH6_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum CH5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum CH4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum CH3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum CH2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum CH1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum CH0_Field: ContiguousBitField {
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

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH7: UInt32 {
                @inlinable @inline(__always) get {
                    CH7_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH7_Field.insert(newValue, into: &self.storage)
                }
                }
              public var CH6: UInt32 {
                @inlinable @inline(__always) get {
                  CH6_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH6_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH5: UInt32 {
                @inlinable @inline(__always) get {
                  CH5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH4: UInt32 {
                @inlinable @inline(__always) get {
                  CH4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH4_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH3: UInt32 {
                @inlinable @inline(__always) get {
                  CH3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH2: UInt32 {
                @inlinable @inline(__always) get {
                  CH2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH1: UInt32 {
                @inlinable @inline(__always) get {
                  CH1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH0: UInt32 {
                @inlinable @inline(__always) get {
                  CH0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH7: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH7_Field.self, Bool.self)
                    return Bool(storage: self.raw.CH7)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH7_Field.self, Bool.self)
                    self.raw.CH7 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var CH6: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH6_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH6)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH6_Field.self, Bool.self)
                  self.raw.CH6 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH5_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH5_Field.self, Bool.self)
                  self.raw.CH5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH4_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH4_Field.self, Bool.self)
                  self.raw.CH4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH3: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH3_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH3)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH3_Field.self, Bool.self)
                  self.raw.CH3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH2_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH2_Field.self, Bool.self)
                  self.raw.CH2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH1_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH1_Field.self, Bool.self)
                  self.raw.CH1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH0_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH0_Field.self, Bool.self)
                  self.raw.CH0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Enable
    public var INTE: Register<INTE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8))
          #endif
        }
    }
    public struct INTE_Descriptor {
        @available(*, unavailable)
        public var CH7: CH7_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH6: CH6_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH5: CH5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH4: CH4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH3: CH3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH2: CH2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH1: CH1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH0: CH0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH7_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum CH6_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum CH5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum CH4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum CH3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum CH2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum CH1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum CH0_Field: ContiguousBitField {
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
                public var CH7: UInt32 {
                @inlinable @inline(__always) get {
                    CH7_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH7_Field.insert(newValue, into: &self.storage)
                }
                }
              public var CH6: UInt32 {
                @inlinable @inline(__always) get {
                  CH6_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH6_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH5: UInt32 {
                @inlinable @inline(__always) get {
                  CH5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH4: UInt32 {
                @inlinable @inline(__always) get {
                  CH4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH4_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH3: UInt32 {
                @inlinable @inline(__always) get {
                  CH3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH2: UInt32 {
                @inlinable @inline(__always) get {
                  CH2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH1: UInt32 {
                @inlinable @inline(__always) get {
                  CH1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH0: UInt32 {
                @inlinable @inline(__always) get {
                  CH0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH0_Field.insert(newValue, into: &self.storage)
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
                public var CH7: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH7_Field.self, Bool.self)
                    return Bool(storage: self.raw.CH7)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH7_Field.self, Bool.self)
                    self.raw.CH7 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var CH6: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH6_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH6)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH6_Field.self, Bool.self)
                  self.raw.CH6 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH5_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH5_Field.self, Bool.self)
                  self.raw.CH5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH4_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH4_Field.self, Bool.self)
                  self.raw.CH4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH3: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH3_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH3)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH3_Field.self, Bool.self)
                  self.raw.CH3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH2_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH2_Field.self, Bool.self)
                  self.raw.CH2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH1_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH1_Field.self, Bool.self)
                  self.raw.CH1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH0_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH0_Field.self, Bool.self)
                  self.raw.CH0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Force
    public var INTF: Register<INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac))
          #endif
        }
    }
    public struct INTF_Descriptor {
        @available(*, unavailable)
        public var CH7: CH7_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH6: CH6_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH5: CH5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH4: CH4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH3: CH3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH2: CH2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH1: CH1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH0: CH0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH7_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum CH6_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum CH5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum CH4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum CH3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum CH2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum CH1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum CH0_Field: ContiguousBitField {
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
                public var CH7: UInt32 {
                @inlinable @inline(__always) get {
                    CH7_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH7_Field.insert(newValue, into: &self.storage)
                }
                }
              public var CH6: UInt32 {
                @inlinable @inline(__always) get {
                  CH6_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH6_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH5: UInt32 {
                @inlinable @inline(__always) get {
                  CH5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH4: UInt32 {
                @inlinable @inline(__always) get {
                  CH4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH4_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH3: UInt32 {
                @inlinable @inline(__always) get {
                  CH3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH2: UInt32 {
                @inlinable @inline(__always) get {
                  CH2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH1: UInt32 {
                @inlinable @inline(__always) get {
                  CH1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH0: UInt32 {
                @inlinable @inline(__always) get {
                  CH0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH0_Field.insert(newValue, into: &self.storage)
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
                public var CH7: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH7_Field.self, Bool.self)
                    return Bool(storage: self.raw.CH7)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH7_Field.self, Bool.self)
                    self.raw.CH7 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var CH6: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH6_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH6)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH6_Field.self, Bool.self)
                  self.raw.CH6 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH5_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH5_Field.self, Bool.self)
                  self.raw.CH5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH4_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH4_Field.self, Bool.self)
                  self.raw.CH4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH3: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH3_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH3)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH3_Field.self, Bool.self)
                  self.raw.CH3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH2_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH2_Field.self, Bool.self)
                  self.raw.CH2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH1_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH1_Field.self, Bool.self)
                  self.raw.CH1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CH0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH0_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CH0_Field.self, Bool.self)
                  self.raw.CH0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt status after masking & forcing
    public var INTS: Register<INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0))
          #endif
        }
    }
    public struct INTS_Descriptor {
        @available(*, unavailable)
        public var CH7: CH7_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH6: CH6_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH5: CH5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH4: CH4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH3: CH3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH2: CH2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH1: CH1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CH0: CH0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH7_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum CH6_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum CH5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum CH4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum CH3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum CH2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum CH1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum CH0_Field: ContiguousBitField {
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
                public var CH7: UInt32 {
                @inlinable @inline(__always) get {
                    CH7_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH7_Field.insert(newValue, into: &self.storage)
                }
                }
              public var CH6: UInt32 {
                @inlinable @inline(__always) get {
                  CH6_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH6_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH5: UInt32 {
                @inlinable @inline(__always) get {
                  CH5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH4: UInt32 {
                @inlinable @inline(__always) get {
                  CH4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH4_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH3: UInt32 {
                @inlinable @inline(__always) get {
                  CH3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH2: UInt32 {
                @inlinable @inline(__always) get {
                  CH2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH1: UInt32 {
                @inlinable @inline(__always) get {
                  CH1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CH0: UInt32 {
                @inlinable @inline(__always) get {
                  CH0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CH0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CH7: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH7_Field.self, Bool.self)
                    return Bool(storage: self.raw.CH7)
                }
                }
              public var CH6: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH6_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH6)
                }
              }
              public var CH5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH5_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH5)
                }
              }
              public var CH4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH4_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH4)
                }
              }
              public var CH3: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH3_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH3)
                }
              }
              public var CH2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH2_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH2)
                }
              }
              public var CH1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH1_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH1)
                }
              }
              public var CH0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CH0_Field.self, Bool.self)
                  return Bool(storage: self.raw.CH0)
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

extension PWM.CH0_CSR_Descriptor: RegisterValue {
}

extension PWM.CH0_DIV_Descriptor: RegisterValue {
}

extension PWM.CH0_CTR_Descriptor: RegisterValue {
}

extension PWM.CH0_CC_Descriptor: RegisterValue {
}

extension PWM.CH0_TOP_Descriptor: RegisterValue {
}

extension PWM.CH1_CSR_Descriptor: RegisterValue {
}

extension PWM.CH1_DIV_Descriptor: RegisterValue {
}

extension PWM.CH1_CTR_Descriptor: RegisterValue {
}

extension PWM.CH1_CC_Descriptor: RegisterValue {
}

extension PWM.CH1_TOP_Descriptor: RegisterValue {
}

extension PWM.CH2_CSR_Descriptor: RegisterValue {
}

extension PWM.CH2_DIV_Descriptor: RegisterValue {
}

extension PWM.CH2_CTR_Descriptor: RegisterValue {
}

extension PWM.CH2_CC_Descriptor: RegisterValue {
}

extension PWM.CH2_TOP_Descriptor: RegisterValue {
}

extension PWM.CH3_CSR_Descriptor: RegisterValue {
}

extension PWM.CH3_DIV_Descriptor: RegisterValue {
}

extension PWM.CH3_CTR_Descriptor: RegisterValue {
}

extension PWM.CH3_CC_Descriptor: RegisterValue {
}

extension PWM.CH3_TOP_Descriptor: RegisterValue {
}

extension PWM.CH4_CSR_Descriptor: RegisterValue {
}

extension PWM.CH4_DIV_Descriptor: RegisterValue {
}

extension PWM.CH4_CTR_Descriptor: RegisterValue {
}

extension PWM.CH4_CC_Descriptor: RegisterValue {
}

extension PWM.CH4_TOP_Descriptor: RegisterValue {
}

extension PWM.CH5_CSR_Descriptor: RegisterValue {
}

extension PWM.CH5_DIV_Descriptor: RegisterValue {
}

extension PWM.CH5_CTR_Descriptor: RegisterValue {
}

extension PWM.CH5_CC_Descriptor: RegisterValue {
}

extension PWM.CH5_TOP_Descriptor: RegisterValue {
}

extension PWM.CH6_CSR_Descriptor: RegisterValue {
}

extension PWM.CH6_DIV_Descriptor: RegisterValue {
}

extension PWM.CH6_CTR_Descriptor: RegisterValue {
}

extension PWM.CH6_CC_Descriptor: RegisterValue {
}

extension PWM.CH6_TOP_Descriptor: RegisterValue {
}

extension PWM.CH7_CSR_Descriptor: RegisterValue {
}

extension PWM.CH7_DIV_Descriptor: RegisterValue {
}

extension PWM.CH7_CTR_Descriptor: RegisterValue {
}

extension PWM.CH7_CC_Descriptor: RegisterValue {
}

extension PWM.CH7_TOP_Descriptor: RegisterValue {
}

extension PWM.EN_Descriptor: RegisterValue {
}

extension PWM.INTR_Descriptor: RegisterValue {
}

extension PWM.INTE_Descriptor: RegisterValue {
}

extension PWM.INTF_Descriptor: RegisterValue {
}

extension PWM.INTS_Descriptor: RegisterValue {
}
