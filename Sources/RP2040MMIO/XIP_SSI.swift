import MMIO
import MMIOExtensions

/// DW_apb_ssi has the following features:
/// * APB interface - Allows for easy integration into a DesignWare Synthesizable Components for AMBA 2 implementation.
/// * APB3 and APB4 protocol support.
/// * Scalable APB data bus width - Supports APB data bus widths of 8, 16, and 32 bits.
/// * Serial-master or serial-slave operation - Enables serial communication with serial-master or serial-slave peripheral devices.
/// * Programmable Dual/Quad/Octal SPI support in Master Mode.
/// * Dual Data Rate (DDR) and Read Data Strobe (RDS) Support - Enables the DW_apb_ssi master to perform operations with the device in DDR and RDS modes when working in Dual/Quad/Octal mode of operation.
/// * Data Mask Support - Enables the DW_apb_ssi to selectively update the bytes in the device. This feature is applicable only in enhanced SPI modes.
/// * eXecute-In-Place (XIP) support - Enables the DW_apb_ssi master to behave as a memory mapped I/O and fetches the data from the device based on the APB read request. This feature is applicable only in enhanced SPI modes.
/// * DMA Controller Interface - Enables the DW_apb_ssi to interface to a DMA controller over the bus using a handshaking interface for transfer requests.
/// * Independent masking of interrupts - Master collision, transmit FIFO overflow, transmit FIFO empty, receive FIFO full, receive FIFO underflow, and receive FIFO overflow interrupts can all be masked independently.
/// * Multi-master contention detection - Informs the processor of multiple serial-master accesses on the serial bus.
/// * Bypass of meta-stability flip-flops for synchronous clocks - When the APB clock (pclk) and the DW_apb_ssi serial clock (ssi_clk) are synchronous, meta-stable flip-flops are not used when transferring control signals across these clock domains.
/// * Programmable delay on the sample time of the received serial data bit (rxd); enables programmable control of routing delays resulting in higher serial data-bit rates.
/// * Programmable features:
/// - Serial interface operation - Choice of Motorola SPI, Texas Instruments Synchronous Serial Protocol or National Semiconductor Microwire.
/// - Clock bit-rate - Dynamic control of the serial bit rate of the data transfer; used in only serial-master mode of operation.
/// - Data Item size (4 to 32 bits) - Item size of each data transfer under the control of the programmer.
/// * Configured features:
/// - FIFO depth - 16 words deep. The FIFO width is fixed at 32 bits.
/// - 1 slave select output.
/// - Hardware slave-select - Dedicated hardware slave-select line.
/// - Combined interrupt line - one combined interrupt line from the DW_apb_ssi to the interrupt controller.
/// - Interrupt polarity - active high interrupt lines.
/// - Serial clock polarity - low serial-clock polarity directly after reset.
/// - Serial clock phase - capture on first edge of serial-clock directly after reset.
public struct XIP_SSI {

    public static var `default`: Self { .init(unsafeAddress: 0x18000000) }

    /// Control register 0
    public var CTRLR0: Register<CTRLR0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CTRLR0_Descriptor {
        @available(*, unavailable)
        /// Slave select toggle enable
        public var SSTE: SSTE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// SPI frame format
        public var SPI_FRF: SPI_FRF_Field {
            get {
                fatalError()
            }
        }

        public enum SPI_FRF_Values: UInt, BitFieldProjectable {
            /// Standard 1-bit SPI frame format; 1 bit per SCK, full-duplex
            case SPI_FRF_STD = 0
            /// Dual-SPI frame format; two bits per SCK, half-duplex
            case SPI_FRF_DUAL = 1
            /// Quad-SPI frame format; four bits per SCK, half-duplex
            case SPI_FRF_QUAD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Data frame size in 32b transfer mode
        /// Value of n -> n+1 clocks per frame.
        public var DFS_32: DFS_32_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Control frame size
        /// Value of n -> n+1 clocks per frame.
        public var CFS: CFS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Shift register loop (test mode)
        public var SRL: SRL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Slave output enable
        public var SLV_OE: SLV_OE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transfer mode
        public var TMOD: TMOD_Field {
            get {
                fatalError()
            }
        }

        public enum TMOD_Values: UInt, BitFieldProjectable {
            /// Both transmit and receive
            case TMOD_TX_AND_RX = 0
            /// Transmit only (not for FRF == 0, standard SPI mode)
            case TMOD_TX_ONLY = 1
            /// Receive only (not for FRF == 0, standard SPI mode)
            case TMOD_RX_ONLY = 2
            /// EEPROM read mode (TX then RX; RX starts after control data TX'd)
            case TMOD_EEPROM_READ = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Serial clock polarity
        public var SCPOL: SCPOL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Serial clock phase
        public var SCPH: SCPH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Frame format
        public var FRF: FRF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Data frame size
        public var DFS: DFS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SSTE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SPI_FRF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 23
        }

        public enum DFS_32_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 21
        }

        public enum CFS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 16
        }

        public enum SRL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum SLV_OE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum TMOD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public enum SCPOL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum SCPH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum FRF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 6
        }

        public enum DFS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CTRLR0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SSTE: UInt32 {
                @inlinable @inline(__always) get {
                    SSTE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SSTE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SPI_FRF: UInt32 {
                @inlinable @inline(__always) get {
                  SPI_FRF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SPI_FRF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DFS_32: UInt32 {
                @inlinable @inline(__always) get {
                  DFS_32_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DFS_32_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CFS: UInt32 {
                @inlinable @inline(__always) get {
                  CFS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CFS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SRL: UInt32 {
                @inlinable @inline(__always) get {
                  SRL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SRL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SLV_OE: UInt32 {
                @inlinable @inline(__always) get {
                  SLV_OE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLV_OE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TMOD: UInt32 {
                @inlinable @inline(__always) get {
                  TMOD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TMOD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SCPOL: UInt32 {
                @inlinable @inline(__always) get {
                  SCPOL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SCPOL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SCPH: UInt32 {
                @inlinable @inline(__always) get {
                  SCPH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SCPH_Field.insert(newValue, into: &self.storage)
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
              public var DFS: UInt32 {
                @inlinable @inline(__always) get {
                  DFS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DFS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CTRLR0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SSTE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SSTE_Field.self, Bool.self)
                    return Bool(storage: self.raw.SSTE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SSTE_Field.self, Bool.self)
                    self.raw.SSTE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SPI_FRF: SPI_FRF_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SPI_FRF_Field.self, SPI_FRF_Values.self)
                  return SPI_FRF_Values(storage: self.raw.SPI_FRF)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SPI_FRF_Field.self, SPI_FRF_Values.self)
                  self.raw.SPI_FRF = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DFS_32: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DFS_32_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.DFS_32)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DFS_32_Field.self, BitField5.self)
                  self.raw.DFS_32 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CFS: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CFS_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CFS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CFS_Field.self, BitField4.self)
                  self.raw.CFS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SRL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SRL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SRL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SRL_Field.self, Bool.self)
                  self.raw.SRL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SLV_OE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLV_OE_Field.self, Bool.self)
                  return Bool(storage: self.raw.SLV_OE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SLV_OE_Field.self, Bool.self)
                  self.raw.SLV_OE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TMOD: TMOD_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TMOD_Field.self, TMOD_Values.self)
                  return TMOD_Values(storage: self.raw.TMOD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TMOD_Field.self, TMOD_Values.self)
                  self.raw.TMOD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SCPOL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SCPOL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SCPOL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SCPOL_Field.self, Bool.self)
                  self.raw.SCPOL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SCPH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SCPH_Field.self, Bool.self)
                  return Bool(storage: self.raw.SCPH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SCPH_Field.self, Bool.self)
                  self.raw.SCPH = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var DFS: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DFS_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.DFS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DFS_Field.self, BitField4.self)
                  self.raw.DFS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Master Control register 1
    public var CTRLR1: Register<CTRLR1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct CTRLR1_Descriptor {
        @available(*, unavailable)
        /// Number of data frames
        public var NDF: NDF_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NDF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CTRLR1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var NDF: UInt32 {
                @inlinable @inline(__always) get {
                    NDF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NDF_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CTRLR1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var NDF: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NDF_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.NDF)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(NDF_Field.self, BitField16.self)
                    self.raw.NDF = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// SSI Enable
    public var SSIENR: Register<SSIENR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct SSIENR_Descriptor {
        @available(*, unavailable)
        /// SSI enable
        public var SSI_EN: SSI_EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SSI_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSIENR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SSI_EN: UInt32 {
                @inlinable @inline(__always) get {
                    SSI_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SSI_EN_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SSIENR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SSI_EN: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SSI_EN_Field.self, Bool.self)
                    return Bool(storage: self.raw.SSI_EN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SSI_EN_Field.self, Bool.self)
                    self.raw.SSI_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Microwire Control
    public var MWCR: Register<MWCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct MWCR_Descriptor {
        @available(*, unavailable)
        /// Microwire handshaking
        public var MHS: MHS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Microwire control
        public var MDD: MDD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Microwire transfer mode
        public var MWMOD: MWMOD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum MHS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum MDD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum MWMOD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = MWCR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var MHS: UInt32 {
                @inlinable @inline(__always) get {
                    MHS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    MHS_Field.insert(newValue, into: &self.storage)
                }
                }
              public var MDD: UInt32 {
                @inlinable @inline(__always) get {
                  MDD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MDD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MWMOD: UInt32 {
                @inlinable @inline(__always) get {
                  MWMOD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MWMOD_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = MWCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var MHS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(MHS_Field.self, Bool.self)
                    return Bool(storage: self.raw.MHS)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(MHS_Field.self, Bool.self)
                    self.raw.MHS = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var MDD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MDD_Field.self, Bool.self)
                  return Bool(storage: self.raw.MDD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MDD_Field.self, Bool.self)
                  self.raw.MDD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MWMOD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MWMOD_Field.self, Bool.self)
                  return Bool(storage: self.raw.MWMOD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MWMOD_Field.self, Bool.self)
                  self.raw.MWMOD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Slave enable
    public var SER: Register<SER_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct SER_Descriptor {
        @available(*, unavailable)
        /// For each bit:
        /// 0 -> slave not selected
        /// 1 -> slave selected
        public var SER: SER_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SER_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SER: UInt32 {
                @inlinable @inline(__always) get {
                    SER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SER_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SER_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SER: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SER_Field.self, Bool.self)
                    return Bool(storage: self.raw.SER)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SER_Field.self, Bool.self)
                    self.raw.SER = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Baud rate
    public var BAUDR: Register<BAUDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct BAUDR_Descriptor {
        @available(*, unavailable)
        /// SSI clock divider
        public var SCKDV: SCKDV_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SCKDV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = BAUDR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SCKDV: UInt32 {
                @inlinable @inline(__always) get {
                    SCKDV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SCKDV_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = BAUDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SCKDV: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SCKDV_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.SCKDV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SCKDV_Field.self, BitField16.self)
                    self.raw.SCKDV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// TX FIFO threshold level
    public var TXFTLR: Register<TXFTLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct TXFTLR_Descriptor {
        @available(*, unavailable)
        /// Transmit FIFO threshold
        public var TFT: TFT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TFT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TXFTLR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TFT: UInt32 {
                @inlinable @inline(__always) get {
                    TFT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TFT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = TXFTLR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TFT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TFT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.TFT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TFT_Field.self, BitField8.self)
                    self.raw.TFT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// RX FIFO threshold level
    public var RXFTLR: Register<RXFTLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct RXFTLR_Descriptor {
        @available(*, unavailable)
        /// Receive FIFO threshold
        public var RFT: RFT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RFT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RXFTLR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var RFT: UInt32 {
                @inlinable @inline(__always) get {
                    RFT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RFT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = RXFTLR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var RFT: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RFT_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.RFT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RFT_Field.self, BitField8.self)
                    self.raw.RFT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// TX FIFO level
    public var TXFLR: Register<TXFLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct TXFLR_Descriptor {
        @available(*, unavailable)
        /// Transmit FIFO level
        public var TFTFL: TFTFL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TFTFL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TXFLR_Descriptor

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
                public var TFTFL: UInt32 {
                @inlinable @inline(__always) get {
                    TFTFL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TFTFL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = TXFLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var TFTFL: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TFTFL_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.TFTFL)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = TXFLR_Descriptor
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

    /// RX FIFO level
    public var RXFLR: Register<RXFLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct RXFLR_Descriptor {
        @available(*, unavailable)
        /// Receive FIFO level
        public var RXTFL: RXTFL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RXTFL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RXFLR_Descriptor

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
                public var RXTFL: UInt32 {
                @inlinable @inline(__always) get {
                    RXTFL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RXTFL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = RXFLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RXTFL: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RXTFL_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.RXTFL)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = RXFLR_Descriptor
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

    /// Status register
    public var SR: Register<SR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct SR_Descriptor {
        @available(*, unavailable)
        /// Data collision error
        public var DCOL: DCOL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmission error
        public var TXE: TXE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO full
        public var RFF: RFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO not empty
        public var RFNE: RFNE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO empty
        public var TFE: TFE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO not full
        public var TFNF: TFNF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// SSI busy flag
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DCOL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum TXE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum RFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum RFNE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum TFE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum TFNF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SR_Descriptor

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
                public var DCOL: UInt32 {
                @inlinable @inline(__always) get {
                    DCOL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DCOL_Field.insert(newValue, into: &self.storage)
                }
                }
              public var TXE: UInt32 {
                @inlinable @inline(__always) get {
                  TXE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXE_Field.insert(newValue, into: &self.storage)
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
              public var RFNE: UInt32 {
                @inlinable @inline(__always) get {
                  RFNE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RFNE_Field.insert(newValue, into: &self.storage)
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
              public var TFNF: UInt32 {
                @inlinable @inline(__always) get {
                  TFNF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TFNF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BUSY: UInt32 {
                @inlinable @inline(__always) get {
                  BUSY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BUSY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var DCOL: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DCOL_Field.self, Bool.self)
                    return Bool(storage: self.raw.DCOL)
                }
                }
              public var TXE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXE)
                }
              }
              public var RFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.RFF)
                }
              }
              public var RFNE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RFNE_Field.self, Bool.self)
                  return Bool(storage: self.raw.RFNE)
                }
              }
              public var TFE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TFE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TFE)
                }
              }
              public var TFNF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TFNF_Field.self, Bool.self)
                  return Bool(storage: self.raw.TFNF)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SR_Descriptor
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

    /// Interrupt mask
    public var IMR: Register<IMR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct IMR_Descriptor {
        @available(*, unavailable)
        /// Multi-master contention interrupt mask
        public var MSTIM: MSTIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO full interrupt mask
        public var RXFIM: RXFIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO overflow interrupt mask
        public var RXOIM: RXOIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO underflow interrupt mask
        public var RXUIM: RXUIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO overflow interrupt mask
        public var TXOIM: TXOIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO empty interrupt mask
        public var TXEIM: TXEIM_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum MSTIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum RXFIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum RXOIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum RXUIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum TXOIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum TXEIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IMR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var MSTIM: UInt32 {
                @inlinable @inline(__always) get {
                    MSTIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    MSTIM_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RXFIM: UInt32 {
                @inlinable @inline(__always) get {
                  RXFIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXFIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXOIM: UInt32 {
                @inlinable @inline(__always) get {
                  RXOIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXOIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXUIM: UInt32 {
                @inlinable @inline(__always) get {
                  RXUIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXUIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TXOIM: UInt32 {
                @inlinable @inline(__always) get {
                  TXOIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXOIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TXEIM: UInt32 {
                @inlinable @inline(__always) get {
                  TXEIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXEIM_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IMR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var MSTIM: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(MSTIM_Field.self, Bool.self)
                    return Bool(storage: self.raw.MSTIM)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(MSTIM_Field.self, Bool.self)
                    self.raw.MSTIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var RXFIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXFIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXFIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RXFIM_Field.self, Bool.self)
                  self.raw.RXFIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RXOIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXOIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXOIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RXOIM_Field.self, Bool.self)
                  self.raw.RXOIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RXUIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXUIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXUIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RXUIM_Field.self, Bool.self)
                  self.raw.RXUIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TXOIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXOIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXOIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TXOIM_Field.self, Bool.self)
                  self.raw.TXOIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TXEIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXEIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXEIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TXEIM_Field.self, Bool.self)
                  self.raw.TXEIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt status
    public var ISR: Register<ISR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct ISR_Descriptor {
        @available(*, unavailable)
        /// Multi-master contention interrupt status
        public var MSTIS: MSTIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO full interrupt status
        public var RXFIS: RXFIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO overflow interrupt status
        public var RXOIS: RXOIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO underflow interrupt status
        public var RXUIS: RXUIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO overflow interrupt status
        public var TXOIS: TXOIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO empty interrupt status
        public var TXEIS: TXEIS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum MSTIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum RXFIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum RXOIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum RXUIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum TXOIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum TXEIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ISR_Descriptor

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
                public var MSTIS: UInt32 {
                @inlinable @inline(__always) get {
                    MSTIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    MSTIS_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RXFIS: UInt32 {
                @inlinable @inline(__always) get {
                  RXFIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXFIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXOIS: UInt32 {
                @inlinable @inline(__always) get {
                  RXOIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXOIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXUIS: UInt32 {
                @inlinable @inline(__always) get {
                  RXUIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXUIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TXOIS: UInt32 {
                @inlinable @inline(__always) get {
                  TXOIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXOIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TXEIS: UInt32 {
                @inlinable @inline(__always) get {
                  TXEIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXEIS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = ISR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var MSTIS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(MSTIS_Field.self, Bool.self)
                    return Bool(storage: self.raw.MSTIS)
                }
                }
              public var RXFIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXFIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXFIS)
                }
              }
              public var RXOIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXOIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXOIS)
                }
              }
              public var RXUIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXUIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXUIS)
                }
              }
              public var TXOIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXOIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXOIS)
                }
              }
              public var TXEIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXEIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXEIS)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = ISR_Descriptor
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

    /// Raw interrupt status
    public var RISR: Register<RISR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct RISR_Descriptor {
        @available(*, unavailable)
        /// Multi-master contention raw interrupt status
        public var MSTIR: MSTIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO full raw interrupt status
        public var RXFIR: RXFIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO overflow raw interrupt status
        public var RXOIR: RXOIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO underflow raw interrupt status
        public var RXUIR: RXUIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO overflow raw interrupt status
        public var TXOIR: TXOIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO empty raw interrupt status
        public var TXEIR: TXEIR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum MSTIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum RXFIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum RXOIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum RXUIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum TXOIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum TXEIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RISR_Descriptor

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
                public var MSTIR: UInt32 {
                @inlinable @inline(__always) get {
                    MSTIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    MSTIR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RXFIR: UInt32 {
                @inlinable @inline(__always) get {
                  RXFIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXFIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXOIR: UInt32 {
                @inlinable @inline(__always) get {
                  RXOIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXOIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXUIR: UInt32 {
                @inlinable @inline(__always) get {
                  RXUIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXUIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TXOIR: UInt32 {
                @inlinable @inline(__always) get {
                  TXOIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXOIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TXEIR: UInt32 {
                @inlinable @inline(__always) get {
                  TXEIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXEIR_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = RISR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var MSTIR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(MSTIR_Field.self, Bool.self)
                    return Bool(storage: self.raw.MSTIR)
                }
                }
              public var RXFIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXFIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXFIR)
                }
              }
              public var RXOIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXOIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXOIR)
                }
              }
              public var RXUIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXUIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXUIR)
                }
              }
              public var TXOIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXOIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXOIR)
                }
              }
              public var TXEIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXEIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXEIR)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = RISR_Descriptor
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

    /// TX FIFO overflow interrupt clear
    public var TXOICR: Register<TXOICR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct TXOICR_Descriptor {
        @available(*, unavailable)
        /// Clear-on-read transmit FIFO overflow interrupt
        public var TXOICR: TXOICR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TXOICR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TXOICR_Descriptor

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
                public var TXOICR: UInt32 {
                @inlinable @inline(__always) get {
                    TXOICR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TXOICR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = TXOICR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var TXOICR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TXOICR_Field.self, Bool.self)
                    return Bool(storage: self.raw.TXOICR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = TXOICR_Descriptor
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

    /// RX FIFO overflow interrupt clear
    public var RXOICR: Register<RXOICR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct RXOICR_Descriptor {
        @available(*, unavailable)
        /// Clear-on-read receive FIFO overflow interrupt
        public var RXOICR: RXOICR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RXOICR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RXOICR_Descriptor

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
                public var RXOICR: UInt32 {
                @inlinable @inline(__always) get {
                    RXOICR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RXOICR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = RXOICR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RXOICR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RXOICR_Field.self, Bool.self)
                    return Bool(storage: self.raw.RXOICR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = RXOICR_Descriptor
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

    /// RX FIFO underflow interrupt clear
    public var RXUICR: Register<RXUICR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct RXUICR_Descriptor {
        @available(*, unavailable)
        /// Clear-on-read receive FIFO underflow interrupt
        public var RXUICR: RXUICR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RXUICR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RXUICR_Descriptor

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
                public var RXUICR: UInt32 {
                @inlinable @inline(__always) get {
                    RXUICR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RXUICR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = RXUICR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RXUICR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RXUICR_Field.self, Bool.self)
                    return Bool(storage: self.raw.RXUICR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = RXUICR_Descriptor
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

    /// Multi-master interrupt clear
    public var MSTICR: Register<MSTICR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct MSTICR_Descriptor {
        @available(*, unavailable)
        /// Clear-on-read multi-master contention interrupt
        public var MSTICR: MSTICR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum MSTICR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = MSTICR_Descriptor

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
                public var MSTICR: UInt32 {
                @inlinable @inline(__always) get {
                    MSTICR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    MSTICR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = MSTICR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var MSTICR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(MSTICR_Field.self, Bool.self)
                    return Bool(storage: self.raw.MSTICR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = MSTICR_Descriptor
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

    /// Interrupt clear
    public var ICR: Register<ICR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct ICR_Descriptor {
        @available(*, unavailable)
        /// Clear-on-read all active interrupts
        public var ICR: ICR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ICR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = ICR_Descriptor

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
                public var ICR: UInt32 {
                @inlinable @inline(__always) get {
                    ICR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ICR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = ICR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var ICR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ICR_Field.self, Bool.self)
                    return Bool(storage: self.raw.ICR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = ICR_Descriptor
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

    /// DMA control
    public var DMACR: Register<DMACR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x004c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x004c))
          #endif
        }
    }
    public struct DMACR_Descriptor {
        @available(*, unavailable)
        /// Transmit DMA enable
        public var TDMAE: TDMAE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive DMA enable
        public var RDMAE: RDMAE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TDMAE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RDMAE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DMACR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TDMAE: UInt32 {
                @inlinable @inline(__always) get {
                    TDMAE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TDMAE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RDMAE: UInt32 {
                @inlinable @inline(__always) get {
                  RDMAE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RDMAE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DMACR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TDMAE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TDMAE_Field.self, Bool.self)
                    return Bool(storage: self.raw.TDMAE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TDMAE_Field.self, Bool.self)
                    self.raw.TDMAE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var RDMAE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RDMAE_Field.self, Bool.self)
                  return Bool(storage: self.raw.RDMAE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RDMAE_Field.self, Bool.self)
                  self.raw.RDMAE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// DMA TX data level
    public var DMATDLR: Register<DMATDLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct DMATDLR_Descriptor {
        @available(*, unavailable)
        /// Transmit data watermark level
        public var DMATDL: DMATDL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DMATDL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DMATDLR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DMATDL: UInt32 {
                @inlinable @inline(__always) get {
                    DMATDL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DMATDL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DMATDLR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DMATDL: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DMATDL_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.DMATDL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DMATDL_Field.self, BitField8.self)
                    self.raw.DMATDL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// DMA RX data level
    public var DMARDLR: Register<DMARDLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct DMARDLR_Descriptor {
        @available(*, unavailable)
        /// Receive data watermark level (DMARDLR+1)
        public var DMARDL: DMARDL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DMARDL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DMARDLR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DMARDL: UInt32 {
                @inlinable @inline(__always) get {
                    DMARDL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DMARDL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DMARDLR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DMARDL: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DMARDL_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.DMARDL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DMARDL_Field.self, BitField8.self)
                    self.raw.DMARDL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Identification register
    public var IDR: Register<IDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0058), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0058))
          #endif
        }
    }
    public struct IDR_Descriptor {
        @available(*, unavailable)
        /// Peripheral dentification code
        public var IDCODE: IDCODE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IDCODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IDR_Descriptor

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
                public var IDCODE: UInt32 {
                @inlinable @inline(__always) get {
                    IDCODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IDCODE_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IDR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IDCODE: BitField32 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IDCODE_Field.self, BitField32.self)
                    return BitField32(storage: self.raw.IDCODE)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IDR_Descriptor
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

    /// Version ID
    public var SSI_VERSION_ID: Register<SSI_VERSION_ID_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x005c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x005c))
          #endif
        }
    }
    public struct SSI_VERSION_ID_Descriptor {
        @available(*, unavailable)
        /// SNPS component version (format X.YY)
        public var SSI_COMP_VERSION: SSI_COMP_VERSION_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SSI_COMP_VERSION_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SSI_VERSION_ID_Descriptor

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
                public var SSI_COMP_VERSION: UInt32 {
                @inlinable @inline(__always) get {
                    SSI_COMP_VERSION_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SSI_COMP_VERSION_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SSI_VERSION_ID_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SSI_COMP_VERSION: BitField32 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SSI_COMP_VERSION_Field.self, BitField32.self)
                    return BitField32(storage: self.raw.SSI_COMP_VERSION)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SSI_VERSION_ID_Descriptor
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

    /// Data Register 0 (of 36)
    public var DR0: Register<DR0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0060), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0060))
          #endif
        }
    }
    public struct DR0_Descriptor {
        @available(*, unavailable)
        /// First data register of 36
        public var DR: DR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DR0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DR: UInt32 {
                @inlinable @inline(__always) get {
                    DR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DR0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DR: BitField32 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DR_Field.self, BitField32.self)
                    return BitField32(storage: self.raw.DR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DR_Field.self, BitField32.self)
                    self.raw.DR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// RX sample delay
    public var RX_SAMPLE_DLY: Register<RX_SAMPLE_DLY_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f0))
          #endif
        }
    }
    public struct RX_SAMPLE_DLY_Descriptor {
        @available(*, unavailable)
        /// RXD sample delay (in SCLK cycles)
        public var RSD: RSD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RSD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RX_SAMPLE_DLY_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var RSD: UInt32 {
                @inlinable @inline(__always) get {
                    RSD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RSD_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = RX_SAMPLE_DLY_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var RSD: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RSD_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.RSD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RSD_Field.self, BitField8.self)
                    self.raw.RSD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// SPI control
    public var SPI_CTRLR0: Register<SPI_CTRLR0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4))
          #endif
        }
    }
    public struct SPI_CTRLR0_Descriptor {
        @available(*, unavailable)
        /// SPI Command to send in XIP mode (INST_L = 8-bit) or to append to Address (INST_L = 0-bit)
        public var XIP_CMD: XIP_CMD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Read data strobe enable
        public var SPI_RXDS_EN: SPI_RXDS_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Instruction DDR transfer enable
        public var INST_DDR_EN: INST_DDR_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// SPI DDR transfer enable
        public var SPI_DDR_EN: SPI_DDR_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Wait cycles between control frame transmit and data reception (in SCLK cycles)
        public var WAIT_CYCLES: WAIT_CYCLES_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Instruction length (0/4/8/16b)
        public var INST_L: INST_L_Field {
            get {
                fatalError()
            }
        }

        public enum INST_L_Values: UInt, BitFieldProjectable {
            /// No instruction
            case INST_L_NONE = 0
            /// 4-bit instruction
            case INST_L_4B = 1
            /// 8-bit instruction
            case INST_L_8B = 2
            /// 16-bit instruction
            case INST_L_16B = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// Address length (0b-60b in 4b increments)
        public var ADDR_L: ADDR_L_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Address and instruction transfer format
        public var TRANS_TYPE: TRANS_TYPE_Field {
            get {
                fatalError()
            }
        }

        public enum TRANS_TYPE_Values: UInt, BitFieldProjectable {
            /// Command and address both in standard SPI frame format
            case TRANS_TYPE_1C1A = 0
            /// Command in standard SPI format, address in format specified by FRF
            case TRANS_TYPE_1C2A = 1
            /// Command and address both in format specified by FRF (e.g. Dual-SPI)
            case TRANS_TYPE_2C2A = 2

            public static var bitWidth: Int { 2 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum XIP_CMD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 32
        }

        public enum SPI_RXDS_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum INST_DDR_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum SPI_DDR_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum WAIT_CYCLES_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 16
        }

        public enum INST_L_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 10
        }

        public enum ADDR_L_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 6
        }

        public enum TRANS_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 2
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SPI_CTRLR0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var XIP_CMD: UInt32 {
                @inlinable @inline(__always) get {
                    XIP_CMD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    XIP_CMD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SPI_RXDS_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SPI_RXDS_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SPI_RXDS_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INST_DDR_EN: UInt32 {
                @inlinable @inline(__always) get {
                  INST_DDR_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INST_DDR_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SPI_DDR_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SPI_DDR_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SPI_DDR_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WAIT_CYCLES: UInt32 {
                @inlinable @inline(__always) get {
                  WAIT_CYCLES_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WAIT_CYCLES_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INST_L: UInt32 {
                @inlinable @inline(__always) get {
                  INST_L_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INST_L_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADDR_L: UInt32 {
                @inlinable @inline(__always) get {
                  ADDR_L_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADDR_L_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TRANS_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                  TRANS_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TRANS_TYPE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SPI_CTRLR0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var XIP_CMD: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(XIP_CMD_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.XIP_CMD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(XIP_CMD_Field.self, BitField8.self)
                    self.raw.XIP_CMD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SPI_RXDS_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SPI_RXDS_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SPI_RXDS_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SPI_RXDS_EN_Field.self, Bool.self)
                  self.raw.SPI_RXDS_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INST_DDR_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INST_DDR_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.INST_DDR_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INST_DDR_EN_Field.self, Bool.self)
                  self.raw.INST_DDR_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SPI_DDR_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SPI_DDR_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SPI_DDR_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SPI_DDR_EN_Field.self, Bool.self)
                  self.raw.SPI_DDR_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var WAIT_CYCLES: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WAIT_CYCLES_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WAIT_CYCLES)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WAIT_CYCLES_Field.self, BitField5.self)
                  self.raw.WAIT_CYCLES = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INST_L: INST_L_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INST_L_Field.self, INST_L_Values.self)
                  return INST_L_Values(storage: self.raw.INST_L)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INST_L_Field.self, INST_L_Values.self)
                  self.raw.INST_L = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ADDR_L: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADDR_L_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.ADDR_L)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ADDR_L_Field.self, BitField4.self)
                  self.raw.ADDR_L = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TRANS_TYPE: TRANS_TYPE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TRANS_TYPE_Field.self, TRANS_TYPE_Values.self)
                  return TRANS_TYPE_Values(storage: self.raw.TRANS_TYPE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TRANS_TYPE_Field.self, TRANS_TYPE_Values.self)
                  self.raw.TRANS_TYPE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// TX drive edge
    public var TXD_DRIVE_EDGE: Register<TXD_DRIVE_EDGE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8))
          #endif
        }
    }
    public struct TXD_DRIVE_EDGE_Descriptor {
        @available(*, unavailable)
        /// TXD drive edge
        public var TDE: TDE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TDE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TXD_DRIVE_EDGE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TDE: UInt32 {
                @inlinable @inline(__always) get {
                    TDE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TDE_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = TXD_DRIVE_EDGE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TDE: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TDE_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.TDE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TDE_Field.self, BitField8.self)
                    self.raw.TDE = newValue.storage(Self.Value.Raw.Storage.self)
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

extension XIP_SSI.CTRLR0_Descriptor: RegisterValue {
}

extension XIP_SSI.CTRLR1_Descriptor: RegisterValue {
}

extension XIP_SSI.SSIENR_Descriptor: RegisterValue {
}

extension XIP_SSI.MWCR_Descriptor: RegisterValue {
}

extension XIP_SSI.SER_Descriptor: RegisterValue {
}

extension XIP_SSI.BAUDR_Descriptor: RegisterValue {
}

extension XIP_SSI.TXFTLR_Descriptor: RegisterValue {
}

extension XIP_SSI.RXFTLR_Descriptor: RegisterValue {
}

extension XIP_SSI.TXFLR_Descriptor: RegisterValue {
}

extension XIP_SSI.RXFLR_Descriptor: RegisterValue {
}

extension XIP_SSI.SR_Descriptor: RegisterValue {
}

extension XIP_SSI.IMR_Descriptor: RegisterValue {
}

extension XIP_SSI.ISR_Descriptor: RegisterValue {
}

extension XIP_SSI.RISR_Descriptor: RegisterValue {
}

extension XIP_SSI.TXOICR_Descriptor: RegisterValue {
}

extension XIP_SSI.RXOICR_Descriptor: RegisterValue {
}

extension XIP_SSI.RXUICR_Descriptor: RegisterValue {
}

extension XIP_SSI.MSTICR_Descriptor: RegisterValue {
}

extension XIP_SSI.ICR_Descriptor: RegisterValue {
}

extension XIP_SSI.DMACR_Descriptor: RegisterValue {
}

extension XIP_SSI.DMATDLR_Descriptor: RegisterValue {
}

extension XIP_SSI.DMARDLR_Descriptor: RegisterValue {
}

extension XIP_SSI.IDR_Descriptor: RegisterValue {
}

extension XIP_SSI.SSI_VERSION_ID_Descriptor: RegisterValue {
}

extension XIP_SSI.DR0_Descriptor: RegisterValue {
}

extension XIP_SSI.RX_SAMPLE_DLY_Descriptor: RegisterValue {
}

extension XIP_SSI.SPI_CTRLR0_Descriptor: RegisterValue {
}

extension XIP_SSI.TXD_DRIVE_EDGE_Descriptor: RegisterValue {
}
