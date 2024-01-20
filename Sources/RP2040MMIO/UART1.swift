import MMIO
import MMIOExtensions
public struct UART1 {

    public static var `default`: Self { .init(unsafeAddress: 0x40038000) }

    /// Data Register, UARTDR
    public var UARTDR: Register<UARTDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct UARTDR_Descriptor {
        @available(*, unavailable)
        /// Overrun error. This bit is set to 1 if data is received and the receive FIFO is already full. This is cleared to 0 once there is an empty space in the FIFO and a new character can be written to it.
        public var OE: OE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Break error. This bit is set to 1 if a break condition was detected, indicating that the received data input was held LOW for longer than a full-word transmission time (defined as start, data, parity and stop bits). In FIFO mode, this error is associated with the character at the top of the FIFO. When a break occurs, only one 0 character is loaded into the FIFO. The next character is only enabled after the receive data input goes to a 1 (marking state), and the next valid start bit is received.
        public var BE: BE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Parity error. When set to 1, it indicates that the parity of the received data character does not match the parity that the EPS and SPS bits in the Line Control Register, UARTLCR_H. In FIFO mode, this error is associated with the character at the top of the FIFO.
        public var PE: PE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Framing error. When set to 1, it indicates that the received character did not have a valid stop bit (a valid stop bit is 1). In FIFO mode, this error is associated with the character at the top of the FIFO.
        public var FE: FE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive (read) data character. Transmit (write) data character.
        public var DATA: DATA_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum BE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum PE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum FE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum DATA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTDR_Descriptor

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
                public var OE: UInt32 {
                @inlinable @inline(__always) get {
                    OE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var BE: UInt32 {
                @inlinable @inline(__always) get {
                  BE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PE: UInt32 {
                @inlinable @inline(__always) get {
                  PE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FE: UInt32 {
                @inlinable @inline(__always) get {
                  FE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FE_Field.insert(newValue, into: &self.storage)
                }
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

        public  struct Read: RegisterValueRead {

                    public  typealias Value = UARTDR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var OE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OE_Field.self, Bool.self)
                    return Bool(storage: self.raw.OE)
                }
                }
              public var BE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BE_Field.self, Bool.self)
                  return Bool(storage: self.raw.BE)
                }
              }
              public var PE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PE)
                }
              }
              public var FE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FE_Field.self, Bool.self)
                  return Bool(storage: self.raw.FE)
                }
              }
              public var DATA: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.DATA)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = UARTDR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var DATA: BitField8 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DATA_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.DATA)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DATA_Field.self, BitField8.self)
                    self.raw.DATA = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Receive Status Register/Error Clear Register, UARTRSR/UARTECR
    public var UARTRSR: Register<UARTRSR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct UARTRSR_Descriptor {
        @available(*, unavailable)
        /// Overrun error. This bit is set to 1 if data is received and the FIFO is already full. This bit is cleared to 0 by a write to UARTECR. The FIFO contents remain valid because no more data is written when the FIFO is full, only the contents of the shift register are overwritten. The CPU must now read the data, to empty the FIFO.
        public var OE: OE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Break error. This bit is set to 1 if a break condition was detected, indicating that the received data input was held LOW for longer than a full-word transmission time (defined as start, data, parity, and stop bits). This bit is cleared to 0 after a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO. When a break occurs, only one 0 character is loaded into the FIFO. The next character is only enabled after the receive data input goes to a 1 (marking state) and the next valid start bit is received.
        public var BE: BE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Parity error. When set to 1, it indicates that the parity of the received data character does not match the parity that the EPS and SPS bits in the Line Control Register, UARTLCR_H. This bit is cleared to 0 by a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO.
        public var PE: PE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Framing error. When set to 1, it indicates that the received character did not have a valid stop bit (a valid stop bit is 1). This bit is cleared to 0 by a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO.
        public var FE: FE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum BE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum FE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTRSR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OE: UInt32 {
                @inlinable @inline(__always) get {
                    OE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var BE: UInt32 {
                @inlinable @inline(__always) get {
                  BE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PE: UInt32 {
                @inlinable @inline(__always) get {
                  PE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FE: UInt32 {
                @inlinable @inline(__always) get {
                  FE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = UARTRSR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OE_Field.self, Bool.self)
                    return Bool(storage: self.raw.OE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OE_Field.self, Bool.self)
                    self.raw.OE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var BE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BE_Field.self, Bool.self)
                  return Bool(storage: self.raw.BE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BE_Field.self, Bool.self)
                  self.raw.BE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PE_Field.self, Bool.self)
                  return Bool(storage: self.raw.PE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PE_Field.self, Bool.self)
                  self.raw.PE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FE_Field.self, Bool.self)
                  return Bool(storage: self.raw.FE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FE_Field.self, Bool.self)
                  self.raw.FE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Flag Register, UARTFR
    public var UARTFR: Register<UARTFR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct UARTFR_Descriptor {
        @available(*, unavailable)
        /// Ring indicator. This bit is the complement of the UART ring indicator, nUARTRI, modem status input. That is, the bit is 1 when nUARTRI is LOW.
        public var RI: RI_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO empty. The meaning of this bit depends on the state of the FEN bit in the Line Control Register, UARTLCR_H. If the FIFO is disabled, this bit is set when the transmit holding register is empty. If the FIFO is enabled, the TXFE bit is set when the transmit FIFO is empty. This bit does not indicate if there is data in the transmit shift register.
        public var TXFE: TXFE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO full. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the receive holding register is full. If the FIFO is enabled, the RXFF bit is set when the receive FIFO is full.
        public var RXFF: RXFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit FIFO full. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the transmit holding register is full. If the FIFO is enabled, the TXFF bit is set when the transmit FIFO is full.
        public var TXFF: TXFF_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive FIFO empty. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the receive holding register is empty. If the FIFO is enabled, the RXFE bit is set when the receive FIFO is empty.
        public var RXFE: RXFE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// UART busy. If this bit is set to 1, the UART is busy transmitting data. This bit remains set until the complete byte, including all the stop bits, has been sent from the shift register. This bit is set as soon as the transmit FIFO becomes non-empty, regardless of whether the UART is enabled or not.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Data carrier detect. This bit is the complement of the UART data carrier detect, nUARTDCD, modem status input. That is, the bit is 1 when nUARTDCD is LOW.
        public var DCD: DCD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Data set ready. This bit is the complement of the UART data set ready, nUARTDSR, modem status input. That is, the bit is 1 when nUARTDSR is LOW.
        public var DSR: DSR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Clear to send. This bit is the complement of the UART clear to send, nUARTCTS, modem status input. That is, the bit is 1 when nUARTCTS is LOW.
        public var CTS: CTS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RI_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum TXFE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum RXFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum TXFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum RXFE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum DCD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum DSR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum CTS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTFR_Descriptor

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
                public var RI: UInt32 {
                @inlinable @inline(__always) get {
                    RI_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RI_Field.insert(newValue, into: &self.storage)
                }
                }
              public var TXFE: UInt32 {
                @inlinable @inline(__always) get {
                  TXFE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXFE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXFF: UInt32 {
                @inlinable @inline(__always) get {
                  RXFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TXFF: UInt32 {
                @inlinable @inline(__always) get {
                  TXFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXFE: UInt32 {
                @inlinable @inline(__always) get {
                  RXFE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXFE_Field.insert(newValue, into: &self.storage)
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
              public var DCD: UInt32 {
                @inlinable @inline(__always) get {
                  DCD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DCD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DSR: UInt32 {
                @inlinable @inline(__always) get {
                  DSR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DSR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CTS: UInt32 {
                @inlinable @inline(__always) get {
                  CTS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CTS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = UARTFR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RI: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RI_Field.self, Bool.self)
                    return Bool(storage: self.raw.RI)
                }
                }
              public var TXFE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXFE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXFE)
                }
              }
              public var RXFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXFF)
                }
              }
              public var TXFF: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXFF_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXFF)
                }
              }
              public var RXFE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXFE_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXFE)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var DCD: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DCD_Field.self, Bool.self)
                  return Bool(storage: self.raw.DCD)
                }
              }
              public var DSR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DSR_Field.self, Bool.self)
                  return Bool(storage: self.raw.DSR)
                }
              }
              public var CTS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CTS_Field.self, Bool.self)
                  return Bool(storage: self.raw.CTS)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = UARTFR_Descriptor
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

    /// IrDA Low-Power Counter Register, UARTILPR
    public var UARTILPR: Register<UARTILPR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct UARTILPR_Descriptor {
        @available(*, unavailable)
        /// 8-bit low-power divisor value. These bits are cleared to 0 at reset.
        public var ILPDVSR: ILPDVSR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ILPDVSR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTILPR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var ILPDVSR: UInt32 {
                @inlinable @inline(__always) get {
                    ILPDVSR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ILPDVSR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = UARTILPR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var ILPDVSR: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ILPDVSR_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.ILPDVSR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ILPDVSR_Field.self, BitField8.self)
                    self.raw.ILPDVSR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Integer Baud Rate Register, UARTIBRD
    public var UARTIBRD: Register<UARTIBRD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct UARTIBRD_Descriptor {
        @available(*, unavailable)
        /// The integer baud rate divisor. These bits are cleared to 0 on reset.
        public var BAUD_DIVINT: BAUD_DIVINT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum BAUD_DIVINT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTIBRD_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var BAUD_DIVINT: UInt32 {
                @inlinable @inline(__always) get {
                    BAUD_DIVINT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    BAUD_DIVINT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = UARTIBRD_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var BAUD_DIVINT: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(BAUD_DIVINT_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.BAUD_DIVINT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(BAUD_DIVINT_Field.self, BitField16.self)
                    self.raw.BAUD_DIVINT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Fractional Baud Rate Register, UARTFBRD
    public var UARTFBRD: Register<UARTFBRD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct UARTFBRD_Descriptor {
        @available(*, unavailable)
        /// The fractional baud rate divisor. These bits are cleared to 0 on reset.
        public var BAUD_DIVFRAC: BAUD_DIVFRAC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum BAUD_DIVFRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTFBRD_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var BAUD_DIVFRAC: UInt32 {
                @inlinable @inline(__always) get {
                    BAUD_DIVFRAC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    BAUD_DIVFRAC_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = UARTFBRD_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var BAUD_DIVFRAC: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(BAUD_DIVFRAC_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.BAUD_DIVFRAC)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(BAUD_DIVFRAC_Field.self, BitField6.self)
                    self.raw.BAUD_DIVFRAC = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Line Control Register, UARTLCR_H
    public var UARTLCR_H: Register<UARTLCR_H_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct UARTLCR_H_Descriptor {
        @available(*, unavailable)
        /// Stick parity select. 0 = stick parity is disabled 1 = either: * if the EPS bit is 0 then the parity bit is transmitted and checked as a 1 * if the EPS bit is 1 then the parity bit is transmitted and checked as a 0. This bit has no effect when the PEN bit disables parity checking and generation.
        public var SPS: SPS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Word length. These bits indicate the number of data bits transmitted or received in a frame as follows: b11 = 8 bits b10 = 7 bits b01 = 6 bits b00 = 5 bits.
        public var WLEN: WLEN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable FIFOs: 0 = FIFOs are disabled (character mode) that is, the FIFOs become 1-byte-deep holding registers 1 = transmit and receive FIFO buffers are enabled (FIFO mode).
        public var FEN: FEN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Two stop bits select. If this bit is set to 1, two stop bits are transmitted at the end of the frame. The receive logic does not check for two stop bits being received.
        public var STP2: STP2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Even parity select. Controls the type of parity the UART uses during transmission and reception: 0 = odd parity. The UART generates or checks for an odd number of 1s in the data and parity bits. 1 = even parity. The UART generates or checks for an even number of 1s in the data and parity bits. This bit has no effect when the PEN bit disables parity checking and generation.
        public var EPS: EPS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Parity enable: 0 = parity is disabled and no parity bit added to the data frame 1 = parity checking and generation is enabled.
        public var PEN: PEN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Send break. If this bit is set to 1, a low-level is continually output on the UARTTXD output, after completing transmission of the current character. For the proper execution of the break command, the software must set this bit for at least two complete frames. For normal use, this bit must be cleared to 0.
        public var BRK: BRK_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SPS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum WLEN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 7
        }

        public enum FEN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum STP2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum EPS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum PEN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum BRK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTLCR_H_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SPS: UInt32 {
                @inlinable @inline(__always) get {
                    SPS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SPS_Field.insert(newValue, into: &self.storage)
                }
                }
              public var WLEN: UInt32 {
                @inlinable @inline(__always) get {
                  WLEN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WLEN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FEN: UInt32 {
                @inlinable @inline(__always) get {
                  FEN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FEN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STP2: UInt32 {
                @inlinable @inline(__always) get {
                  STP2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STP2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var EPS: UInt32 {
                @inlinable @inline(__always) get {
                  EPS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  EPS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PEN: UInt32 {
                @inlinable @inline(__always) get {
                  PEN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PEN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BRK: UInt32 {
                @inlinable @inline(__always) get {
                  BRK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BRK_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = UARTLCR_H_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SPS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SPS_Field.self, Bool.self)
                    return Bool(storage: self.raw.SPS)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SPS_Field.self, Bool.self)
                    self.raw.SPS = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WLEN: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WLEN_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.WLEN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WLEN_Field.self, BitField2.self)
                  self.raw.WLEN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FEN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FEN_Field.self, Bool.self)
                  return Bool(storage: self.raw.FEN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FEN_Field.self, Bool.self)
                  self.raw.FEN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STP2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STP2_Field.self, Bool.self)
                  return Bool(storage: self.raw.STP2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STP2_Field.self, Bool.self)
                  self.raw.STP2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var EPS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(EPS_Field.self, Bool.self)
                  return Bool(storage: self.raw.EPS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(EPS_Field.self, Bool.self)
                  self.raw.EPS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PEN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PEN_Field.self, Bool.self)
                  return Bool(storage: self.raw.PEN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PEN_Field.self, Bool.self)
                  self.raw.PEN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BRK: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BRK_Field.self, Bool.self)
                  return Bool(storage: self.raw.BRK)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BRK_Field.self, Bool.self)
                  self.raw.BRK = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Control Register, UARTCR
    public var UARTCR: Register<UARTCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct UARTCR_Descriptor {
        @available(*, unavailable)
        /// CTS hardware flow control enable. If this bit is set to 1, CTS hardware flow control is enabled. Data is only transmitted when the nUARTCTS signal is asserted.
        public var CTSEN: CTSEN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// RTS hardware flow control enable. If this bit is set to 1, RTS hardware flow control is enabled. Data is only requested when there is space in the receive FIFO for it to be received.
        public var RTSEN: RTSEN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This bit is the complement of the UART Out2 (nUARTOut2) modem status output. That is, when the bit is programmed to a 1, the output is 0. For DTE this can be used as Ring Indicator (RI).
        public var OUT2: OUT2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This bit is the complement of the UART Out1 (nUARTOut1) modem status output. That is, when the bit is programmed to a 1 the output is 0. For DTE this can be used as Data Carrier Detect (DCD).
        public var OUT1: OUT1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Request to send. This bit is the complement of the UART request to send, nUARTRTS, modem status output. That is, when the bit is programmed to a 1 then nUARTRTS is LOW.
        public var RTS: RTS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Data transmit ready. This bit is the complement of the UART data transmit ready, nUARTDTR, modem status output. That is, when the bit is programmed to a 1 then nUARTDTR is LOW.
        public var DTR: DTR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive enable. If this bit is set to 1, the receive section of the UART is enabled. Data reception occurs for either UART signals or SIR signals depending on the setting of the SIREN bit. When the UART is disabled in the middle of reception, it completes the current character before stopping.
        public var RXE: RXE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit enable. If this bit is set to 1, the transmit section of the UART is enabled. Data transmission occurs for either UART signals, or SIR signals depending on the setting of the SIREN bit. When the UART is disabled in the middle of transmission, it completes the current character before stopping.
        public var TXE: TXE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Loopback enable. If this bit is set to 1 and the SIREN bit is set to 1 and the SIRTEST bit in the Test Control Register, UARTTCR is set to 1, then the nSIROUT path is inverted, and fed through to the SIRIN path. The SIRTEST bit in the test register must be set to 1 to override the normal half-duplex SIR operation. This must be the requirement for accessing the test registers during normal operation, and SIRTEST must be cleared to 0 when loopback testing is finished. This feature reduces the amount of external coupling required during system test. If this bit is set to 1, and the SIRTEST bit is set to 0, the UARTTXD path is fed through to the UARTRXD path. In either SIR mode or UART mode, when this bit is set, the modem outputs are also fed through to the modem inputs. This bit is cleared to 0 on reset, to disable loopback.
        public var LBE: LBE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// SIR low-power IrDA mode. This bit selects the IrDA encoding mode. If this bit is cleared to 0, low-level bits are transmitted as an active high pulse with a width of 3 / 16th of the bit period. If this bit is set to 1, low-level bits are transmitted with a pulse width that is 3 times the period of the IrLPBaud16 input signal, regardless of the selected bit rate. Setting this bit uses less power, but might reduce transmission distances.
        public var SIRLP: SIRLP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// SIR enable: 0 = IrDA SIR ENDEC is disabled. nSIROUT remains LOW (no light pulse generated), and signal transitions on SIRIN have no effect. 1 = IrDA SIR ENDEC is enabled. Data is transmitted and received on nSIROUT and SIRIN. UARTTXD remains HIGH, in the marking state. Signal transitions on UARTRXD or modem status inputs have no effect. This bit has no effect if the UARTEN bit disables the UART.
        public var SIREN: SIREN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// UART enable: 0 = UART is disabled. If the UART is disabled in the middle of transmission or reception, it completes the current character before stopping. 1 = the UART is enabled. Data transmission and reception occurs for either UART signals or SIR signals depending on the setting of the SIREN bit.
        public var UARTEN: UARTEN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CTSEN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum RTSEN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum OUT2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum OUT1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum RTS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum DTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RXE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum TXE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum LBE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum SIRLP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SIREN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum UARTEN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTCR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CTSEN: UInt32 {
                @inlinable @inline(__always) get {
                    CTSEN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CTSEN_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RTSEN: UInt32 {
                @inlinable @inline(__always) get {
                  RTSEN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RTSEN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT2: UInt32 {
                @inlinable @inline(__always) get {
                  OUT2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT1: UInt32 {
                @inlinable @inline(__always) get {
                  OUT1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RTS: UInt32 {
                @inlinable @inline(__always) get {
                  RTS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RTS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DTR: UInt32 {
                @inlinable @inline(__always) get {
                  DTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DTR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXE: UInt32 {
                @inlinable @inline(__always) get {
                  RXE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXE_Field.insert(newValue, into: &self.storage)
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
              public var LBE: UInt32 {
                @inlinable @inline(__always) get {
                  LBE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  LBE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIRLP: UInt32 {
                @inlinable @inline(__always) get {
                  SIRLP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIRLP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIREN: UInt32 {
                @inlinable @inline(__always) get {
                  SIREN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIREN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var UARTEN: UInt32 {
                @inlinable @inline(__always) get {
                  UARTEN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  UARTEN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = UARTCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CTSEN: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CTSEN_Field.self, Bool.self)
                    return Bool(storage: self.raw.CTSEN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CTSEN_Field.self, Bool.self)
                    self.raw.CTSEN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var RTSEN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RTSEN_Field.self, Bool.self)
                  return Bool(storage: self.raw.RTSEN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RTSEN_Field.self, Bool.self)
                  self.raw.RTSEN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT2_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT2_Field.self, Bool.self)
                  self.raw.OUT2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT1_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT1_Field.self, Bool.self)
                  self.raw.OUT1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RTS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RTS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RTS)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RTS_Field.self, Bool.self)
                  self.raw.RTS = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DTR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DTR_Field.self, Bool.self)
                  return Bool(storage: self.raw.DTR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DTR_Field.self, Bool.self)
                  self.raw.DTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RXE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXE_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RXE_Field.self, Bool.self)
                  self.raw.RXE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TXE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXE_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TXE_Field.self, Bool.self)
                  self.raw.TXE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var LBE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(LBE_Field.self, Bool.self)
                  return Bool(storage: self.raw.LBE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(LBE_Field.self, Bool.self)
                  self.raw.LBE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIRLP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIRLP_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIRLP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIRLP_Field.self, Bool.self)
                  self.raw.SIRLP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIREN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIREN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIREN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIREN_Field.self, Bool.self)
                  self.raw.SIREN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var UARTEN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(UARTEN_Field.self, Bool.self)
                  return Bool(storage: self.raw.UARTEN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(UARTEN_Field.self, Bool.self)
                  self.raw.UARTEN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt FIFO Level Select Register, UARTIFLS
    public var UARTIFLS: Register<UARTIFLS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct UARTIFLS_Descriptor {
        @available(*, unavailable)
        /// Receive interrupt FIFO level select. The trigger points for the receive interrupt are as follows: b000 = Receive FIFO becomes >= 1 / 8 full b001 = Receive FIFO becomes >= 1 / 4 full b010 = Receive FIFO becomes >= 1 / 2 full b011 = Receive FIFO becomes >= 3 / 4 full b100 = Receive FIFO becomes >= 7 / 8 full b101-b111 = reserved.
        public var RXIFLSEL: RXIFLSEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit interrupt FIFO level select. The trigger points for the transmit interrupt are as follows: b000 = Transmit FIFO becomes <= 1 / 8 full b001 = Transmit FIFO becomes <= 1 / 4 full b010 = Transmit FIFO becomes <= 1 / 2 full b011 = Transmit FIFO becomes <= 3 / 4 full b100 = Transmit FIFO becomes <= 7 / 8 full b101-b111 = reserved.
        public var TXIFLSEL: TXIFLSEL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RXIFLSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 6
        }

        public enum TXIFLSEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 3
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTIFLS_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var RXIFLSEL: UInt32 {
                @inlinable @inline(__always) get {
                    RXIFLSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RXIFLSEL_Field.insert(newValue, into: &self.storage)
                }
                }
              public var TXIFLSEL: UInt32 {
                @inlinable @inline(__always) get {
                  TXIFLSEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXIFLSEL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = UARTIFLS_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var RXIFLSEL: BitField3 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RXIFLSEL_Field.self, BitField3.self)
                    return BitField3(storage: self.raw.RXIFLSEL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RXIFLSEL_Field.self, BitField3.self)
                    self.raw.RXIFLSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var TXIFLSEL: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXIFLSEL_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.TXIFLSEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TXIFLSEL_Field.self, BitField3.self)
                  self.raw.TXIFLSEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Mask Set/Clear Register, UARTIMSC
    public var UARTIMSC: Register<UARTIMSC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct UARTIMSC_Descriptor {
        @available(*, unavailable)
        /// Overrun error interrupt mask. A read returns the current mask for the UARTOEINTR interrupt. On a write of 1, the mask of the UARTOEINTR interrupt is set. A write of 0 clears the mask.
        public var OEIM: OEIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Break error interrupt mask. A read returns the current mask for the UARTBEINTR interrupt. On a write of 1, the mask of the UARTBEINTR interrupt is set. A write of 0 clears the mask.
        public var BEIM: BEIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Parity error interrupt mask. A read returns the current mask for the UARTPEINTR interrupt. On a write of 1, the mask of the UARTPEINTR interrupt is set. A write of 0 clears the mask.
        public var PEIM: PEIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Framing error interrupt mask. A read returns the current mask for the UARTFEINTR interrupt. On a write of 1, the mask of the UARTFEINTR interrupt is set. A write of 0 clears the mask.
        public var FEIM: FEIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive timeout interrupt mask. A read returns the current mask for the UARTRTINTR interrupt. On a write of 1, the mask of the UARTRTINTR interrupt is set. A write of 0 clears the mask.
        public var RTIM: RTIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit interrupt mask. A read returns the current mask for the UARTTXINTR interrupt. On a write of 1, the mask of the UARTTXINTR interrupt is set. A write of 0 clears the mask.
        public var TXIM: TXIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive interrupt mask. A read returns the current mask for the UARTRXINTR interrupt. On a write of 1, the mask of the UARTRXINTR interrupt is set. A write of 0 clears the mask.
        public var RXIM: RXIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTDSR modem interrupt mask. A read returns the current mask for the UARTDSRINTR interrupt. On a write of 1, the mask of the UARTDSRINTR interrupt is set. A write of 0 clears the mask.
        public var DSRMIM: DSRMIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTDCD modem interrupt mask. A read returns the current mask for the UARTDCDINTR interrupt. On a write of 1, the mask of the UARTDCDINTR interrupt is set. A write of 0 clears the mask.
        public var DCDMIM: DCDMIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTCTS modem interrupt mask. A read returns the current mask for the UARTCTSINTR interrupt. On a write of 1, the mask of the UARTCTSINTR interrupt is set. A write of 0 clears the mask.
        public var CTSMIM: CTSMIM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTRI modem interrupt mask. A read returns the current mask for the UARTRIINTR interrupt. On a write of 1, the mask of the UARTRIINTR interrupt is set. A write of 0 clears the mask.
        public var RIMIM: RIMIM_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OEIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum BEIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum PEIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum FEIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum RTIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum TXIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum RXIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DSRMIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum DCDMIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum CTSMIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RIMIM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTIMSC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OEIM: UInt32 {
                @inlinable @inline(__always) get {
                    OEIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OEIM_Field.insert(newValue, into: &self.storage)
                }
                }
              public var BEIM: UInt32 {
                @inlinable @inline(__always) get {
                  BEIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BEIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PEIM: UInt32 {
                @inlinable @inline(__always) get {
                  PEIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PEIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FEIM: UInt32 {
                @inlinable @inline(__always) get {
                  FEIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FEIM_Field.insert(newValue, into: &self.storage)
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
              public var DSRMIM: UInt32 {
                @inlinable @inline(__always) get {
                  DSRMIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DSRMIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DCDMIM: UInt32 {
                @inlinable @inline(__always) get {
                  DCDMIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DCDMIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CTSMIM: UInt32 {
                @inlinable @inline(__always) get {
                  CTSMIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CTSMIM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RIMIM: UInt32 {
                @inlinable @inline(__always) get {
                  RIMIM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RIMIM_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = UARTIMSC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OEIM: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OEIM_Field.self, Bool.self)
                    return Bool(storage: self.raw.OEIM)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OEIM_Field.self, Bool.self)
                    self.raw.OEIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var BEIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BEIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.BEIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BEIM_Field.self, Bool.self)
                  self.raw.BEIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PEIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PEIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.PEIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PEIM_Field.self, Bool.self)
                  self.raw.PEIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FEIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FEIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.FEIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FEIM_Field.self, Bool.self)
                  self.raw.FEIM = newValue.storage(Self.Value.Raw.Storage.self)
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
              public var DSRMIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DSRMIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.DSRMIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DSRMIM_Field.self, Bool.self)
                  self.raw.DSRMIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DCDMIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DCDMIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.DCDMIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DCDMIM_Field.self, Bool.self)
                  self.raw.DCDMIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CTSMIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CTSMIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.CTSMIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CTSMIM_Field.self, Bool.self)
                  self.raw.CTSMIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RIMIM: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RIMIM_Field.self, Bool.self)
                  return Bool(storage: self.raw.RIMIM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RIMIM_Field.self, Bool.self)
                  self.raw.RIMIM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Raw Interrupt Status Register, UARTRIS
    public var UARTRIS: Register<UARTRIS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct UARTRIS_Descriptor {
        @available(*, unavailable)
        /// Overrun error interrupt status. Returns the raw interrupt state of the UARTOEINTR interrupt.
        public var OERIS: OERIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Break error interrupt status. Returns the raw interrupt state of the UARTBEINTR interrupt.
        public var BERIS: BERIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Parity error interrupt status. Returns the raw interrupt state of the UARTPEINTR interrupt.
        public var PERIS: PERIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Framing error interrupt status. Returns the raw interrupt state of the UARTFEINTR interrupt.
        public var FERIS: FERIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive timeout interrupt status. Returns the raw interrupt state of the UARTRTINTR interrupt. a
        public var RTRIS: RTRIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit interrupt status. Returns the raw interrupt state of the UARTTXINTR interrupt.
        public var TXRIS: TXRIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive interrupt status. Returns the raw interrupt state of the UARTRXINTR interrupt.
        public var RXRIS: RXRIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTDSR modem interrupt status. Returns the raw interrupt state of the UARTDSRINTR interrupt.
        public var DSRRMIS: DSRRMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTDCD modem interrupt status. Returns the raw interrupt state of the UARTDCDINTR interrupt.
        public var DCDRMIS: DCDRMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTCTS modem interrupt status. Returns the raw interrupt state of the UARTCTSINTR interrupt.
        public var CTSRMIS: CTSRMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTRI modem interrupt status. Returns the raw interrupt state of the UARTRIINTR interrupt.
        public var RIRMIS: RIRMIS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OERIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum BERIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum PERIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum FERIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum RTRIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum TXRIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum RXRIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DSRRMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum DCDRMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum CTSRMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RIRMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTRIS_Descriptor

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
                public var OERIS: UInt32 {
                @inlinable @inline(__always) get {
                    OERIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OERIS_Field.insert(newValue, into: &self.storage)
                }
                }
              public var BERIS: UInt32 {
                @inlinable @inline(__always) get {
                  BERIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BERIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PERIS: UInt32 {
                @inlinable @inline(__always) get {
                  PERIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PERIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FERIS: UInt32 {
                @inlinable @inline(__always) get {
                  FERIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FERIS_Field.insert(newValue, into: &self.storage)
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
              public var DSRRMIS: UInt32 {
                @inlinable @inline(__always) get {
                  DSRRMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DSRRMIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DCDRMIS: UInt32 {
                @inlinable @inline(__always) get {
                  DCDRMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DCDRMIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CTSRMIS: UInt32 {
                @inlinable @inline(__always) get {
                  CTSRMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CTSRMIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RIRMIS: UInt32 {
                @inlinable @inline(__always) get {
                  RIRMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RIRMIS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = UARTRIS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var OERIS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OERIS_Field.self, Bool.self)
                    return Bool(storage: self.raw.OERIS)
                }
                }
              public var BERIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BERIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.BERIS)
                }
              }
              public var PERIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PERIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.PERIS)
                }
              }
              public var FERIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FERIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.FERIS)
                }
              }
              public var RTRIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RTRIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RTRIS)
                }
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
              public var DSRRMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DSRRMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.DSRRMIS)
                }
              }
              public var DCDRMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DCDRMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.DCDRMIS)
                }
              }
              public var CTSRMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CTSRMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.CTSRMIS)
                }
              }
              public var RIRMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RIRMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RIRMIS)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = UARTRIS_Descriptor
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

    /// Masked Interrupt Status Register, UARTMIS
    public var UARTMIS: Register<UARTMIS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct UARTMIS_Descriptor {
        @available(*, unavailable)
        /// Overrun error masked interrupt status. Returns the masked interrupt state of the UARTOEINTR interrupt.
        public var OEMIS: OEMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Break error masked interrupt status. Returns the masked interrupt state of the UARTBEINTR interrupt.
        public var BEMIS: BEMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Parity error masked interrupt status. Returns the masked interrupt state of the UARTPEINTR interrupt.
        public var PEMIS: PEMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Framing error masked interrupt status. Returns the masked interrupt state of the UARTFEINTR interrupt.
        public var FEMIS: FEMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive timeout masked interrupt status. Returns the masked interrupt state of the UARTRTINTR interrupt.
        public var RTMIS: RTMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit masked interrupt status. Returns the masked interrupt state of the UARTTXINTR interrupt.
        public var TXMIS: TXMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive masked interrupt status. Returns the masked interrupt state of the UARTRXINTR interrupt.
        public var RXMIS: RXMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTDSR modem masked interrupt status. Returns the masked interrupt state of the UARTDSRINTR interrupt.
        public var DSRMMIS: DSRMMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTDCD modem masked interrupt status. Returns the masked interrupt state of the UARTDCDINTR interrupt.
        public var DCDMMIS: DCDMMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTCTS modem masked interrupt status. Returns the masked interrupt state of the UARTCTSINTR interrupt.
        public var CTSMMIS: CTSMMIS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTRI modem masked interrupt status. Returns the masked interrupt state of the UARTRIINTR interrupt.
        public var RIMMIS: RIMMIS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OEMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum BEMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum PEMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum FEMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum RTMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum TXMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum RXMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DSRMMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum DCDMMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum CTSMMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RIMMIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTMIS_Descriptor

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
                public var OEMIS: UInt32 {
                @inlinable @inline(__always) get {
                    OEMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OEMIS_Field.insert(newValue, into: &self.storage)
                }
                }
              public var BEMIS: UInt32 {
                @inlinable @inline(__always) get {
                  BEMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BEMIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PEMIS: UInt32 {
                @inlinable @inline(__always) get {
                  PEMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PEMIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FEMIS: UInt32 {
                @inlinable @inline(__always) get {
                  FEMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FEMIS_Field.insert(newValue, into: &self.storage)
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
              public var DSRMMIS: UInt32 {
                @inlinable @inline(__always) get {
                  DSRMMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DSRMMIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DCDMMIS: UInt32 {
                @inlinable @inline(__always) get {
                  DCDMMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DCDMMIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CTSMMIS: UInt32 {
                @inlinable @inline(__always) get {
                  CTSMMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CTSMMIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RIMMIS: UInt32 {
                @inlinable @inline(__always) get {
                  RIMMIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RIMMIS_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = UARTMIS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var OEMIS: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OEMIS_Field.self, Bool.self)
                    return Bool(storage: self.raw.OEMIS)
                }
                }
              public var BEMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BEMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.BEMIS)
                }
              }
              public var PEMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PEMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.PEMIS)
                }
              }
              public var FEMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FEMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.FEMIS)
                }
              }
              public var RTMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RTMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RTMIS)
                }
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
              public var DSRMMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DSRMMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.DSRMMIS)
                }
              }
              public var DCDMMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DCDMMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.DCDMMIS)
                }
              }
              public var CTSMMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CTSMMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.CTSMMIS)
                }
              }
              public var RIMMIS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RIMMIS_Field.self, Bool.self)
                  return Bool(storage: self.raw.RIMMIS)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = UARTMIS_Descriptor
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

    /// Interrupt Clear Register, UARTICR
    public var UARTICR: Register<UARTICR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct UARTICR_Descriptor {
        @available(*, unavailable)
        /// Overrun error interrupt clear. Clears the UARTOEINTR interrupt.
        public var OEIC: OEIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Break error interrupt clear. Clears the UARTBEINTR interrupt.
        public var BEIC: BEIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Parity error interrupt clear. Clears the UARTPEINTR interrupt.
        public var PEIC: PEIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Framing error interrupt clear. Clears the UARTFEINTR interrupt.
        public var FEIC: FEIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive timeout interrupt clear. Clears the UARTRTINTR interrupt.
        public var RTIC: RTIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit interrupt clear. Clears the UARTTXINTR interrupt.
        public var TXIC: TXIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive interrupt clear. Clears the UARTRXINTR interrupt.
        public var RXIC: RXIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTDSR modem interrupt clear. Clears the UARTDSRINTR interrupt.
        public var DSRMIC: DSRMIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTDCD modem interrupt clear. Clears the UARTDCDINTR interrupt.
        public var DCDMIC: DCDMIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTCTS modem interrupt clear. Clears the UARTCTSINTR interrupt.
        public var CTSMIC: CTSMIC_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// nUARTRI modem interrupt clear. Clears the UARTRIINTR interrupt.
        public var RIMIC: RIMIC_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OEIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum BEIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum PEIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum FEIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum RTIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum TXIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum RXIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DSRMIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum DCDMIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum CTSMIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RIMIC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTICR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OEIC: UInt32 {
                @inlinable @inline(__always) get {
                    OEIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OEIC_Field.insert(newValue, into: &self.storage)
                }
                }
              public var BEIC: UInt32 {
                @inlinable @inline(__always) get {
                  BEIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BEIC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PEIC: UInt32 {
                @inlinable @inline(__always) get {
                  PEIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PEIC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FEIC: UInt32 {
                @inlinable @inline(__always) get {
                  FEIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FEIC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RTIC: UInt32 {
                @inlinable @inline(__always) get {
                  RTIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RTIC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TXIC: UInt32 {
                @inlinable @inline(__always) get {
                  TXIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXIC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXIC: UInt32 {
                @inlinable @inline(__always) get {
                  RXIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXIC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DSRMIC: UInt32 {
                @inlinable @inline(__always) get {
                  DSRMIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DSRMIC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DCDMIC: UInt32 {
                @inlinable @inline(__always) get {
                  DCDMIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DCDMIC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CTSMIC: UInt32 {
                @inlinable @inline(__always) get {
                  CTSMIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CTSMIC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RIMIC: UInt32 {
                @inlinable @inline(__always) get {
                  RIMIC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RIMIC_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = UARTICR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OEIC: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OEIC_Field.self, Bool.self)
                    return Bool(storage: self.raw.OEIC)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OEIC_Field.self, Bool.self)
                    self.raw.OEIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var BEIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BEIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.BEIC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BEIC_Field.self, Bool.self)
                  self.raw.BEIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PEIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PEIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.PEIC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PEIC_Field.self, Bool.self)
                  self.raw.PEIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var FEIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FEIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.FEIC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FEIC_Field.self, Bool.self)
                  self.raw.FEIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
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
              public var TXIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.TXIC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TXIC_Field.self, Bool.self)
                  self.raw.TXIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RXIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.RXIC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RXIC_Field.self, Bool.self)
                  self.raw.RXIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DSRMIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DSRMIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.DSRMIC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DSRMIC_Field.self, Bool.self)
                  self.raw.DSRMIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DCDMIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DCDMIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.DCDMIC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DCDMIC_Field.self, Bool.self)
                  self.raw.DCDMIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CTSMIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CTSMIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.CTSMIC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CTSMIC_Field.self, Bool.self)
                  self.raw.CTSMIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RIMIC: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RIMIC_Field.self, Bool.self)
                  return Bool(storage: self.raw.RIMIC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RIMIC_Field.self, Bool.self)
                  self.raw.RIMIC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// DMA Control Register, UARTDMACR
    public var UARTDMACR: Register<UARTDMACR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct UARTDMACR_Descriptor {
        @available(*, unavailable)
        /// DMA on error. If this bit is set to 1, the DMA receive request outputs, UARTRXDMASREQ or UARTRXDMABREQ, are disabled when the UART error interrupt is asserted.
        public var DMAONERR: DMAONERR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Transmit DMA enable. If this bit is set to 1, DMA for the transmit FIFO is enabled.
        public var TXDMAE: TXDMAE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Receive DMA enable. If this bit is set to 1, DMA for the receive FIFO is enabled.
        public var RXDMAE: RXDMAE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DMAONERR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum TXDMAE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RXDMAE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTDMACR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DMAONERR: UInt32 {
                @inlinable @inline(__always) get {
                    DMAONERR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DMAONERR_Field.insert(newValue, into: &self.storage)
                }
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

                    public  typealias Value = UARTDMACR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DMAONERR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DMAONERR_Field.self, Bool.self)
                    return Bool(storage: self.raw.DMAONERR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DMAONERR_Field.self, Bool.self)
                    self.raw.DMAONERR = newValue.storage(Self.Value.Raw.Storage.self)
                }
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

    /// UARTPeriphID0 Register
    public var UARTPERIPHID0: Register<UARTPERIPHID0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe0))
          #endif
        }
    }
    public struct UARTPERIPHID0_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0x11
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

                    public  typealias Value = UARTPERIPHID0_Descriptor

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

                    public  typealias Value = UARTPERIPHID0_Descriptor
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

                    public  typealias Value = UARTPERIPHID0_Descriptor
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

    /// UARTPeriphID1 Register
    public var UARTPERIPHID1: Register<UARTPERIPHID1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe4))
          #endif
        }
    }
    public struct UARTPERIPHID1_Descriptor {
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

                    public  typealias Value = UARTPERIPHID1_Descriptor

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

                    public  typealias Value = UARTPERIPHID1_Descriptor
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

                    public  typealias Value = UARTPERIPHID1_Descriptor
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

    /// UARTPeriphID2 Register
    public var UARTPERIPHID2: Register<UARTPERIPHID2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0fe8))
          #endif
        }
    }
    public struct UARTPERIPHID2_Descriptor {
        @available(*, unavailable)
        /// This field depends on the revision of the UART: r1p0 0x0 r1p1 0x1 r1p3 0x2 r1p4 0x2 r1p5 0x3
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

                    public  typealias Value = UARTPERIPHID2_Descriptor

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

                    public  typealias Value = UARTPERIPHID2_Descriptor
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

                    public  typealias Value = UARTPERIPHID2_Descriptor
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

    /// UARTPeriphID3 Register
    public var UARTPERIPHID3: Register<UARTPERIPHID3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0fec), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0fec))
          #endif
        }
    }
    public struct UARTPERIPHID3_Descriptor {
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

                    public  typealias Value = UARTPERIPHID3_Descriptor

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

                    public  typealias Value = UARTPERIPHID3_Descriptor
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

                    public  typealias Value = UARTPERIPHID3_Descriptor
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

    /// UARTPCellID0 Register
    public var UARTPCELLID0: Register<UARTPCELLID0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff0))
          #endif
        }
    }
    public struct UARTPCELLID0_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0x0D
        public var UARTPCELLID0: UARTPCELLID0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum UARTPCELLID0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTPCELLID0_Descriptor

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
                public var UARTPCELLID0: UInt32 {
                @inlinable @inline(__always) get {
                    UARTPCELLID0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    UARTPCELLID0_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = UARTPCELLID0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var UARTPCELLID0: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(UARTPCELLID0_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.UARTPCELLID0)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = UARTPCELLID0_Descriptor
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

    /// UARTPCellID1 Register
    public var UARTPCELLID1: Register<UARTPCELLID1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff4))
          #endif
        }
    }
    public struct UARTPCELLID1_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0xF0
        public var UARTPCELLID1: UARTPCELLID1_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum UARTPCELLID1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTPCELLID1_Descriptor

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
                public var UARTPCELLID1: UInt32 {
                @inlinable @inline(__always) get {
                    UARTPCELLID1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    UARTPCELLID1_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = UARTPCELLID1_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var UARTPCELLID1: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(UARTPCELLID1_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.UARTPCELLID1)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = UARTPCELLID1_Descriptor
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

    /// UARTPCellID2 Register
    public var UARTPCELLID2: Register<UARTPCELLID2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0ff8))
          #endif
        }
    }
    public struct UARTPCELLID2_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0x05
        public var UARTPCELLID2: UARTPCELLID2_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum UARTPCELLID2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTPCELLID2_Descriptor

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
                public var UARTPCELLID2: UInt32 {
                @inlinable @inline(__always) get {
                    UARTPCELLID2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    UARTPCELLID2_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = UARTPCELLID2_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var UARTPCELLID2: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(UARTPCELLID2_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.UARTPCELLID2)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = UARTPCELLID2_Descriptor
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

    /// UARTPCellID3 Register
    public var UARTPCELLID3: Register<UARTPCELLID3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0ffc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0ffc))
          #endif
        }
    }
    public struct UARTPCELLID3_Descriptor {
        @available(*, unavailable)
        /// These bits read back as 0xB1
        public var UARTPCELLID3: UARTPCELLID3_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum UARTPCELLID3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = UARTPCELLID3_Descriptor

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
                public var UARTPCELLID3: UInt32 {
                @inlinable @inline(__always) get {
                    UARTPCELLID3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    UARTPCELLID3_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = UARTPCELLID3_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var UARTPCELLID3: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(UARTPCELLID3_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.UARTPCELLID3)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = UARTPCELLID3_Descriptor
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

extension UART1.UARTDR_Descriptor: RegisterValue {
}

extension UART1.UARTRSR_Descriptor: RegisterValue {
}

extension UART1.UARTFR_Descriptor: RegisterValue {
}

extension UART1.UARTILPR_Descriptor: RegisterValue {
}

extension UART1.UARTIBRD_Descriptor: RegisterValue {
}

extension UART1.UARTFBRD_Descriptor: RegisterValue {
}

extension UART1.UARTLCR_H_Descriptor: RegisterValue {
}

extension UART1.UARTCR_Descriptor: RegisterValue {
}

extension UART1.UARTIFLS_Descriptor: RegisterValue {
}

extension UART1.UARTIMSC_Descriptor: RegisterValue {
}

extension UART1.UARTRIS_Descriptor: RegisterValue {
}

extension UART1.UARTMIS_Descriptor: RegisterValue {
}

extension UART1.UARTICR_Descriptor: RegisterValue {
}

extension UART1.UARTDMACR_Descriptor: RegisterValue {
}

extension UART1.UARTPERIPHID0_Descriptor: RegisterValue {
}

extension UART1.UARTPERIPHID1_Descriptor: RegisterValue {
}

extension UART1.UARTPERIPHID2_Descriptor: RegisterValue {
}

extension UART1.UARTPERIPHID3_Descriptor: RegisterValue {
}

extension UART1.UARTPCELLID0_Descriptor: RegisterValue {
}

extension UART1.UARTPCELLID1_Descriptor: RegisterValue {
}

extension UART1.UARTPCELLID2_Descriptor: RegisterValue {
}

extension UART1.UARTPCELLID3_Descriptor: RegisterValue {
}
