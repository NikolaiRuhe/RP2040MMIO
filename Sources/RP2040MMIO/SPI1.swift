import MMIO
import MMIOExtensions
public struct SPI1 {

    public static var `default`: Self { .init(unsafeAddress: 0x40040000) }

    /// Control register 0, SSPCR0 on page 3-4
    public var SSPCR0: Register<SSPCR0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct SSPCR0_Descriptor {
        @available(*, unavailable)
        /// Serial clock rate. The value SCR is used to generate the transmit and receive bit rate of the PrimeCell SSP. The bit rate is: F SSPCLK CPSDVSR x (1+SCR) where CPSDVSR is an even value from 2-254, programmed through the SSPCPSR register and SCR is a value from 0-255.
        public var SCR: SCR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// SSPCLKOUT phase, applicable to Motorola SPI frame format only. See Motorola SPI frame format on page 2-10.
        public var SPH: SPH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// SSPCLKOUT polarity, applicable to Motorola SPI frame format only. See Motorola SPI frame format on page 2-10.
        public var SPO: SPO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Frame format: 00 Motorola SPI frame format. 01 TI synchronous serial frame format. 10 National Microwire frame format. 11 Reserved, undefined operation.
        public var FRF: FRF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Data Size Select: 0000 Reserved, undefined operation. 0001 Reserved, undefined operation. 0010 Reserved, undefined operation. 0011 4-bit data. 0100 5-bit data. 0101 6-bit data. 0110 7-bit data. 0111 8-bit data. 1000 9-bit data. 1001 10-bit data. 1010 11-bit data. 1011 12-bit data. 1100 13-bit data. 1101 14-bit data. 1110 15-bit data. 1111 16-bit data.
        public var DSS: DSS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SCR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 16
        }

        public enum SPH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum SPO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum FRF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum DSS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPCR0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SCR: UInt32 {
                @inlinable @inline(__always) get {
                    SCR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SCR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SPH: UInt32 {
                @inlinable @inline(__always) get {
                  SPH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SPH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SPO: UInt32 {
                @inlinable @inline(__always) get {
                  SPO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SPO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FRF: UInt32 {
                @inlinable @inline(__always) get {
                  FRF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FRF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DSS: UInt32 {
                @inlinable @inline(__always) get {
                  DSS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DSS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SSPCR0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SCR: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SCR_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.SCR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SCR_Field.self, BitField8.self)
                    self.raw.SCR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SPH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SPH_Field.self, Bool.self)
                  return Bool(storage: self.raw.SPH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SPH_Field.self, Bool.self)
                  self.raw.SPH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SPO: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SPO_Field.self, Bool.self)
                  return Bool(storage: self.raw.SPO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SPO_Field.self, Bool.self)
                  self.raw.SPO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FRF: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FRF_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.FRF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FRF_Field.self, BitField2.self)
                  self.raw.FRF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DSS: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DSS_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.DSS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DSS_Field.self, BitField4.self)
                  self.raw.DSS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Control register 1, SSPCR1 on page 3-5
    public var SSPCR1: Register<SSPCR1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct SSPCR1_Descriptor {
        @available(*, unavailable)
        /// Slave-mode output disable. This bit is relevant only in the slave mode, MS=1. In multiple-slave systems, it is possible for an PrimeCell SSP master to broadcast a message to all slaves in the system while ensuring that only one slave drives data onto its serial output line. In such systems the RXD lines from multiple slaves could be tied together. To operate in such systems, the SOD bit can be set if the PrimeCell SSP slave is not supposed to drive the SSPTXD line: 0 SSP can drive the SSPTXD output in slave mode. 1 SSP must not drive the SSPTXD output in slave mode.
        public var SOD: SOD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Master or slave mode select. This bit can be modified only when the PrimeCell SSP is disabled, SSE=0: 0 Device configured as master, default. 1 Device configured as slave.
        public var MS: MS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Synchronous serial port enable: 0 SSP operation disabled. 1 SSP operation enabled.
        public var SSE: SSE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Loop back mode: 0 Normal serial port operation enabled. 1 Output of transmit serial shifter is connected to input of receive serial shifter internally.
        public var LBM: LBM_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SOD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum MS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SSE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum LBM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPCR1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SOD: UInt32 {
                @inlinable @inline(__always) get {
                    SOD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SOD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var MS: UInt32 {
                @inlinable @inline(__always) get {
                  MS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SSE: UInt32 {
                @inlinable @inline(__always) get {
                  SSE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SSE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var LBM: UInt32 {
                @inlinable @inline(__always) get {
                  LBM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LBM_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SSPCR1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SOD: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SOD_Field.self, Bool.self)
                    return Bool(storage: self.raw.SOD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SOD_Field.self, Bool.self)
                    self.raw.SOD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var MS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MS_Field.self, Bool.self)
                  return Bool(storage: self.raw.MS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MS_Field.self, Bool.self)
                  self.raw.MS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SSE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SSE_Field.self, Bool.self)
                  return Bool(storage: self.raw.SSE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SSE_Field.self, Bool.self)
                  self.raw.SSE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LBM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LBM_Field.self, Bool.self)
                  return Bool(storage: self.raw.LBM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LBM_Field.self, Bool.self)
                  self.raw.LBM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Data register, SSPDR on page 3-6
    public var SSPDR: Register<SSPDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct SSPDR_Descriptor {
        @available(*, unavailable)
        /// Transmit/Receive FIFO: Read Receive FIFO. Write Transmit FIFO. You must right-justify data when the PrimeCell SSP is programmed for a data size that is less than 16 bits. Unused bits at the top are ignored by transmit logic. The receive logic automatically right-justifies.
        public var DATA: DATA_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DATA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPDR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DATA: UInt32 {
                @inlinable @inline(__always) get {
                    DATA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DATA_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SSPDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DATA: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DATA_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.DATA)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DATA_Field.self, BitField16.self)
                    self.raw.DATA = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Status register, SSPSR on page 3-7
    public var SSPSR: Register<SSPSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct SSPSR_Descriptor {
        @available(*, unavailable)
        /// PrimeCell SSP busy flag, RO: 0 SSP is idle. 1 SSP is currently transmitting and/or receiving a frame or the transmit FIFO is not empty.
        public var BSY: BSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO full, RO: 0 Receive FIFO is not full. 1 Receive FIFO is full.
        public var RFF: RFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO not empty, RO: 0 Receive FIFO is empty. 1 Receive FIFO is not empty.
        public var RNE: RNE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO not full, RO: 0 Transmit FIFO is full. 1 Transmit FIFO is not full.
        public var TNF: TNF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO empty, RO: 0 Transmit FIFO is not empty. 1 Transmit FIFO is empty.
        public var TFE: TFE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum BSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum RFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum RNE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum TNF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum TFE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPSR_Descriptor

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
                public var BSY: UInt32 {
                @inlinable @inline(__always) get {
                    BSY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    BSY_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RFF: UInt32 {
                @inlinable @inline(__always) get {
                  RFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RNE: UInt32 {
                @inlinable @inline(__always) get {
                  RNE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RNE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TNF: UInt32 {
                @inlinable @inline(__always) get {
                  TNF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TNF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TFE: UInt32 {
                @inlinable @inline(__always) get {
                  TFE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TFE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPSR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var BSY: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(BSY_Field.self, Bool.self)
                    return Bool(storage: self.raw.BSY)
                }
                }
              public var RFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.RFF)
                }
              }
              public var RNE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RNE_Field.self, Bool.self)
                  return Bool(storage: self.raw.RNE)
                }
              }
              public var TNF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TNF_Field.self, Bool.self)
                  return Bool(storage: self.raw.TNF)
                }
              }
              public var TFE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TFE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TFE)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPSR_Descriptor
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

    /// Clock prescale register, SSPCPSR on page 3-8
    public var SSPCPSR: Register<SSPCPSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct SSPCPSR_Descriptor {
        @available(*, unavailable)
        /// Clock prescale divisor. Must be an even number from 2-254, depending on the frequency of SSPCLK. The least significant bit always returns zero on reads.
        public var CPSDVSR: CPSDVSR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CPSDVSR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPCPSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CPSDVSR: UInt32 {
                @inlinable @inline(__always) get {
                    CPSDVSR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CPSDVSR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SSPCPSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CPSDVSR: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CPSDVSR_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.CPSDVSR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CPSDVSR_Field.self, BitField8.self)
                    self.raw.CPSDVSR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt mask set or clear register, SSPIMSC on page 3-9
    public var SSPIMSC: Register<SSPIMSC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct SSPIMSC_Descriptor {
        @available(*, unavailable)
        /// Transmit FIFO interrupt mask: 0 Transmit FIFO half empty or less condition interrupt is masked. 1 Transmit FIFO half empty or less condition interrupt is not masked.
        public var TXIM: TXIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO interrupt mask: 0 Receive FIFO half full or less condition interrupt is masked. 1 Receive FIFO half full or less condition interrupt is not masked.
        public var RXIM: RXIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive timeout interrupt mask: 0 Receive FIFO not empty and no read prior to timeout period interrupt is masked. 1 Receive FIFO not empty and no read prior to timeout period interrupt is not masked.
        public var RTIM: RTIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive overrun interrupt mask: 0 Receive FIFO written to while full condition interrupt is masked. 1 Receive FIFO written to while full condition interrupt is not masked.
        public var RORIM: RORIM_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TXIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum RXIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum RTIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RORIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPIMSC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TXIM: UInt32 {
                @inlinable @inline(__always) get {
                    TXIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TXIM_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RXIM: UInt32 {
                @inlinable @inline(__always) get {
                  RXIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RTIM: UInt32 {
                @inlinable @inline(__always) get {
                  RTIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RTIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RORIM: UInt32 {
                @inlinable @inline(__always) get {
                  RORIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RORIM_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SSPIMSC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TXIM: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TXIM_Field.self, Bool.self)
                    return Bool(storage: self.raw.TXIM)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TXIM_Field.self, Bool.self)
                    self.raw.TXIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var RXIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RXIM_Field.self, Bool.self)
                  self.raw.RXIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RTIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RTIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.RTIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RTIM_Field.self, Bool.self)
                  self.raw.RTIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RORIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RORIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.RORIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RORIM_Field.self, Bool.self)
                  self.raw.RORIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Raw interrupt status register, SSPRIS on page 3-10
    public var SSPRIS: Register<SSPRIS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct SSPRIS_Descriptor {
        @available(*, unavailable)
        /// Gives the raw interrupt state, prior to masking, of the SSPTXINTR interrupt
        public var TXRIS: TXRIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Gives the raw interrupt state, prior to masking, of the SSPRXINTR interrupt
        public var RXRIS: RXRIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Gives the raw interrupt state, prior to masking, of the SSPRTINTR interrupt
        public var RTRIS: RTRIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Gives the raw interrupt state, prior to masking, of the SSPRORINTR interrupt
        public var RORRIS: RORRIS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TXRIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum RXRIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum RTRIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RORRIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPRIS_Descriptor

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
                public var TXRIS: UInt32 {
                @inlinable @inline(__always) get {
                    TXRIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TXRIS_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RXRIS: UInt32 {
                @inlinable @inline(__always) get {
                  RXRIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXRIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RTRIS: UInt32 {
                @inlinable @inline(__always) get {
                  RTRIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RTRIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RORRIS: UInt32 {
                @inlinable @inline(__always) get {
                  RORRIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RORRIS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPRIS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var TXRIS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TXRIS_Field.self, Bool.self)
                    return Bool(storage: self.raw.TXRIS)
                }
                }
              public var RXRIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXRIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXRIS)
                }
              }
              public var RTRIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RTRIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RTRIS)
                }
              }
              public var RORRIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RORRIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RORRIS)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPRIS_Descriptor
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

    /// Masked interrupt status register, SSPMIS on page 3-11
    public var SSPMIS: Register<SSPMIS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct SSPMIS_Descriptor {
        @available(*, unavailable)
        /// Gives the transmit FIFO masked interrupt state, after masking, of the SSPTXINTR interrupt
        public var TXMIS: TXMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Gives the receive FIFO masked interrupt state, after masking, of the SSPRXINTR interrupt
        public var RXMIS: RXMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Gives the receive timeout masked interrupt state, after masking, of the SSPRTINTR interrupt
        public var RTMIS: RTMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Gives the receive over run masked interrupt status, after masking, of the SSPRORINTR interrupt
        public var RORMIS: RORMIS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TXMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum RXMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum RTMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RORMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPMIS_Descriptor

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
                public var TXMIS: UInt32 {
                @inlinable @inline(__always) get {
                    TXMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TXMIS_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RXMIS: UInt32 {
                @inlinable @inline(__always) get {
                  RXMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXMIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RTMIS: UInt32 {
                @inlinable @inline(__always) get {
                  RTMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RTMIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RORMIS: UInt32 {
                @inlinable @inline(__always) get {
                  RORMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RORMIS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPMIS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var TXMIS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TXMIS_Field.self, Bool.self)
                    return Bool(storage: self.raw.TXMIS)
                }
                }
              public var RXMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXMIS)
                }
              }
              public var RTMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RTMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RTMIS)
                }
              }
              public var RORMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RORMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RORMIS)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPMIS_Descriptor
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

    /// Interrupt clear register, SSPICR on page 3-11
    public var SSPICR: Register<SSPICR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct SSPICR_Descriptor {
        @available(*, unavailable)
        /// Clears the SSPRTINTR interrupt
        public var RTIC: RTIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Clears the SSPRORINTR interrupt
        public var RORIC: RORIC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RTIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RORIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPICR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var RTIC: UInt32 {
                @inlinable @inline(__always) get {
                    RTIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RTIC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RORIC: UInt32 {
                @inlinable @inline(__always) get {
                  RORIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RORIC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SSPICR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var RTIC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RTIC_Field.self, Bool.self)
                    return Bool(storage: self.raw.RTIC)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RTIC_Field.self, Bool.self)
                    self.raw.RTIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var RORIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RORIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.RORIC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RORIC_Field.self, Bool.self)
                  self.raw.RORIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// DMA control register, SSPDMACR on page 3-12
    public var SSPDMACR: Register<SSPDMACR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct SSPDMACR_Descriptor {
        @available(*, unavailable)
        /// Transmit DMA Enable. If this bit is set to 1, DMA for the transmit FIFO is enabled.
        public var TXDMAE: TXDMAE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive DMA Enable. If this bit is set to 1, DMA for the receive FIFO is enabled.
        public var RXDMAE: RXDMAE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TXDMAE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RXDMAE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPDMACR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TXDMAE: UInt32 {
                @inlinable @inline(__always) get {
                    TXDMAE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TXDMAE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RXDMAE: UInt32 {
                @inlinable @inline(__always) get {
                  RXDMAE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXDMAE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SSPDMACR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TXDMAE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TXDMAE_Field.self, Bool.self)
                    return Bool(storage: self.raw.TXDMAE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TXDMAE_Field.self, Bool.self)
                    self.raw.TXDMAE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var RXDMAE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXDMAE_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXDMAE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RXDMAE_Field.self, Bool.self)
                  self.raw.RXDMAE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    public var SSPPERIPHID0: Register<SSPPERIPHID0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe0))
          #endif
        }
    }
    public struct SSPPERIPHID0_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0x22
        public var PARTNUMBER0: PARTNUMBER0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum PARTNUMBER0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPPERIPHID0_Descriptor

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
                public var PARTNUMBER0: UInt32 {
                @inlinable @inline(__always) get {
                    PARTNUMBER0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    PARTNUMBER0_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPPERIPHID0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var PARTNUMBER0: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(PARTNUMBER0_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.PARTNUMBER0)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPPERIPHID0_Descriptor
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

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    public var SSPPERIPHID1: Register<SSPPERIPHID1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe4))
          #endif
        }
    }
    public struct SSPPERIPHID1_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0x1
        public var DESIGNER0: DESIGNER0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// These bits read back as 0x0
        public var PARTNUMBER1: PARTNUMBER1_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DESIGNER0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 8
        }

        public enum PARTNUMBER1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPPERIPHID1_Descriptor

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
                public var DESIGNER0: UInt32 {
                @inlinable @inline(__always) get {
                    DESIGNER0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DESIGNER0_Field.insert(newValue, into: &self.storage)
                }
                }
              public var PARTNUMBER1: UInt32 {
                @inlinable @inline(__always) get {
                  PARTNUMBER1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PARTNUMBER1_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPPERIPHID1_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var DESIGNER0: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DESIGNER0_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.DESIGNER0)
                }
                }
              public var PARTNUMBER1: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PARTNUMBER1_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.PARTNUMBER1)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPPERIPHID1_Descriptor
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

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    public var SSPPERIPHID2: Register<SSPPERIPHID2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe8))
          #endif
        }
    }
    public struct SSPPERIPHID2_Descriptor {
        @available(*, unavailable)
        /// These bits return the peripheral revision
        public var REVISION: REVISION_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// These bits read back as 0x4
        public var DESIGNER1: DESIGNER1_Field {
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
          public static let bitRange = 4 ..< 8
        }

        public enum DESIGNER1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPPERIPHID2_Descriptor

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
              public var DESIGNER1: UInt32 {
                @inlinable @inline(__always) get {
                  DESIGNER1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DESIGNER1_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPPERIPHID2_Descriptor
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
              public var DESIGNER1: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DESIGNER1_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.DESIGNER1)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPPERIPHID2_Descriptor
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

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    public var SSPPERIPHID3: Register<SSPPERIPHID3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0fec), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0fec))
          #endif
        }
    }
    public struct SSPPERIPHID3_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0x00
        public var CONFIGURATION: CONFIGURATION_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CONFIGURATION_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPPERIPHID3_Descriptor

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
                public var CONFIGURATION: UInt32 {
                @inlinable @inline(__always) get {
                    CONFIGURATION_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CONFIGURATION_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPPERIPHID3_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CONFIGURATION: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CONFIGURATION_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.CONFIGURATION)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPPERIPHID3_Descriptor
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

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    public var SSPPCELLID0: Register<SSPPCELLID0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff0))
          #endif
        }
    }
    public struct SSPPCELLID0_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0x0D
        public var SSPPCELLID0: SSPPCELLID0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SSPPCELLID0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPPCELLID0_Descriptor

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
                public var SSPPCELLID0: UInt32 {
                @inlinable @inline(__always) get {
                    SSPPCELLID0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SSPPCELLID0_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPPCELLID0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SSPPCELLID0: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SSPPCELLID0_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.SSPPCELLID0)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPPCELLID0_Descriptor
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

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    public var SSPPCELLID1: Register<SSPPCELLID1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff4))
          #endif
        }
    }
    public struct SSPPCELLID1_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0xF0
        public var SSPPCELLID1: SSPPCELLID1_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SSPPCELLID1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPPCELLID1_Descriptor

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
                public var SSPPCELLID1: UInt32 {
                @inlinable @inline(__always) get {
                    SSPPCELLID1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SSPPCELLID1_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPPCELLID1_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SSPPCELLID1: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SSPPCELLID1_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.SSPPCELLID1)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPPCELLID1_Descriptor
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

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    public var SSPPCELLID2: Register<SSPPCELLID2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff8))
          #endif
        }
    }
    public struct SSPPCELLID2_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0x05
        public var SSPPCELLID2: SSPPCELLID2_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SSPPCELLID2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPPCELLID2_Descriptor

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
                public var SSPPCELLID2: UInt32 {
                @inlinable @inline(__always) get {
                    SSPPCELLID2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SSPPCELLID2_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPPCELLID2_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SSPPCELLID2: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SSPPCELLID2_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.SSPPCELLID2)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPPCELLID2_Descriptor
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

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    public var SSPPCELLID3: Register<SSPPCELLID3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0ffc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0ffc))
          #endif
        }
    }
    public struct SSPPCELLID3_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0xB1
        public var SSPPCELLID3: SSPPCELLID3_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SSPPCELLID3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSPPCELLID3_Descriptor

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
                public var SSPPCELLID3: UInt32 {
                @inlinable @inline(__always) get {
                    SSPPCELLID3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SSPPCELLID3_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSPPCELLID3_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SSPPCELLID3: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SSPPCELLID3_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.SSPPCELLID3)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSPPCELLID3_Descriptor
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

extension SPI1.SSPCR0_Descriptor: RegisterValue {
}

extension SPI1.SSPCR1_Descriptor: RegisterValue {
}

extension SPI1.SSPDR_Descriptor: RegisterValue {
}

extension SPI1.SSPSR_Descriptor: RegisterValue {
}

extension SPI1.SSPCPSR_Descriptor: RegisterValue {
}

extension SPI1.SSPIMSC_Descriptor: RegisterValue {
}

extension SPI1.SSPRIS_Descriptor: RegisterValue {
}

extension SPI1.SSPMIS_Descriptor: RegisterValue {
}

extension SPI1.SSPICR_Descriptor: RegisterValue {
}

extension SPI1.SSPDMACR_Descriptor: RegisterValue {
}

extension SPI1.SSPPERIPHID0_Descriptor: RegisterValue {
}

extension SPI1.SSPPERIPHID1_Descriptor: RegisterValue {
}

extension SPI1.SSPPERIPHID2_Descriptor: RegisterValue {
}

extension SPI1.SSPPERIPHID3_Descriptor: RegisterValue {
}

extension SPI1.SSPPCELLID0_Descriptor: RegisterValue {
}

extension SPI1.SSPPCELLID1_Descriptor: RegisterValue {
}

extension SPI1.SSPPCELLID2_Descriptor: RegisterValue {
}

extension SPI1.SSPPCELLID3_Descriptor: RegisterValue {
}
