import MMIO
import MMIOExtensions

/// Control and data interface to SAR ADC
public struct ADC {

    public static var `default`: Self { .init(unsafeAddress: 0x4004c000) }

    /// ADC Control and Status
    public var CS: Register<CS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CS_Descriptor {
        @available(*, unavailable)
        /// Round-robin sampling. 1 bit per channel. Set all bits to 0 to disable.
        /// Otherwise, the ADC will cycle through each enabled channel in a round-robin fashion.
        /// The first channel to be sampled will be the one currently indicated by AINSEL.
        /// AINSEL will be updated after each conversion with the newly-selected channel.
        public var RROBIN: RROBIN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select analog mux input. Updated automatically in round-robin mode.
        public var AINSEL: AINSEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Some past ADC conversion encountered an error. Write 1 to clear.
        public var ERR_STICKY: ERR_STICKY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The most recent ADC conversion encountered an error; result is undefined or noisy.
        public var ERR: ERR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 if the ADC is ready to start a new conversion. Implies any previous conversion has completed.
        /// 0 whilst conversion in progress.
        public var READY: READY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Continuously perform conversions whilst this bit is 1. A new conversion will start immediately after the previous finishes.
        public var START_MANY: START_MANY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Start a single conversion. Self-clearing. Ignored if start_many is asserted.
        public var START_ONCE: START_ONCE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Power on temperature sensor. 1 - enabled. 0 - disabled.
        public var TS_EN: TS_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Power on ADC and enable its clock.
        /// 1 - enabled. 0 - disabled.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RROBIN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 21
        }

        public enum AINSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 15
        }

        public enum ERR_STICKY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum ERR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum READY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum START_MANY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum START_ONCE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum TS_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CS_Descriptor

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
                public var RROBIN: UInt32 {
                @inlinable @inline(__always) get {
                    RROBIN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RROBIN_Field.insert(newValue, into: &self.storage)
                }
                }
              public var AINSEL: UInt32 {
                @inlinable @inline(__always) get {
                  AINSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AINSEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERR_STICKY: UInt32 {
                @inlinable @inline(__always) get {
                  ERR_STICKY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERR_STICKY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERR: UInt32 {
                @inlinable @inline(__always) get {
                  ERR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERR_Field.insert(newValue, into: &self.storage)
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
              public var START_MANY: UInt32 {
                @inlinable @inline(__always) get {
                  START_MANY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  START_MANY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var START_ONCE: UInt32 {
                @inlinable @inline(__always) get {
                  START_ONCE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  START_ONCE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TS_EN: UInt32 {
                @inlinable @inline(__always) get {
                  TS_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TS_EN_Field.insert(newValue, into: &self.storage)
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

        public  struct Read: RegisterValueRead {

                    public  typealias Value = CS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RROBIN: BitField5 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RROBIN_Field.self, BitField5.self)
                    return BitField5(storage: self.raw.RROBIN)
                }
                }
              public var AINSEL: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AINSEL_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.AINSEL)
                }
              }
              public var ERR_STICKY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERR_STICKY_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERR_STICKY)
                }
              }
              public var ERR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERR_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERR)
                }
              }
              public var READY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READY_Field.self, Bool.self)
                  return Bool(storage: self.raw.READY)
                }
              }
              public var START_MANY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(START_MANY_Field.self, Bool.self)
                  return Bool(storage: self.raw.START_MANY)
                }
              }
              public var START_ONCE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(START_ONCE_Field.self, Bool.self)
                  return Bool(storage: self.raw.START_ONCE)
                }
              }
              public var TS_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TS_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.TS_EN)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = CS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var RROBIN: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RROBIN_Field.self, BitField5.self)
                    return BitField5(storage: self.raw.RROBIN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RROBIN_Field.self, BitField5.self)
                    self.raw.RROBIN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var AINSEL: BitField3 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AINSEL_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.AINSEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AINSEL_Field.self, BitField3.self)
                  self.raw.AINSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERR_STICKY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERR_STICKY_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERR_STICKY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERR_STICKY_Field.self, Bool.self)
                  self.raw.ERR_STICKY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var START_MANY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(START_MANY_Field.self, Bool.self)
                  return Bool(storage: self.raw.START_MANY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(START_MANY_Field.self, Bool.self)
                  self.raw.START_MANY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var START_ONCE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(START_ONCE_Field.self, Bool.self)
                  return Bool(storage: self.raw.START_ONCE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(START_ONCE_Field.self, Bool.self)
                  self.raw.START_ONCE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TS_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TS_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.TS_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TS_EN_Field.self, Bool.self)
                  self.raw.TS_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
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

    /// Result of most recent ADC conversion
    public var RESULT: Register<RESULT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct RESULT_Descriptor {
        @available(*, unavailable)
        public var RESULT: RESULT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RESULT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 12
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RESULT_Descriptor

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
                public var RESULT: UInt32 {
                @inlinable @inline(__always) get {
                    RESULT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RESULT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = RESULT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RESULT: BitField12 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RESULT_Field.self, BitField12.self)
                    return BitField12(storage: self.raw.RESULT)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = RESULT_Descriptor
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

    /// FIFO control and status
    public var FCS: Register<FCS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct FCS_Descriptor {
        @available(*, unavailable)
        /// DREQ/IRQ asserted when level >= threshold
        public var THRESH: THRESH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of conversion results currently waiting in the FIFO
        public var LEVEL: LEVEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 if the FIFO has been overflowed. Write 1 to clear.
        public var OVER: OVER_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 if the FIFO has been underflowed. Write 1 to clear.
        public var UNDER: UNDER_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var FULL: FULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var EMPTY: EMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1: assert DMA requests when FIFO contains data
        public var DREQ_EN: DREQ_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1: conversion error bit appears in the FIFO alongside the result
        public var ERR: ERR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1: FIFO results are right-shifted to be one byte in size. Enables DMA to byte buffers.
        public var SHIFT: SHIFT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1: write result to the FIFO after each conversion.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum THRESH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 28
        }

        public enum LEVEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum OVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum UNDER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum FULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum EMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum DREQ_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum ERR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SHIFT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FCS_Descriptor

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
                public var THRESH: UInt32 {
                @inlinable @inline(__always) get {
                    THRESH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    THRESH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var LEVEL: UInt32 {
                @inlinable @inline(__always) get {
                  LEVEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LEVEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OVER: UInt32 {
                @inlinable @inline(__always) get {
                  OVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var UNDER: UInt32 {
                @inlinable @inline(__always) get {
                  UNDER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  UNDER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FULL: UInt32 {
                @inlinable @inline(__always) get {
                  FULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  EMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DREQ_EN: UInt32 {
                @inlinable @inline(__always) get {
                  DREQ_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DREQ_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ERR: UInt32 {
                @inlinable @inline(__always) get {
                  ERR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERR_Field.insert(newValue, into: &self.storage)
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
              public var EN: UInt32 {
                @inlinable @inline(__always) get {
                  EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = FCS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var THRESH: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(THRESH_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.THRESH)
                }
                }
              public var LEVEL: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LEVEL_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.LEVEL)
                }
              }
              public var OVER: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OVER_Field.self, Bool.self)
                  return Bool(storage: self.raw.OVER)
                }
              }
              public var UNDER: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(UNDER_Field.self, Bool.self)
                  return Bool(storage: self.raw.UNDER)
                }
              }
              public var FULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.FULL)
                }
              }
              public var EMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.EMPTY)
                }
              }
              public var DREQ_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DREQ_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DREQ_EN)
                }
              }
              public var ERR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERR_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERR)
                }
              }
              public var SHIFT: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SHIFT_Field.self, Bool.self)
                  return Bool(storage: self.raw.SHIFT)
                }
              }
              public var EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.EN)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = FCS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var THRESH: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(THRESH_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.THRESH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(THRESH_Field.self, BitField4.self)
                    self.raw.THRESH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var OVER: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OVER_Field.self, Bool.self)
                  return Bool(storage: self.raw.OVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OVER_Field.self, Bool.self)
                  self.raw.OVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var UNDER: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(UNDER_Field.self, Bool.self)
                  return Bool(storage: self.raw.UNDER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(UNDER_Field.self, Bool.self)
                  self.raw.UNDER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DREQ_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DREQ_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.DREQ_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DREQ_EN_Field.self, Bool.self)
                  self.raw.DREQ_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ERR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERR_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERR_Field.self, Bool.self)
                  self.raw.ERR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SHIFT: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SHIFT_Field.self, Bool.self)
                  return Bool(storage: self.raw.SHIFT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SHIFT_Field.self, Bool.self)
                  self.raw.SHIFT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
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

    /// Conversion result FIFO
    public var FIFO: Register<FIFO_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct FIFO_Descriptor {
        @available(*, unavailable)
        /// 1 if this particular sample experienced a conversion error. Remains in the same location if the sample is shifted.
        public var ERR: ERR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var VAL: VAL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ERR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum VAL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 12
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FIFO_Descriptor

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
                public var ERR: UInt32 {
                @inlinable @inline(__always) get {
                    ERR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ERR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var VAL: UInt32 {
                @inlinable @inline(__always) get {
                  VAL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  VAL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = FIFO_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var ERR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ERR_Field.self, Bool.self)
                    return Bool(storage: self.raw.ERR)
                }
                }
              public var VAL: BitField12 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(VAL_Field.self, BitField12.self)
                  return BitField12(storage: self.raw.VAL)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = FIFO_Descriptor
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

    /// Clock divider. If non-zero, CS_START_MANY will start conversions
    /// at regular intervals rather than back-to-back.
    /// The divider is reset when either of these fields are written.
    /// Total period is 1 + INT + FRAC / 256
    public var DIV: Register<DIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct DIV_Descriptor {
        @available(*, unavailable)
        /// Integer part of clock divisor.
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional part of clock divisor. First-order delta-sigma.
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
          public static let bitRange = 8 ..< 24
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DIV_Descriptor

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

                    public  typealias Value = DIV_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INT: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INT_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INT_Field.self, BitField16.self)
                    self.raw.INT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FRAC: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.FRAC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRAC_Field.self, BitField8.self)
                  self.raw.FRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Raw Interrupts
    public var INTR: Register<INTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct INTR_Descriptor {
        @available(*, unavailable)
        /// Triggered when the sample FIFO reaches a certain level.
        /// This level can be programmed via the FCS_THRESH field.
        public var FIFO: FIFO_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FIFO_Field: ContiguousBitField {
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
                public var FIFO: UInt32 {
                @inlinable @inline(__always) get {
                    FIFO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FIFO_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var FIFO: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FIFO_Field.self, Bool.self)
                    return Bool(storage: self.raw.FIFO)
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
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct INTE_Descriptor {
        @available(*, unavailable)
        /// Triggered when the sample FIFO reaches a certain level.
        /// This level can be programmed via the FCS_THRESH field.
        public var FIFO: FIFO_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FIFO_Field: ContiguousBitField {
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
                public var FIFO: UInt32 {
                @inlinable @inline(__always) get {
                    FIFO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FIFO_Field.insert(newValue, into: &self.storage)
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
                public var FIFO: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FIFO_Field.self, Bool.self)
                    return Bool(storage: self.raw.FIFO)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FIFO_Field.self, Bool.self)
                    self.raw.FIFO = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt Force
    public var INTF: Register<INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct INTF_Descriptor {
        @available(*, unavailable)
        /// Triggered when the sample FIFO reaches a certain level.
        /// This level can be programmed via the FCS_THRESH field.
        public var FIFO: FIFO_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FIFO_Field: ContiguousBitField {
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
                public var FIFO: UInt32 {
                @inlinable @inline(__always) get {
                    FIFO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FIFO_Field.insert(newValue, into: &self.storage)
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
                public var FIFO: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FIFO_Field.self, Bool.self)
                    return Bool(storage: self.raw.FIFO)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FIFO_Field.self, Bool.self)
                    self.raw.FIFO = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt status after masking & forcing
    public var INTS: Register<INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct INTS_Descriptor {
        @available(*, unavailable)
        /// Triggered when the sample FIFO reaches a certain level.
        /// This level can be programmed via the FCS_THRESH field.
        public var FIFO: FIFO_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FIFO_Field: ContiguousBitField {
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
                public var FIFO: UInt32 {
                @inlinable @inline(__always) get {
                    FIFO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FIFO_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var FIFO: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FIFO_Field.self, Bool.self)
                    return Bool(storage: self.raw.FIFO)
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

extension ADC.CS_Descriptor: RegisterValue {
}

extension ADC.RESULT_Descriptor: RegisterValue {
}

extension ADC.FCS_Descriptor: RegisterValue {
}

extension ADC.FIFO_Descriptor: RegisterValue {
}

extension ADC.DIV_Descriptor: RegisterValue {
}

extension ADC.INTR_Descriptor: RegisterValue {
}

extension ADC.INTE_Descriptor: RegisterValue {
}

extension ADC.INTF_Descriptor: RegisterValue {
}

extension ADC.INTS_Descriptor: RegisterValue {
}
